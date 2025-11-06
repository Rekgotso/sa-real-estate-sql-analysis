-- ============================================================================
-- South African Real Estate Database - Table Creation Script
-- ============================================================================
-- This script creates all tables needed for the SA real estate analysis project
-- Run this entire file to set up your database schema
-- ============================================================================

-- Create and use the database
DROP DATABASE IF EXISTS sa_real_estate;
CREATE DATABASE sa_real_estate;
USE sa_real_estate;

-- ============================================================================
-- TABLE 1: AGENTS
-- ============================================================================
-- Must be created first due to foreign key dependency in properties table

CREATE TABLE agents (
    agent_id INT PRIMARY KEY,
    agent_name VARCHAR(100) NOT NULL,
    agency_name VARCHAR(150) NOT NULL,
    contact_number VARCHAR(20),
    email VARCHAR(100),
    city VARCHAR(100),
    
    -- Indexes for performance
    INDEX idx_agent_city (city),
    INDEX idx_agency (agency_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- TABLE 2: NEIGHBORHOODS
-- ============================================================================

CREATE TABLE neighborhoods (
    neighborhood_id INT PRIMARY KEY,
    neighborhood_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    province VARCHAR(100) NOT NULL,
    avg_income_bracket VARCHAR(50),
    crime_rating INT CHECK (crime_rating BETWEEN 1 AND 10),
    school_rating INT CHECK (school_rating BETWEEN 1 AND 10),
    distance_to_cbd_km DECIMAL(5,2),
    
    -- Indexes for performance
    INDEX idx_neighborhood_city (city),
    INDEX idx_neighborhood_name (neighborhood_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- TABLE 3: PROPERTIES (Main Table)
-- ============================================================================

CREATE TABLE properties (
    property_id INT PRIMARY KEY,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    province VARCHAR(100) NOT NULL,
    property_type VARCHAR(50) NOT NULL COMMENT 'House, Apartment, Townhouse, Farm, Commercial',
    bedrooms INT,
    bathrooms DECIMAL(3,1),
    parking_spaces INT,
    size_sqm DECIMAL(10,2) COMMENT 'Interior size in square meters',
    erf_size_sqm DECIMAL(10,2) COMMENT 'Plot/land size in square meters',
    listing_price DECIMAL(15,2) NOT NULL,
    listing_date DATE NOT NULL,
    sale_date DATE,
    sale_price DECIMAL(15,2),
    agent_id INT,
    status VARCHAR(20) NOT NULL COMMENT 'Listed, Under Offer, Sold, Withdrawn',
    
    -- Foreign key constraint
    FOREIGN KEY (agent_id) REFERENCES agents(agent_id),
    
    -- Indexes for common queries
    INDEX idx_city (city),
    INDEX idx_property_type (property_type),
    INDEX idx_status (status),
    INDEX idx_listing_date (listing_date),
    INDEX idx_sale_date (sale_date),
    INDEX idx_price (listing_price),
    INDEX idx_city_type (city, property_type),
    INDEX idx_status_city (status, city),
    INDEX idx_agent (agent_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- TABLE 4: PROPERTY_FEATURES
-- ============================================================================

CREATE TABLE property_features (
    feature_id INT PRIMARY KEY,
    property_id INT NOT NULL,
    has_pool BOOLEAN DEFAULT FALSE,
    has_garden BOOLEAN DEFAULT FALSE,
    has_security BOOLEAN DEFAULT FALSE,
    has_solar_panels BOOLEAN DEFAULT FALSE COMMENT 'Important for load shedding',
    has_borehole BOOLEAN DEFAULT FALSE COMMENT 'Water security',
    pet_friendly BOOLEAN DEFAULT FALSE,
    furnished BOOLEAN DEFAULT FALSE,
    
    -- Foreign key with cascade delete
    FOREIGN KEY (property_id) REFERENCES properties(property_id) ON DELETE CASCADE,
    
    -- Indexes for feature-based queries
    INDEX idx_property_id (property_id),
    INDEX idx_pool (has_pool),
    INDEX idx_solar (has_solar_panels),
    INDEX idx_security (has_security),
    INDEX idx_borehole (has_borehole)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- TABLE 5: PRICE_HISTORY
-- ============================================================================

CREATE TABLE price_history (
    history_id INT PRIMARY KEY,
    property_id INT NOT NULL,
    price_change_date DATE NOT NULL,
    old_price DECIMAL(15,2) NOT NULL,
    new_price DECIMAL(15,2) NOT NULL,
    reason VARCHAR(100),
    
    -- Foreign key with cascade delete
    FOREIGN KEY (property_id) REFERENCES properties(property_id) ON DELETE CASCADE,
    
    -- Indexes for tracking price changes
    INDEX idx_property_history (property_id),
    INDEX idx_change_date (price_change_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- VERIFICATION: Display table structure
-- ============================================================================

SHOW TABLES;

-- Display structure of each table
DESCRIBE agents;
DESCRIBE neighborhoods;
DESCRIBE properties;
DESCRIBE property_features;
DESCRIBE price_history;

-- ============================================================================
-- SUCCESS MESSAGE
-- ============================================================================

SELECT 'Database schema created successfully!' AS status,
       'You can now import your CSV data into these tables.' AS next_step;
# Natural Disaster Coordination 
# Implementing coordination between available resources, available rescue teams, and locations affected by natural disasters

# Database Description:  This has been designed for Natural Disaster Coordination, providing a platform to manage and streamline disaster response efforts. It focuses on efficiently 
# organizing critical information about affected locations, available resources, and specialized rescue teams. By connecting these elements, the database enables disaster response organizations 
# to coordinate efforts more effectively, minimize response times, and optimize the allocation of resources.

# Problem trying to be solved with database:  This database addresses the challenges of managing disaster response efforts by organizing information about affected locations, available resources, 
# and specialized rescue teams. It helps disaster response organizations identify regional needs, allocate resources efficiently, and deploy teams with the appropriate specializations. Additionally, it 
# supports real-time communication and tracks the status of ongoing missions, allowing for clear coordination and efficient mission advancement.


CREATE DATABASE Natural_Disaster_Coordination_db;
USE Natural_Disaster_Coordination_db;

CREATE TABLE Affected_Locations (
	Location_id INT AUTO_INCREMENT PRIMARY KEY,
	Region VARCHAR (100),
	Country VARCHAR (100),
	Subregion VARCHAR (100),
	Latitude DECIMAL(9, 6),
	Longitude DECIMAL(9, 6),
	Disaster_type ENUM ('Earthquake', 'Wildfire', 'Hurricanes','Flooding','Drought','Tsunamis','Tornadoes','Volcano Eruption','Avalanche'), 
	Name_of_Disaster VARCHAR (250),
	Severity ENUM ('Low', 'Medium', 'High'), 
	Population_Affected INT, 
	Date_Reported DATE, 
	Action_Required ENUM ('Evacuation','Medical Assistance','Search and Rescue','No Assistance Required') 
);

INSERT INTO Affected_Locations (Location_id, Region, Country, Subregion, Latitude, Longitude, Disaster_type, Name_of_Disaster, Severity, Population_Affected, Date_Reported, Action_Required) VALUES
(1, 'Pacific Region', 'United States (Hawaii)', 'Polynesian Subregion of Oceania', 19.4069, -155.2834, 'Volcano Eruption', 'Kīlauea Volcano', 'Low', 3000, '2024-09-16', 'Medical Assistance'),
(2, 'West Africa', 'Nigeria', 'Western Africa', 9.0820, 8.6753, 'Flooding', 'Floods in Nigeria', 'High', 1279094, '2024-10-15', 'Evacuation'),
(3, 'North Region', 'Brazil', 'Amazônia Legal region', -3.4653, -62.2159, 'Wildfire', 'Brazilian Rainforest Fires', 'High', 11075320, '2024-09-17', 'Evacuation'),
(4, 'Southeastern Region', 'United States (Florida)', 'South Atlantic', 27.6648, -81.5158, 'Hurricanes', 'Hurricane Helene', 'High', 6571000, '2024-09-24', 'Evacuation'),
(5, 'Americas Region', 'Cuba', 'Caribbean Region', 21.5218, -77.7812, 'Earthquake', 'Earthquake in Cuba', 'Medium', 20000, '2024-11-10', 'Medical Assistance'),
(6, 'South Asia', 'India', 'Eastern India', 21.1458, 87.8550, 'Flooding', 'Bihar Floods', 'High', 1350000, '2024-08-20', 'Evacuation'),
(7, 'East Africa', 'Ethiopia', 'Horn of Africa', 9.1450, 39.8200, 'Drought', 'East Africa Drought', 'High', 2200000, '2024-06-15', 'Medical Assistance'),
(8, 'Pacific Region', 'Japan', 'Honshu', 35.6895, 138.7274, 'Tsunamis', 'Japan Tsunami', 'High', 1200000, '2024-03-11', 'Search and Rescue'),
(9, 'Central America', 'Guatemala', 'Western Highlands', 15.7835, -91.2500, 'Earthquake', 'Guatemala Earthquake', 'Medium', 250000, '2024-05-10', 'Medical Assistance'),
(10, 'Western Europe', 'France', 'Southern France', 43.6108, 3.8772, 'Wildfire', 'France Wildfires', 'Medium', 75000, '2024-07-22', 'Evacuation'),
(11, 'Southern Asia', 'Pakistan', 'Sindh', 25.3960, 68.3667, 'Flooding', 'Sindh Floods', 'High', 1000000, '2024-09-12', 'Evacuation'),
(12, 'Caribbean', 'Haiti', 'Port-au-Prince', 18.5944, -72.3348, 'Earthquake', 'Haiti Earthquake', 'High', 1800000, '2024-04-13', 'Search and Rescue'),
(13, 'Oceania', 'Australia', 'New South Wales', -35.2809, 149.1289, 'Wildfire', 'Australian Bushfires', 'High', 200000, '2024-01-29', 'Evacuation'),
(14, 'Southeast Asia', 'Philippines', 'Eastern Visayas', 11.1597, 124.2452, 'Tornadoes', 'Tacloban Tornado', 'Medium', 50000, '2024-02-18', 'Medical Assistance'),
(15, 'Northern Europe', 'Norway', 'Nordland', 68.9996, 13.5956, 'Avalanche', 'Norway Avalanche', 'Low', 120, '2024-03-03', 'Search and Rescue');

CREATE TABLE Available_Resources (
	Resource_id INT AUTO_INCREMENT PRIMARY KEY,
	Type VARCHAR (100), 
	Description VARCHAR (250), 
	Quantity INT, 
	Location VARCHAR (250), 
	Status ENUM ('Available', 'In Use', 'Depleted'), 
	Last_Updated Date
);

INSERT INTO Available_Resources (Resource_id, Type, Description, Quantity, Location, Status, Last_Updated) VALUES
(1, 'Medical Supplies', 'First aid kits, bandages, and pain relievers', 1500, 'Central Storage, Florida', 'Available', '2024-11-19'),
(2, 'Search and Rescue Equipment', 'Drones, rescue boats, thermal imaging cameras', 50, 'Warehouse, Louisiana', 'In Use', '2024-11-18'),
(3, 'Food Supplies', 'Non-perishable food items and water bottles', 20000, 'Warehouse, Texas', 'Available', '2024-11-15'),
(4, 'Temporary Shelters', 'Tents and portable housing units', 300, 'Emergency Center, Nigeria', 'In Use', '2024-11-17'),
(5, 'Medical Personnel', 'Doctors, nurses, paramedics', 200, 'Field Hospital, Cuba', 'In Use', '2024-11-18'),
(6, 'Generators', 'Portable power generators', 50, 'Storage Unit, Hawaii', 'Depleted', '2024-11-16'),
(7, 'Clothing Supplies', 'Warm clothing and blankets', 5000, 'Relief Hub, Brazil', 'Available', '2024-11-15'),
(8, 'Fuel', 'Diesel and gasoline for vehicles and generators', 10000, 'Central Depot, Florida', 'Available', '2024-11-18'),
(9, 'Heavy Machinery', 'Excavators, bulldozers for debris removal', 10, 'Construction Yard, Santiago de Cuba', 'In Use', '2024-11-19'),
(10, 'Communication Equipment', 'Radios, satellite phones, and antennas', 100, 'Emergency Hub, Nigeria', 'Available', '2024-11-16'),
(11, 'Medical Supplies', 'Vaccines for disease outbreaks', 5000, 'Relief Hub, Haiti', 'Available', '2024-11-19'),
(12, 'Temporary Shelters', 'Portable housing units for displaced families', 1000, 'Emergency Center, India', 'Available', '2024-11-18'),
(13, 'Water Purification Systems', 'Portable units to purify contaminated water', 200, 'Warehouse, Ethiopia', 'In Use', '2024-11-15'),
(14, 'Construction Materials', 'Tarpaulins, roofing sheets, and wood', 1500, 'Storage Unit, Guatemala', 'Available', '2024-11-17'),
(15, 'Communication Systems', 'Satellite phones and internet kits', 300, 'Communication Hub, Japan', 'Available', '2024-11-16'),
(16, 'Power Equipment', 'Solar panels and generators', 500, 'Central Depot, France', 'Available', '2024-11-15'),
(17, 'Fuel', 'Diesel and gasoline for transport and power', 10000, 'Fuel Depot, Pakistan', 'In Use', '2024-11-18'),
(18, 'Hygiene Kits', 'Soap, disinfectants, and cleaning supplies', 10000, 'Relief Hub, Australia', 'Available', '2024-11-14'),
(19, 'Education Supplies', 'School kits and mobile classrooms', 200, 'Storage Unit, Norway', 'Available', '2024-11-16'),
(20, 'Cold Weather Gear', 'Thermal blankets and winter clothing', 5000, 'Relief Center, Norway', 'Available', '2024-11-15'),
(21, 'Flood Barriers', 'Sandbags and inflatable barriers', 800, 'Warehouse, Philippines', 'In Use', '2024-11-17'),
(22, 'Advanced Search Equipment', 'Infrared cameras and sonar devices', 50, 'Search and Rescue HQ, Haiti', 'Available', '2024-11-18'),
(23, 'Animal Care Supplies', 'Food and shelter for livestock and pets', 1000, 'Storage Unit, India', 'Available', '2024-11-16'),
(24, 'Drones', 'Aerial drones for survey and supply delivery', 100, 'Tech Hub, Japan', 'Available', '2024-11-17'),
(25, 'Mental Health Resources', 'Counseling kits and psychological aid materials', 200, 'Emergency Center, Ethiopia', 'Available', '2024-11-14');


CREATE TABLE Teams ( 
	Team_id INT AUTO_INCREMENT PRIMARY KEY,
	Name VARCHAR (50),
	Last_name VARCHAR (100),
	Members INT, 
	Specialization ENUM ('Search and Rescue', 'Medical','Communications','Logistics and Supply Chain','Engineering','Environmental Assessment','Psychological Support',
		'Veterinary Care','Drone Operations','Public Health','Emergency Education','Hazardous Material Handling','Search and Recovery','Firefighting','Water Management',
		'Conflict Resolution','Energy Restoration','Crisis Communication','Disability Support','Cultural and Religious Support','Transport Operations','Child Protection'), 
	Specialization_Description VARCHAR(150), 
	Email VARCHAR (150), 
	Phone VARCHAR (12), 
	Availability ENUM ('Available', 'Deployed') 
);

INSERT INTO Teams (Team_id, Name, Last_name, Members, Specialization, Specialization_Description, Email, Phone, Availability) VALUES
(1, 'John', 'Smith', 10, 'Search and Rescue', 'Specialized in debris removal and survivor recovery', 'john.smith@gmail.com', '555-123-4567', 'Deployed'),
(2, 'Aisha', 'Khan', 15, 'Medical', 'Specialists in infectious diseases and emergency care', 'aisha.khan@gmail.com', '555-234-5678', 'Available'),
(3, 'Carlos', 'Martinez', 8, 'Communications', 'Experts in satellite systems and radio networks', 'carlos.martinez@gmail.com', '555-345-6789', 'Available'),
(4, 'Emily', 'Chen', 12, 'Drone Operations', 'Experienced in aerial surveys and supply drops', 'emily.chen@gmail.com', '555-456-7890', 'Deployed'),
(5, 'Ahmed', 'Farouk', 6, 'Public Health', 'Focused on hygiene and disease prevention in camps', 'ahmed.farouk@gmail.com', '555-567-8901', 'Available'),
(6, 'Marie', 'Dubois', 5, 'Environmental Assessment', 'Experts in water contamination and soil analysis', 'marie.dubois@gmail.com', '555-678-9012', 'Available'),
(7, 'Liam', 'O\'Connor', 20, 'Engineering', 'Structural engineers for building assessments', 'liam.oconnor@gmail.com', '555-789-0123', 'Deployed'),
(8, 'Priya', 'Rajan', 18, 'Psychological Support', 'Counseling for disaster trauma and stress', 'priya.rajan@gmail.com', '555-890-1234', 'Available'),
(9, 'Hiroshi', 'Tanaka', 7, 'Hazardous Material Handling', 'Experts in chemical spill and contamination control', 'hiroshi.tanaka@gmail.com', '555-901-2345', 'Available'),
(10, 'Amara', 'Nguyen', 10, 'Firefighting', 'Skilled in wildfire containment and suppression', 'amara.nguyen@gmail.com', '555-012-3456', 'Deployed'),
(11, 'Julia', 'Lopez', 5, 'Logistics and Supply Chain', 'Managing transport and distribution of resources', 'julia.lopez@gmail.com', '555-789-4561', 'Available'),
(12, 'Oscar', 'Gomez', 8, 'Veterinary Care', 'Providing aid for livestock and pets in disaster zones', 'oscar.gomez@gmail.com', '555-123-7894', 'Available'),
(13, 'Fatou', 'Diallo', 12, 'Crisis Communication', 'Developing public messaging during disasters', 'fatou.diallo@gmail.com', '555-234-5671', 'Deployed'),
(14, 'Eric', 'Nguyen', 9, 'Energy Restoration', 'Repairing and restoring power grid systems', 'eric.nguyen@gmail.com', '555-345-6780', 'Available'),
(15, 'Derek', 'Kim', 7, 'Search and Recovery', 'Teams for post-disaster recovery of remains', 'derek.kim@gmail.com', '555-567-9012', 'Deployed'),
(16, 'Sophia', 'Williams', 6, 'Emergency Education', 'Establishing temporary schools for children', 'sophia.williams@gmail.com', '555-678-2345', 'Available'),
(17, 'Ivan', 'Petrov', 8, 'Water Management', 'Flood control and water resource recovery', 'ivan.petrov@gmail.com', '555-789-3456', 'Available'),
(18, 'Chen', 'Wei', 10, 'Cultural and Religious Support', 'Culturally sensitive support for disaster victims', 'chen.wei@gmail.com', '555-890-4567', 'Available'),
(19, 'Anita', 'Sharma', 6, 'Child Protection', 'Ensuring safety and care for children in shelters', 'anita.sharma@gmail.com', '555-901-5678', 'Deployed'),
(20, 'Hassan', 'Ali', 15, 'Conflict Resolution', 'Mediating disputes in crowded shelters', 'hassan.ali@gmail.com', '555-012-6789', 'Available');


CREATE TABLE Communication_Logs (
	Log_id INT AUTO_INCREMENT PRIMARY KEY,
	Time_stamp DATE, 
	Sent_from VARCHAR (150), 
	Sent_to VARCHAR (150), 
	Message VARCHAR (250), 
	Method ENUM ('Radio', 'Email','Other') 
);

INSERT INTO Communication_Logs (Log_id, Time_stamp, Sent_from, Sent_to, Message, Method) VALUES
(1, '2024-11-15', 'john.smith@disasterrelief.org', 'emily.chen@droneops.org', 'Requesting drone support for aerial survey in Florida.', 'Email'),
(2, '2024-11-16', 'Control Center, Florida', 'Search Team Alpha', 'Update: Evacuation complete in Zone A.', 'Radio'),
(3, '2024-11-17', 'aisha.khan@medicalteam.org', 'Control Center, Nigeria', 'Urgent: Additional medical supplies required in Zone C.', 'Email'),
(4, '2024-11-18', 'derek.kim@recovery.org', 'hiroshi.tanaka@hazmatresponse.org', 'Request for chemical spill assessment at Site B.', 'Email'),
(5, '2024-11-19', 'Oscar Gomez', 'Field Hospital, Haiti', 'Animal care supplies delivered successfully.', 'Other'),
(6, '2024-11-19', 'marie.dubois@environmental.org', 'fatou.diallo@communications.org', 'Report on water contamination risks shared.', 'Email'),
(7, '2024-11-19', 'Base Camp, India', 'Search Team Bravo', 'Flooded region navigable via boats; proceed cautiously.', 'Radio'),
(8, '2024-11-20', 'priya.rajan@psychsupport.org', 'HQ, Disaster Relief', 'Counseling services successfully deployed in Zone D.', 'Email'),
(9, '2024-11-20', 'Ivan Petrov', 'Water Management Control Center', 'Sandbags and flood barriers deployed in high-risk area.', 'Other'),
(10, '2024-11-20', 'HQ, Disaster Relief', 'Oscar Gomez', 'Veterinary team requested for livestock rescue.', 'Radio');


CREATE TABLE Deployments (
	Deployment_id INT AUTO_INCREMENT PRIMARY KEY, 
	Team_id INT, 
	Location_id INT, 
	Resource_id INT,
	Deployment_date DATE, 
	Mission_Objectives VARCHAR (250), 
	Status ENUM ('Not Started','Ongoing','Completed'), 
	Duration INT, 
	Deployed_By VARCHAR (150), 
	FOREIGN KEY (Team_id) REFERENCES Teams(Team_id),
	FOREIGN KEY (Location_id) REFERENCES Affected_Locations(Location_id),
	FOREIGN KEY (Resource_id) REFERENCES Available_Resources(Resource_id)
);

INSERT INTO Deployments (Deployment_id, Team_id, Location_id, Resource_id, Deployment_date, Mission_Objectives, Status, Duration, Deployed_By) VALUES
(1, 1, 4, 2, '2024-11-15', 'Conduct search and rescue operations in hurricane-affected zones.', 'Ongoing', 5, 'Disaster Relief Organization'),
(2, 2, 5, 11, '2024-11-16', 'Provide medical assistance to earthquake victims.', 'Ongoing', 7, 'Global Health Initiative'),
(3, 3, 2, 10, '2024-11-17', 'Establish communication networks in flooded areas.', 'Completed', 3, 'Communication Support Network'),
(4, 4, 13, 24, '2024-11-18', 'Deploy drones for aerial survey of wildfire regions.', 'Ongoing', 4, 'Aerial Relief Services'),
(5, 5, 6, 3, '2024-11-19', 'Distribute food supplies in flood-hit villages.', 'Ongoing', 10, 'International Relief Foundation'),
(6, 7, 3, 9, '2024-11-20', 'Remove debris and assist in wildfire recovery.', 'Not Started', 0, 'Engineering Aid Network'),
(7, 9, 12, 16, '2024-11-21', 'Install portable power units in affected zones.', 'Not Started', 0, 'Energy Restoration Team'),
(8, 8, 14, 18, '2024-11-22', 'Provide mental health counseling for tornado survivors.', 'Not Started', 0, 'Psychological Support Initiative'),
(9, 6, 11, 14, '2024-11-20', 'Assess water contamination and distribute sanitation kits.', 'Ongoing', 3, 'Environmental Support Team'),
(10, 10, 8, 7, '2024-11-19', 'Deliver warm clothing to tsunami-affected families.', 'Completed', 2, 'Humanitarian Aid Group');



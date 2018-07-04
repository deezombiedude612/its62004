/*
	ITS62004: Advanced Database Systems
    Assignment
    0320261 | TEE XUE QI
    0321342 | SYAMIMI BINTI SUHAIDI
    0321343 | HENG HIAN WEE
    0324451 | PRISHTEE SEEWOOCHURN
    0326017 | TAN MAY SHUEN
*/

DROP DATABASE IF EXISTS Assignment;
CREATE DATABASE Assignment;
USE Assignment;

/* Travel Agencies */
CREATE TABLE IF NOT EXISTS `Assignment`.`Travel_Agencies` (
`travel_agency_id`			INT(5) NOT NULL AUTO_INCREMENT,
`travel_agency_details` 	VARCHAR(100) NOT NULL,

 PRIMARY KEY(`travel_agency_id`)
);
ALTER TABLE `Assignment`.`Travel_Agencies` AUTO_INCREMENT = 10000;


/* Customer */
CREATE TABLE IF NOT EXISTS `Assignment`.`Customers` (
`customer_id`				INT(5) NOT NULL AUTO_INCREMENT,
`customer_name`				VARCHAR(100) NOT NULL,
`customer_contactNumber`	VARCHAR(100) NOT NULL,
`customer_email`			VARCHAR(100) NOT NULL,
`customer_dob`				DATE NOT NULL,
`customer_address_town`		VARCHAR(100) NOT NULL,
`customer_address_state`	VARCHAR(100) NOT NULL,
`date_from`					DATE NOT NULL,
`date_to`					DATE NOT NULL,
`date_join`					DATE NOT NULL,

 PRIMARY KEY(`customer_id`)
);
ALTER TABLE `Assignment`.`Customers` AUTO_INCREMENT = 20000;


/* Bookings */
CREATE TABLE IF NOT EXISTS `Assignment`.`Bookings` (
`booking_id`		    INT(5) NOT NULL AUTO_INCREMENT,
`customer_id`		    INT(5) NOT NULL,
`travel_agency_id`      INT(5) NOT NULL,
`date_of_booking`	    DATE NOT NULL,
`booking_details`	    VARCHAR(100) NULL,
`booking_status`		VARCHAR(100) NOT NULL,

 PRIMARY KEY(`booking_id`),
 FOREIGN KEY(`customer_id`) REFERENCES `Assignment`.`Customers` (`customer_id`),
 FOREIGN KEY(`travel_agency_id`) REFERENCES `Assignment`.`Travel_Agencies` (`travel_agency_id`)
);
ALTER TABLE `Assignment`.`Bookings` AUTO_INCREMENT = 80000;


/* Airlines */
CREATE TABLE IF NOT EXISTS `Assignment`.`Airlines` (
`airline_id`		INT(5) NOT NULL AUTO_INCREMENT,
`airline_details`	VARCHAR(100) NOT NULL,

 PRIMARY KEY(`airline_id`)
);
ALTER TABLE `Assignment`.`Airlines` AUTO_INCREMENT = 30000;

/* Cars */
CREATE TABLE IF NOT EXISTS `Assignment`.`Cars` (
`car_id`		INT(5) NOT NULL AUTO_INCREMENT,
`car_details`	VARCHAR(100) NOT NULL,

 PRIMARY KEY(`car_id`)
 );
 ALTER TABLE `Assignment`.`Cars` AUTO_INCREMENT = 40000;

/* Hotels */
CREATE TABLE IF NOT EXISTS `Assignment`.`Hotels` (
`hotel_id`		INT(5) NOT NULL AUTO_INCREMENT,
`hotel_details`	VARCHAR(100) NOT NULL,

 PRIMARY KEY(`hotel_id`)
 );
  ALTER TABLE `Assignment`.`Hotels` AUTO_INCREMENT = 50000;

/* Restaurants */
CREATE TABLE IF NOT EXISTS `Assignment`.`Restaurants` (
`restaurant_id`			INT(5) NOT NULL AUTO_INCREMENT,
`restaurant_details`	VARCHAR(100) NOT NULL,

 PRIMARY KEY(`restaurant_id`)
 );
   ALTER TABLE `Assignment`.`Restaurants` AUTO_INCREMENT = 60000;

/* Services */
CREATE TABLE IF NOT EXISTS `Assignment`.`Services` (
`service_id`		INT(5) NOT NULL AUTO_INCREMENT,
`airline_id`		INT(5) NOT NULL,
`car_id`			INT(5) NOT NULL,
`hotel_id`			INT(5) NOT NULL,
`restaurant_id`		INT(5) NOT NULL,
`location`			VARCHAR(100) NOT NULL,
`tourist_dest`		VARCHAR(200) NOT NULL,

 PRIMARY KEY(`service_id`),
 FOREIGN KEY(`airline_id`) REFERENCES `Assignment`.`Airlines` (`airline_id`),
 FOREIGN KEY(`car_id`) REFERENCES `Assignment`.`Cars` (`car_id`),
 FOREIGN KEY(`hotel_id`) REFERENCES `Assignment`.`Hotels` (`hotel_id`),
 FOREIGN KEY(`restaurant_id`) REFERENCES `Assignment`.`Restaurants` (`restaurant_id`)
);
ALTER TABLE `Assignment`.`Services` AUTO_INCREMENT = 70000;


/* Payments */
CREATE TABLE IF NOT EXISTS `Assignment`.`Payments` (
`payment_id`		INT(5) NOT NULL AUTO_INCREMENT,
`booking_id`		INT(5) NOT NULL,
`payment_amount`	DOUBLE NOT NULL,
`payment_date`		DATE NULL,
`payment_details`	VARCHAR(100) NULL,

 PRIMARY KEY(`payment_id`),
 FOREIGN KEY(`booking_id`) REFERENCES `Assignment`.`Bookings` (`booking_id`)
);
ALTER TABLE `Assignment`.`Payments` AUTO_INCREMENT = 90000;

/* Service_Bookings */
CREATE TABLE IF NOT EXISTS `Assignment`.`Service_Bookings` (
`service_id`			INT(5) NOT NULL,
`booking_id`			INT(5) NOT NULL,
`booking_start_date`	DATE NOT NULL,
`booking_end_date`		DATE NOT NULL,

 PRIMARY KEY(`service_id`, `booking_id`),
 FOREIGN KEY(`service_id`) REFERENCES `Assignment`.`Services` (`service_id`),
 FOREIGN KEY(`booking_id`) REFERENCES `Assignment`.`Bookings` (`booking_id`)
);


/* Urgent_Confirmation */
CREATE TABLE IF NOT EXISTS `Assignment`.`Urgent_Confirmation` (
`customer_id`		INT(5) NOT NULL,
`booking_id`		INT(5) NOT NULL,
`payment_id`		INT(5) NOT NULL,

 FOREIGN KEY(`customer_id`) REFERENCES `Assignment`.`Customers` (`customer_id`),
 FOREIGN KEY(`booking_id`) REFERENCES `Assignment`.`Bookings` (`booking_id`),
 FOREIGN KEY(`payment_id`) REFERENCES `Assignment`.`Payments` (`payment_id`)
);

SELECT * FROM `Assignment`.`travel_agencies`;
SELECT * FROM `Assignment`.`customers`;
SELECT * FROM `Assignment`.`bookings`;
SELECT * FROM `Assignment`.`Service_Bookings`;
SELECT * FROM `Assignment`.`services`;
SELECT * FROM `Assignment`.`airlines`;
SELECT * FROM `Assignment`.`cars`;
SELECT * FROM `Assignment`.`hotels`;
SELECT * FROM `Assignment`.`restaurants`;
SELECT * FROM `Assignment`.`payments`;
SELECT * FROM `Assignment`.`urgent_confirmation`;

/*2a Data insertion using procedure*/

/* travel agency */
DELIMITER //
DROP PROCEDURE IF EXISTS TravelAgencyProc //
CREATE PROCEDURE TravelAgencyProc(IN details VARCHAR(100))
	BEGIN
		INSERT INTO Travel_Agencies (travel_agency_details) VALUES (details);
	END //
DELIMITER ;

CALL TravelAgencyProc('ABC');
CALL TravelAgencyProc('DEFG');
CALL TravelAgencyProc('HIJ');
CALL TravelAgencyProc('KLM');
CALL TravelAgencyProc('NOP');
CALL TravelAgencyProc('QRS');
CALL TravelAgencyProc('TUV');
CALL TravelAgencyProc('WXY');
CALL TravelAgencyProc('CKI');
CALL TravelAgencyProc('LMN');

SELECT * FROM Travel_Agencies;

/* customer */

DELIMITER //
DROP PROCEDURE IF EXISTS CustomerProc //
CREATE PROCEDURE CustomerProc(IN cust_name VARCHAR(100), IN contact VARCHAR(100), IN email VARCHAR(100), IN dob DATE, IN state VARCHAR(100), 
IN town VARCHAR(100), IN add_date_from DATE, IN add_date_to DATE, IN date_joined DATE)
	BEGIN
		INSERT INTO Customers (customer_name, customer_contactNumber, customer_email, customer_dob, customer_address_town, customer_address_state, date_from, date_to, date_join)
        VALUES (cust_name, contact, email, dob, state, town, add_date_from, add_date_to, date_joined);
	END //
DELIMITER ;

CALL CustomerProc('John', '017456379', 'john54@gmail.com', '1996-12-03', 'Selangor', 'Kuala Lumpur', '2009-01-01', '2017-03-15', '2005-01-12');
CALL CustomerProc('Sam', '012398711', 'sammy@gmail.com', '1991-09-10', 'Subang', 'Petaling Jaya', '2010-01-29', '2015-05-14', '2009-08-06');
CALL CustomerProc('Alice', '014423098', 'alice.maxwell@gmail.com', '1997-11-30', 'Melacca City', 'Melacca', '2006-03-28', '2016-12-09', '2008-05-13');
CALL CustomerProc('Rita', '016117894', 'rta12@gmail.com', '1998-05-28', 'Penang', 'George Town', '2007-08-18', '2012-03-29', '2007-04-02');
CALL CustomerProc('Gracy', '015209771', 'gracytan@gmail.com', '1997-07-03', 'Glenmarie', 'Shah Alam', '2005-04-11', '2014-11-24', '2008-02-28');
CALL CustomerProc('Ruby', '013628975', 'ruby23@gmail.com', '2000-12-31', 'Ipoh', 'Perak', '2003-09-13', '2015-06-06', '2015-09-11');
CALL CustomerProc('Lucas', '016011245', 'luke@gmail.com', '1994-02-11', 'Johor Bahru', 'Johor', '2006-08-11', '2013-12-04', '2005-03-17');
CALL CustomerProc('Michael', '013309871', 'michael99@gmail.com', '1995-04-29', 'Seremban', 'Negeri Sembilan', '2002-11-13', '2016-09-18', '2012-03-04');
CALL CustomerProc('Alexander', '011349873', 'alex@gmail.com', '1993-04-15', 'Miri', 'Sarawak', '2005-11-11', '2017-08-12', '2011-02-19');
CALL CustomerProc('Ryan', '016698215', 'ryan96@gmail.com', '1992-06-18', 'Kucing', 'Sarawak', '2008-12-13', '2014-05-17', '2007-05-08');

SELECT * FROM Customers;

/* booking */

DELIMITER //
DROP PROCEDURE IF EXISTS BookingProc //
CREATE PROCEDURE BookingProc(IN cust_id INT(5), IN travel_id INT(5), IN dateOfBooking DATE, IN details VARCHAR(100), IN bStatus VARCHAR(100))
	BEGIN
		INSERT INTO Bookings (customer_id, travel_agency_id, date_of_booking, booking_details, booking_status)
        VALUES (cust_id, travel_id, dateOfBooking, details, bStatus);
	END //
DELIMITER ;

CALL BookingProc(20001, 10005, '2017-03-26', 'Package G1', 'OK');
CALL BookingProc(20005, 10004, '2016-05-21', 'Package F2', 'OK');
CALL BookingProc(20009, 10003, '2018-04-16', 'Package A4', 'Cancelled');
CALL BookingProc(20008, 10007, '2018-05-18', 'Package C5', 'Provisional');
CALL BookingProc(20007, 10009, '2018-03-24', 'Package H8', 'Cancelled');
CALL BookingProc(20006, 10008, '2017-12-17', 'Package B3', 'Cancelled');
CALL BookingProc(20003, 10002, '2018-02-28', 'Package D9', 'Provisional');
CALL BookingProc(20004, 10006, '2015-07-18', 'Package E1', 'OK');
CALL BookingProc(20000, 10001, '2018-04-30', 'Package C2', 'Provisional');
CALL BookingProc(20002, 10000, '2015-09-14', 'Package G1', 'OK');

CALL BookingProc(20002, 10003, '2012-04-16', 'Package A4', 'OK');
CALL BookingProc(20002, 10007, '2011-05-18', 'Package C5', 'OK');
CALL BookingProc(20008, 10009, '2013-03-24', 'Package H8', 'OK');
CALL BookingProc(20004, 10008, '2009-12-17', 'Package B3', 'OK');
CALL BookingProc(20003, 10002, '2008-02-28', 'Package D9', 'OK');
CALL BookingProc(20004, 10006, '2010-07-18', 'Package E1', 'OK');
CALL BookingProc(20009, 10001, '2014-04-30', 'Package C2', 'OK');
CALL BookingProc(20009, 10000, '2015-09-13', 'Package G1', 'OK');

CALL BookingProc(20006, 10009, '2007-04-16', 'Package S3', 'OK');
CALL BookingProc(20009, 10006, '2008-05-18', 'Package P5', 'Cancelled');
CALL BookingProc(20000, 10005, '2006-03-24', 'Package K9', 'OK');
CALL BookingProc(20005, 10007, '2010-12-17', 'Package M2', 'OK');
CALL BookingProc(20004, 10008, '2015-02-28', 'Package L6', 'OK');
CALL BookingProc(20008, 10004, '2016-07-18', 'Package B3', 'OK');
CALL BookingProc(20007, 10004, '2014-04-30', 'Package C2', 'OK');
CALL BookingProc(20003, 10000, '2015-09-13', 'Package H8', 'OK');

CALL BookingProc(20000, 10005, '2006-06-24', 'Package S9', 'OK');
CALL BookingProc(20001, 10003, '2017-08-26', 'Package F2', 'OK');
CALL BookingProc(20002, 10006, '2012-06-15', 'Package E3', 'OK');
CALL BookingProc(20002, 10008, '2012-09-28', 'Package D5', 'OK');

SELECT * FROM Bookings;

/* airline */

DELIMITER //
DROP PROCEDURE IF EXISTS AirlineProc //
CREATE PROCEDURE AirlineProc(IN details VARCHAR(100))
	BEGIN
		INSERT INTO Airlines (airline_details) VALUES (details);
	END //
DELIMITER ;

CALL AirlineProc('Malaysia Airlines');
CALL AirlineProc('KLM Airlines');
CALL AirlineProc('Delta Airlines');
CALL AirlineProc('Fontier Airlines');
CALL AirlineProc('Singapore Airlines');
CALL AirlineProc('Alaska Airlines');
CALL AirlineProc('Hawaiian Airlines');
CALL AirlineProc('Austrian Airlines');
CALL AirlineProc('Emirates Airlines');
CALL AirlineProc('Southwest Airlines');

SELECT * FROM Airlines;

/* car */

DELIMITER //
DROP PROCEDURE IF EXISTS CarProc //
CREATE PROCEDURE CarProc(IN details VARCHAR(100))
	BEGIN
		INSERT INTO Cars (car_details) VALUES (details);
	END //
DELIMITER ;

CALL CarProc('Mercedes');
CALL CarProc('Toyota');
CALL CarProc('Proton');
CALL CarProc('Mazda');
CALL CarProc('Porsche');
CALL CarProc('BMW');
CALL CarProc('Ford');
CALL CarProc('Honda');
CALL CarProc('Nissan');
CALL CarProc('Land Rover');

SELECT * FROM Cars;

/* hotel */

DELIMITER //
DROP PROCEDURE IF EXISTS HotelProc //
CREATE PROCEDURE HotelProc(IN details VARCHAR(100))
	BEGIN
		INSERT INTO Hotels (hotel_details) VALUES (details);
	END //
DELIMITER ;

CALL HotelProc('Concorde Hotel');
CALL HotelProc('Mandarin Oriental');
CALL HotelProc('Afamosa Resort');
CALL HotelProc('Flamingo Hotel');
CALL HotelProc('Impiana KLCC');
CALL HotelProc('InterContinental Hotel');
CALL HotelProc('Istana Hotel');
CALL HotelProc('Prince Hotel');
CALL HotelProc('Crown Princess Hotel');
CALL HotelProc('Renaissance Hotel');

SELECT * FROM Hotels;

/* restaurant */

DELIMITER //
DROP PROCEDURE IF EXISTS RestaurantProc //
CREATE PROCEDURE RestaurantProc(IN details VARCHAR(100))
	BEGIN
		INSERT INTO Restaurants (restaurant_details) VALUES (details);
	END //
DELIMITER ;

CALL RestaurantProc('Canopy Rooftop');
CALL RestaurantProc('Dine Restaurant');
CALL RestaurantProc('Flam Restaurant');
CALL RestaurantProc('La Vista Bistro');
CALL RestaurantProc('Feringgi Grill');
CALL RestaurantProc('Sushi Kitchen');
CALL RestaurantProc('Western Cuisine');
CALL RestaurantProc('Sweetwater Restaurant');
CALL RestaurantProc('Spice Grill');
CALL RestaurantProc('Gallo Nero Italian Restaurant');

SELECT * FROM Restaurants;

/* service */

DELIMITER //
DROP PROCEDURE IF EXISTS ServiceProc //
CREATE PROCEDURE ServiceProc(IN a_id INT(5), IN c_id INT(5), IN h_id INT(5), IN r_id INT(5), IN loc VARCHAR(100), IN tour_dest VARCHAR(200))
	BEGIN
		INSERT INTO Services (airline_id, car_id, hotel_id, restaurant_id, location, tourist_dest) 
        VALUES (a_id, c_id, h_id, r_id, loc, tour_dest);
	END //
DELIMITER ;

CALL ServiceProc(30002, 40004, 50007, 60009, 'Kuala Lumpur', 'KLCC');
CALL ServiceProc(30005, 40009, 50001, 60006, 'Kuala Lumpur', 'Petronas Twin Towers');
CALL ServiceProc(30007, 40007, 50002, 60004, 'Malacca', 'A\' Famosa Fort');
CALL ServiceProc(30009, 40002, 50004, 60005, 'Kuala Lumpur', 'Aquaria KLCC');
CALL ServiceProc(30001, 40003, 50005, 60001, 'Kuala Lumpur', 'Ilham Gallery');
CALL ServiceProc(30000, 40001, 50009, 60002, 'Kuala Lumpur', 'KL Tower');
CALL ServiceProc(30004, 40006, 50000, 60003, 'Kuala Lumpur', 'Petronas Filharmonik Hall');
CALL ServiceProc(30008, 40000, 50008, 60000, 'Kuala Lumpur', 'Petrosains Science Discovery Center');
CALL ServiceProc(30006, 40008, 50006, 60007, 'Kuala Lumpur', 'Telekom Museum');
CALL ServiceProc(30003, 40005, 50003, 60008, 'Penang', 'The Habitat Penang Hill');

SELECT * FROM Services;


/* payment */

DELIMITER //
DROP PROCEDURE IF EXISTS PaymentProc //
CREATE PROCEDURE PaymentProc(IN booking_id INT(5), IN amount DOUBLE, IN p_date DATE, IN details VARCHAR(100))
	BEGIN
		INSERT INTO Payments (booking_id, payment_amount, payment_date, payment_details)
        VALUES (booking_id, amount, p_date, details);
	END //
DELIMITER ;

/* this query and checking of payment is being done 3 weeks before the booking date */
CALL PaymentProc(80006, 9000.00, '2018-03-14', 'Cash');
CALL PaymentProc(80004, 9500.00, NULL, NULL);
CALL PaymentProc(80008, 10700.00, NULL, NULL);
CALL PaymentProc(80000, 9800.00, '2017-04-10', 'Card');
CALL PaymentProc(80002, 25000.00, NULL, NULL);
CALL PaymentProc(80001, 18000.00, '2016-06-05', 'Cheque');
CALL PaymentProc(80007, 11200.00, '2015-08-02', 'Cash');
CALL PaymentProc(80003, 31700.00, NULL, NULL);
CALL PaymentProc(80009, 23400.00, NULL, NULL);
CALL PaymentProc(80005, 26500.00, '2017-12-30', 'Card');

CALL PaymentProc(80010, 10575.00, '2012-03-16', 'Card');
CALL PaymentProc(80011, 20187.00, '2011-04-18', 'Cash');
CALL PaymentProc(80012, 25645.00, '2013-02-24', 'Cash');
CALL PaymentProc(80013, 18790.00, '2009-11-17', 'Card');
CALL PaymentProc(80014, 17500.00, '2008-01-28', 'Cheque');
CALL PaymentProc(80015, 9950.00, '2010-06-18', 'Cash');
CALL PaymentProc(80016, 8975.00, '2014-03-30', 'Cheque');
CALL PaymentProc(80017, 7650.00, '2015-08-14', 'Card');

CALL PaymentProc(80018, 9085.00, '2007-03-16', 'Cash');
CALL PaymentProc(80019, 13540.00, NULL, NULL);
CALL PaymentProc(80020, 11290.00, '2006-02-24', 'Card');
CALL PaymentProc(80021, 5678.00, '2010-10-17', 'Cash');
CALL PaymentProc(80022, 7645.00, '2015-01-28', 'Cash');
CALL PaymentProc(80023, 6390.00, '2016-04-18', 'Cash');
CALL PaymentProc(80024, 15789.00, '2014-03-30', 'Cheque');
CALL PaymentProc(80025, 13757.00, '2015-07-13', 'Cheque');

CALL PaymentProc(80026, 17600.00, '2006-04-24', 'Cheque');
CALL PaymentProc(80027, 9860.00, '2017-06-26', 'Cash');
CALL PaymentProc(80028, 12555.00, '2012-02-15', 'Card');
CALL PaymentProc(80029, 6790.00, '2012-07-28', 'Cash');

SELECT * FROM Payments;

/* service booking */

DELIMITER //
DROP PROCEDURE IF EXISTS ServiceBookingProc //
CREATE PROCEDURE ServiceBookingProc(IN s_id INT(5), IN b_id INT(5), IN start_date DATE, IN end_date DATE)
	BEGIN
		INSERT INTO Service_Bookings VALUES(s_id, b_id, start_date, end_date);
	END //
DELIMITER ;

CALL ServiceBookingProc(70006, 80005, '2018-01-23', '2018-03-09');
CALL ServiceBookingProc(70003, 80006, '2018-04-06', '2018-05-06');
CALL ServiceBookingProc(70009, 80002, '2018-05-23', '2018-08-02');
CALL ServiceBookingProc(70000, 80008, '2018-06-06', '2018-07-16');
CALL ServiceBookingProc(70002, 80009, '2015-10-20', '2015-12-20');
CALL ServiceBookingProc(70005, 80001, '2016-06-27', '2016-08-25');
CALL ServiceBookingProc(70007, 80004, '2018-04-30', '2018-07-15');
CALL ServiceBookingProc(70001, 80000, '2017-05-02', '2017-07-05');
CALL ServiceBookingProc(70004, 80007, '2015-08-24', '2015-10-29');
CALL ServiceBookingProc(70008, 80003, '2018-06-24', '2018-08-16');

CALL ServiceBookingProc(70009, 80012, '2013-05-24', '2018-05-24');
CALL ServiceBookingProc(70009, 80011, '2011-07-18', '2017-07-18');
CALL ServiceBookingProc(70005, 80010, '2012-06-16', '2015-06-16');
CALL ServiceBookingProc(70001, 80015, '2010-09-18', '2016-09-18');
CALL ServiceBookingProc(70004, 80014, '2008-04-28', '2014-04-28');
CALL ServiceBookingProc(70008, 80016, '2014-06-30', '2018-05-30');
CALL ServiceBookingProc(70004, 80013, '2010-02-17', '2016-02-17');
CALL ServiceBookingProc(70008, 80017, '2015-11-14', '2017-11-14');

CALL ServiceBookingProc(70006, 80018, '2007-06-16', '2008-06-16');
CALL ServiceBookingProc(70009, 80019, '2008-07-18', '2010-07-18');
CALL ServiceBookingProc(70000, 80020, '2006-05-24', '2012-05-24');
CALL ServiceBookingProc(70005, 80021, '2011-02-17', '2015-02-17');
CALL ServiceBookingProc(70004, 80022, '2015-04-28', '2018-04-28');
CALL ServiceBookingProc(70008, 80023, '2016-09-18', '2017-09-18');
CALL ServiceBookingProc(70007, 80024, '2014-06-30', '2017-06-30');
CALL ServiceBookingProc(70003, 80025, '2015-11-13', '2016-11-13');

CALL ServiceBookingProc(70001, 80026, '2006-06-24', '2009-06-24');
CALL ServiceBookingProc(70009, 80027, '2017-08-26', '2018-05-26');
CALL ServiceBookingProc(70008, 80028, '2012-05-15', '2015-05-15');
CALL ServiceBookingProc(70005, 80029, '2012-09-28', '2016-09-28');

SELECT * FROM Service_Bookings;

/* ADS Assgn1: Question 3 - Create Views */

# Question 3a
DROP VIEW IF EXISTS Customers_bookings;
CREATE VIEW Customers_bookings AS 
	SELECT Bookings.customer_id, Customers.customer_name, Bookings.booking_id, Bookings.date_of_booking, Bookings.booking_status
	FROM Bookings, Customers
	WHERE Customers.customer_id = Bookings.customer_id 
	AND YEAR(date_of_booking) = 2017;

SELECT * FROM Customers_bookings;

# Question 3b
DROP VIEW IF EXISTS Customer_Information;
CREATE VIEW Customer_Information AS 
	SELECT b.date_of_booking, c.customer_id, c.customer_name, c.customer_contactNumber, c.customer_email, c.customer_dob, c.customer_address_town, c.customer_address_state 
	FROM Customers c
	JOIN Bookings b ON c.customer_id = b.customer_id 
	WHERE YEAR(date_of_booking) BETWEEN 2015 AND 2017
	UNION ALL
	SELECT 'TOTAL NUMBER OF BOOKINGS FOR 2015, 2016 AND 2017: ', NULL, NULL, NULL, NULL, NULL, NULL, COUNT(date_of_booking) 
	FROM Bookings 
	WHERE YEAR(date_of_booking) BETWEEN 2015 AND 2017;

SELECT * FROM Customer_Information;

/* ADS Assgn1: Question 4(a) - Key in Cus ID, State or Town and show given result (Procedures) */
DELIMITER //
DROP PROCEDURE IF EXISTS Question4AProc //
CREATE PROCEDURE Question4AProc(IN cusID INT(5), IN cusTown VARCHAR(100), IN cusState VARCHAR(100))
	BEGIN
		IF cusID = 0 THEN
			SELECT customer_ID, customer_Address_Town, customer_Address_State FROM Customers 
			WHERE customer_Address_Town LIKE cusTown AND customer_Address_State LIKE cusState;
		ELSE
			SELECT customer_ID, customer_Address_Town, customer_Address_State FROM Customers 
			WHERE customer_ID LIKE cusID AND customer_Address_Town LIKE cusTown AND customer_Address_State LIKE cusState;
		END IF;
	END //		
DELIMITER ;

CALL Question4AProc(20008, '%', '%');

/* NOTE: Enter either Customer ID, Customer Town or Customer State, will show the given result. 
		'%' means 'can be anything'.
        
Example 1: Enter Customer ID '20008', result will show Customer State and Town.
Example 2: Enter Customer State 'Miri' and Customer ID '20008', will show the result of Customer Town. '*/





/* ADS Assgn1: Question 4(b) - Monitor Total of Bookings. (Procedures & Function) */
DROP FUNCTION IF EXISTS Question4BFunction;
DELIMITER //
CREATE FUNCTION Question4BFunction(bookStatus VARCHAR(100)) RETURNS INT
    DETERMINISTIC
BEGIN
    DECLARE result INT;
 
 SET result = (
	SELECT COUNT(*) 
	FROM Bookings
	WHERE booking_Status LIKE bookStatus);

 RETURN (result);
END //

/* Note: It count the customers' number of bookings based on 'Provisional' or 'Cancelled'. 
	The variable 'result' shows the total number of bookings made by the Customer that is Provisional or Cancelled. */


DROP PROCEDURE IF EXISTS Question4BProc //
CREATE PROCEDURE Question4BProc(IN bookStatus2 VARCHAR(100))
	BEGIN
		SELECT customer_ID, booking_ID FROM Bookings WHERE booking_Status LIKE bookStatus2;	
	END //		
DELIMITER ;

/* Note: To see which Customers' that is Provisional or Cancelled. 
	Result will show Customer ID & Booking ID. */


CALL Question4BProc('Provisional');
SELECT Question4BFunction('Provisional'); 





/* ADS Assgn1: Question 4(c) PART 1 - Meeting Requirements of more than RM10,000 & payment before 3 weeks. */
USE Assignment;

DELIMITER //
DROP PROCEDURE IF EXISTS Question4CDataProc //
CREATE PROCEDURE Question4CDataProc()

	BEGIN
		SELECT tblBook.booking_ID AS bookID, tblBook.customer_ID AS cusID, 
        tblBook.travel_Agency_ID AS travAgencyID, tblBook.date_Of_Booking AS dateOfBook,
        tblPayment.payment_ID AS payID, tblPayment.payment_Amount AS payAmount, 
        tblPayment.payment_Date AS payDate, tblServiceBook.booking_Start_Date AS bookStartDate,
        DATEDIFF(tblServiceBook.booking_Start_Date, Now()) AS Days

		FROM Bookings tblBook
		LEFT JOIN Payments tblPayment 
        ON tblBook.booking_ID = tblPayment.booking_ID
        LEFT JOIN Service_Bookings tblServiceBook
        ON tblBook.booking_ID = tblServiceBook.booking_ID
        
        
        WHERE payment_Amount > 10000
        AND DATEDIFF(tblServiceBook.booking_Start_Date, Now()) < 22;

	END //		
DELIMITER ;

/* Note: Bookings, Service_Bookings & Payments Table are join together. 
	Result will show the payment amount that is more than 10,000.
    Result will also show the unconfirmed payment is before 3 weeks. 
    
    DateDiff function is to calculate the differences between the booking_start_date in Service_Bookings Table
    & the current date. '< 22' means it will show data which is before 3 weeks. 
    
    'Days' shows the difference between date_Of_Booking & booking_Start_Date. */


CALL Question4CDataProc();

/* ADS Assgn1: Question 4(c) PART 2 - Updating records into Urgent_Confirmation Table. */
USE Assignment;

DELIMITER //
DROP PROCEDURE IF EXISTS Question4CProc //
CREATE PROCEDURE Question4CProc()

	BEGIN
		INSERT INTO Urgent_Confirmation (customer_ID, booking_ID, payment_ID)
        
        SELECT tblBook.customer_ID AS cusID, tblBook.booking_ID AS bookID, 
        tblPayment.payment_ID AS payID

		FROM Bookings tblBook
		LEFT JOIN Payments tblPayment 
        ON tblBook.booking_ID = tblPayment.booking_ID
        LEFT JOIN Service_Bookings tblServiceBook
        ON tblBook.booking_ID = tblServiceBook.booking_ID
        
        
        WHERE payment_Amount > 10000
        AND DATEDIFF(tblServiceBook.booking_Start_Date, Now()) < 22;

	END //		
DELIMITER ;


TRUNCATE TABLE Urgent_Confirmation;
CALL Question4CProc();
SELECT * FROM Urgent_Confirmation;

/* Note: Truncate function means to delete data from the table. 
	This is to reduce repeated data everytime it is being executed. */

# ADS Assgn1: Question 4(d) - Discount Privileges for Customers
DROP PROCEDURE IF EXISTS Question4DProc;
DELIMITER //
CREATE PROCEDURE Question4DProc()

	BEGIN
        # temporary table displaying payment status of customers
        DROP TEMPORARY TABLE IF EXISTS `customer_paymentLog`;
        CREATE TEMPORARY TABLE `customer_paymentLog`
			SELECT c.`customer_ID`, b.`booking_ID`, b.`date_of_booking`, p.`payment_date`, DATEDIFF(b.`date_of_booking`, p.`payment_date`) AS `paymentPeriod`
			FROM `Assignment`.`Customers` c
			JOIN `Assignment`.`Bookings` b ON b.`customer_id` = c.`customer_id`
			JOIN `Assignment`.`Payments` p ON p.`booking_id` = b.`booking_id`
            WHERE b.`booking_status` = 'OK';
        ALTER TABLE `customer_paymentLog`
			ADD `payment_status` VARCHAR(10);
        
        # if payment has not been made 21 days before date of booking, consider payment DELAYED
        UPDATE `customer_paymentLog`
        SET `payment_status` = 'DELAYED'
        WHERE `paymentPeriod` < 21
        OR `paymentPeriod` IS NULL;
        
        UPDATE `customer_paymentLog`
        SET `payment_status` = 'OK'
        WHERE `paymentPeriod` >= 21;
        
        SELECT * FROM `customer_paymentLog`;
        
        # temporary table displaying number of bookings made in each active year grouped by customer ID
        DROP TEMPORARY TABLE IF EXISTS `customer_yearlyBookings`;
        CREATE TEMPORARY TABLE `customer_yearlyBookings`
			SELECT b.`customer_id`, YEAR(b.`date_of_booking`) AS `year_of_booking`, COUNT(b.`customer_id`) AS `num_bookings_made`
			FROM `Assignment`.`Bookings` b
			GROUP BY `customer_id`, YEAR(b.`date_of_booking`);
        
        SELECT * FROM `customer_yearlyBookings`;
        
        # temporary table displaying discount privileges for deserving customers
        DROP TEMPORARY TABLE IF EXISTS `customer_rewards`;
        CREATE TEMPORARY TABLE `customer_rewards`
			SELECT c.`customer_ID`, c.`customer_name`, c.`date_join`,
            TIMESTAMPDIFF(YEAR, `date_join`, NOW()) AS `member_years`
            FROM `Assignment`.`Customers` c;
		
        ALTER TABLE `customer_rewards` ADD `payment_clear` BOOLEAN DEFAULT 1;	# if payment delay within 5 years is found, update column to 0
        UPDATE `customer_rewards`
        INNER JOIN `customer_paymentLog` ON `customer_paymentLog`.`customer_ID` = `customer_rewards`.`customer_ID`
        SET `payment_clear` = 0
        WHERE `customer_paymentLog`.`payment_status` != 'OK'
        AND TIMESTAMPDIFF(YEAR, `date_of_booking`, NOW()) <= 5;
        
        ALTER TABLE `customer_rewards` ADD `loyal_customer` BOOLEAN DEFAULT 0;	# indicates if customer has made at least 2 bookings in a year (0 by default)
        UPDATE `customer_rewards`
        INNER JOIN `customer_yearlyBookings` ON `customer_yearlyBookings`.`customer_ID` = `customer_rewards`.`customer_ID`
        SET `loyal_customer` = 1
        WHERE `num_bookings_made` > 1;
        
        ALTER TABLE `customer_rewards` ADD `discount_reward` INT(3) DEFAULT 0;	# displays discount reward as percentage
        
        UPDATE `customer_rewards` SET `discount_reward` = 20
        WHERE `payment_clear` = 1 AND `loyal_customer` = 1 AND `member_years` > 4;
        
        UPDATE `customer_rewards` SET `discount_reward` = 10
        WHERE `payment_clear` = 1 AND `loyal_customer` = 1 AND `member_years` BETWEEN 3 AND 4;
        
        UPDATE `customer_rewards` SET `discount_reward` = 2
        WHERE `payment_clear` = 1 AND `loyal_customer` = 1 AND `member_years` >= 2 AND `member_years` < 3;
            
		SELECT * FROM `customer_rewards`;
    END //

DELIMITER ;

CALL Question4DProc;

# ADS Assgn1: Question 4(e)(i) - Customers that have been using the same services (Airlines) for more than 5 years
DROP PROCEDURE IF EXISTS Question4EProc1;
DELIMITER //

CREATE PROCEDURE Question4EProc1(`input_airline_id` INT(5))
	BEGIN
		SELECT c.`customer_ID`, c.`customer_name`, COUNT(c.`customer_ID`) AS `booking_frequency`
		FROM `Assignment`.`Customers` c
		INNER JOIN `Assignment`.`Bookings` b ON b.`customer_ID` = c.`customer_ID`
		INNER JOIN `Assignment`.`Service_Bookings` sb ON sb.`booking_ID` = b.`booking_ID`
		INNER JOIN `Assignment`.`Services` s ON s.`service_ID` = sb.`service_ID`
		WHERE s.`airline_ID` = `input_airline_id`
		GROUP BY c.`customer_ID`
		HAVING `booking_frequency` > 5;
    END //

DELIMITER ;

CALL Question4EProc1(30002);

# ADS Assgn1: Question 4(e)(ii) - Top package that have been offered only for short period of last (6 months or less)
DROP PROCEDURE IF EXISTS Question4EProc2;
DELIMITER //

CREATE PROCEDURE Question4EProc2()
	BEGIN
		SELECT sb.`service_ID`, b.*, c.`customer_name`
		FROM `Assignment`.`Customers` c
		INNER JOIN `Assignment`.`Bookings` b ON b.`customer_ID` = c.`customer_ID`
		INNER JOIN `Assignment`.`Service_Bookings` sb ON sb.`booking_ID` = b.`booking_ID`
		WHERE sb.`service_ID` IN (														# serviceID of package with smallest date difference in booking dates
			SELECT `service_ID`
			FROM `Assignment`.`Service_Bookings`
			HAVING TIMESTAMPDIFF(MONTH, `booking_start_date`, `booking_end_date`) <= 6
			AND DATEDIFF(`booking_end_date`, `booking_start_date`) = (					# select smallest date difference in booking dates
				SELECT MIN(DATEDIFF(`booking_end_date`, `booking_start_date`)) 
				FROM `Assignment`.`Service_Bookings`
			)
		) AND `booking_status` = 'Cancelled';
    END //

DELIMITER ;

CALL Question4EProc2;

# ADS Assgn1: Question 4(e)(iii) - Inactive customer in the account and the package selection
DROP PROCEDURE IF EXISTS Question4EProc3;
DELIMITER //

CREATE PROCEDURE Question4EProc3()
	BEGIN
		SELECT c.`customer_ID`, c.`customer_name`, b.`booking_ID`, b.`date_of_booking`, b.`booking_details`, sb.`service_ID`, TIMESTAMPDIFF(MONTH, b.`date_of_booking`, NOW()) AS `months_since_last_active`
		FROM `Assignment`.`Customers` c
		INNER JOIN `Assignment`.`Bookings` b ON b.`customer_ID` = c.`customer_ID`
		INNER JOIN `Assignment`.`Service_Bookings` sb ON sb.`booking_ID` = b.`booking_ID`
		HAVING `months_since_last_active` > 12
		ORDER BY `months_since_last_active`;
    END //

DELIMITER ;

CALL Question4EProc3;

/*	ASSUMPTION:
	Inactive customers are those who have not made any bookings for at least over 1 recent year (12 months).
*/

# ADS Assgn1: Question 4(e)(iv) - Least popular destinations and the total number of customer confirmation on this package
DROP PROCEDURE IF EXISTS Question4EProc4;
DELIMITER //

CREATE PROCEDURE Question4EProc4()
	BEGIN
		SELECT s.`service_ID`, s.`location`, s.`tourist_dest`, COUNT(sb.`booking_ID`) AS `confirmation_freq`
		FROM `Assignment`.`Services` s
		INNER JOIN `Assignment`.`Service_Bookings` sb ON sb.`service_ID` = s.`service_ID`
		INNER JOIN `Assignment`.`Bookings` b ON b.`booking_ID` = sb.`booking_ID`
		WHERE b.`booking_status` = 'OK'
		GROUP BY s.`service_ID`
		HAVING COUNT(sb.`booking_ID`) = (
			SELECT MIN(`freq`) FROM (			# obtain minimum number of booking confirmations for each service package
				SELECT sb.`service_ID`, COUNT(sb.`booking_ID`) AS `freq`
				FROM `Assignment`.`Service_Bookings` sb
				INNER JOIN `Assignment`.`Bookings` b ON b.`booking_ID` = sb.`booking_ID`
				WHERE b.`booking_status` = 'OK'
				GROUP BY sb.`service_ID`
			) AS x
		);
    END //

DELIMITER ;
CALL Question4EProc4;

/*	ASSUMPTION:
	Bookings are confirmed only if `booking_status` is labeled as 'OK'
*/
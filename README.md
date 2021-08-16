# Plant Numbers

## ACA JS 311 - Checkpoint 2

### Data Needs

We are needing to track the current availability of plant products. This app should take in data about each crop, pot size, location and plants, as well as provide the current availability.

---

### Data Structure and Relationships

- Users
  - id
  - username
  - first_name
  - last_name
- Pots
  - id
  - pot_type
  - pot_size
- Locations
  - id
  - location_id
  - location_description
- Plants
  - id
  - plant_name
  - plant_variant
  - plant_color
- Crops
  - id
  - plant_id | Plants.id
  - pot_id | Pots.id
  - location_id | Locations.id
  - planted_date
  - projected_date
  - available_date
  - planted_quantity
  - available_quantity

---

### Create DB

I setup my DB using my own server: CPanel settings requires me create the new database schema in CPanel. Link user login and provide permissions for that database. In mySQL Workbench, connect to database:

> hostname: fotohut.org

> username: XXXXXXXXXXX

> password: XXXXXXXXXXX

> schema: fotohut_Avail

Once connected, load and execure all queries in `initialize.sql`.

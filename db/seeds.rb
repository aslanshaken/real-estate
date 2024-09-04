# Creating clients
client1 = Client.create!(name: 'Client 1')
client2 = Client.create!(name: 'Client 2')
client3 = Client.create!(name: 'Client 3')
client4 = Client.create!(name: 'Client 4')
client5 = Client.create!(name: 'Client 5')

# Creating custom fields
field1 = CustomField.create!(name: 'Number of bathrooms', field_type: 'number', client: client1)
field2 = CustomField.create!(name: 'Living room color', field_type: 'freeform', client: client2)
field3 = CustomField.create!(name: 'Type of walkway', field_type: 'enum', client: client3)
field4 = CustomField.create!(name: 'Year built', field_type: 'number', client: client4)
field5 = CustomField.create!(name: 'Pool type', field_type: 'enum', client: client5)

# Creating buildings with custom fields
Building.create!(address: '123 Main St', state: 'CA', zip: '90210', client: client1)
Building.create!(address: '456 Elm St', state: 'NY', zip: '10001', client: client2)
Building.create!(address: '789 Maple Ave', state: 'TX', zip: '73301', client: client3)
Building.create!(address: '101 Pine St', state: 'FL', zip: '33101', client: client4)
Building.create!(address: '202 Oak Rd', state: 'WA', zip: '98001', client: client5)

# Adding custom field values
BuildingCustomField.create!(building: Building.find_by(address: '123 Main St'), custom_field: field1, value: '2.5')
BuildingCustomField.create!(building: Building.find_by(address: '456 Elm St'), custom_field: field2, value: 'Blue')
BuildingCustomField.create!(building: Building.find_by(address: '789 Maple Ave'), custom_field: field3, value: 'Concrete')
BuildingCustomField.create!(building: Building.find_by(address: '101 Pine St'), custom_field: field4, value: '1995')
BuildingCustomField.create!(building: Building.find_by(address: '202 Oak Rd'), custom_field: field5, value: 'In-ground')

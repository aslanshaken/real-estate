# Creating clients
client1 = Client.create!(name: 'Client 1')
client2 = Client.create!(name: 'Client 2')
client3 = Client.create!(name: 'Client 3')
client4 = Client.create!(name: 'Client 4')
client5 = Client.create!(name: 'Client 5')

# Creating custom fields
field1 = CustomField.create!(name: 'Number of bathrooms', field_type: 'number', client: client1)
field2 = CustomField.create!(name: 'Living room color', field_type: 'freeform', client: client2)
field3 = CustomField.create!(name: 'Type of walkway', field_type: 'enum', client: client3, values: { 'Brick' => 'Brick', 'Concrete' => 'Concrete', 'None' => 'None' })
field4 = CustomField.create!(name: 'Year built', field_type: 'number', client: client4)
field5 = CustomField.create!(name: 'Pool type', field_type: 'enum', client: client5, values: { 'In-ground' => 'In-ground', 'Above-ground' => 'Above-ground', 'None' => 'None' })

# Creating buildings with custom field values
building1 = Building.create!(address: '123 Main St', state: 'CA', zip: '90210', client: client1)
building2 = Building.create!(address: '456 Elm St', state: 'NY', zip: '10001', client: client2)
building3 = Building.create!(address: '789 Maple Ave', state: 'TX', zip: '73301', client: client3)
building4 = Building.create!(address: '101 Pine St', state: 'FL', zip: '33101', client: client4)
building5 = Building.create!(address: '202 Oak Rd', state: 'WA', zip: '98001', client: client5)

# Adding custom field values
BuildingCustomField.create!(building: building1, custom_field: field1, value: '2.5')
BuildingCustomField.create!(building: building2, custom_field: field2, value: 'Blue')
BuildingCustomField.create!(building: building3, custom_field: field3, value: 'Concrete')
BuildingCustomField.create!(building: building4, custom_field: field4, value: '1995')
BuildingCustomField.create!(building: building5, custom_field: field5, value: 'In-ground')

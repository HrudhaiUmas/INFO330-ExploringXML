# Incoming Pokemon MUST be in this format
#
# <pokemon pokedex="" classification="" generation="">
#     <name>...</name>
#     <hp>...</name>
#     <type>...</type>
#     <type>...</type>
#     <attack>...</attack>
#     <defense>...</defense>
#     <speed>...</speed>
#     <sp_attack>...</sp_attack>
#     <sp_defense>...</sp_defense>
#     <height><m>...</m></height>
#     <weight><kg>...</kg></weight>
#     <abilities>
#         <ability />
#     </abilities>
# </pokemon>

import sqlite3
import sys
import xml.etree.ElementTree as ET

# Check if the XML file name is provided
if len(sys.argv) < 2:
    print("You must pass at least one XML file name containing Pokemon to insert")
    sys.exit(1)

# Connect to the SQLite database
conn = sqlite3.connect('pokemon.sqlite')
cursor = conn.cursor()

# Iterate over the XML file names passed as command-line arguments
for i in range(1, len(sys.argv)):
    xml_file = sys.argv[i]

    # Parse the XML file
    tree = ET.parse(xml_file)
    root = tree.getroot()

    # Extract Pokemon attributes from the XML
    generation = root.get('generation')
    pokedex_number = root.get('pokedex')
    classification = root.get('classification')

    # Extract basic attributes
    name = root.find('name').text
    hp = int(root.find('hp').text)
    types = [elem.text for elem in root.findall('type')]
    attack = int(root.find('attack').text)
    defense = int(root.find('defense').text)
    speed = int(root.find('speed').text)
    sp_attack = int(root.find('sp_attack').text)
    sp_defense = int(root.find('sp_defense').text)
    height = float(root.find('height/m').text)
    weight = float(root.find('weight/kg').text)
    abilities = [elem.text for elem in root.findall('abilities/ability')]

   
conn.commit()
conn.close()

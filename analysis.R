#### Preamble ####
# Purpose: Does Analysis on the data
# Author: Vandan Patel 
# Date: 25 September 2024
# Contact: vandanp.patel@mail.utoronto.ca
# License: MIT


# Re-import the necessary data and libraries since the previous context has been reset
import pandas as pd
import matplotlib.pyplot as plt

# Reload the dataset
excel_file_path = '/Users/vandan/Desktop/ttc-bus-delay-data-2014.xlsx'
excel_data = pd.read_excel(excel_file_path)

# Cleaning the data: Remove rows with missing values in 'Min Delay' and 'Location'
cleaned_data = excel_data.dropna(subset=['Min Delay', 'Location'])

# Calculate the average delay per location
average_delay_per_location = cleaned_data.groupby('Location')['Min Delay'].mean().reset_index()

# Sort the data by delay for better visualization
average_delay_per_location = average_delay_per_location.sort_values(by='Min Delay', ascending=False)

# Now let's plot the graph using matplotlib
plt.figure(figsize=(10, 6))
plt.barh(average_delay_per_location['Location'], average_delay_per_location['Min Delay'], color='skyblue')
plt.xlabel('Average Delay (minutes)')
plt.ylabel('Location')
plt.title('Average Bus Delay by Location')
plt.tight_layout()
plt.show()

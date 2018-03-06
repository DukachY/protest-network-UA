# protest-network-UA
Network analysis of protest co-participation in Ukraine, 2011-2013

## Original data 
Protest event database is gathered by [Center for Social and Labor Research](http://cslr.org.ua/bazi-protestnih-podiy-ta-povidomlen-2/).  
Database includes the type of action used by the protesters (protest repertoire), information about participants and their goals, place and time of the event, the number of protesters, general description of each event and other variables.
You can download original database for each year: [2011](http://cslr.org.ua/wp-content/uploads/2014/10/2011_events.xlsx), [2012](http://cslr.org.ua/wp-content/uploads/2014/10/2012_Events_-_final.xlsx), [2013](http://cslr.org.ua/wp-content/uploads/2014/10/2013_Events.xlsx).

## Variables used in analysis: 
**1.** Event ID  
**2.** Event start day  
**3.** Actor specified (= main variable for network analysis)  
**4.** Oblast  
**5.** Number of protesters (was combined into 6 groups - according to sum for each organisation)  
**+** the database was filtered: *type == protest* (other options: repression and concessions)  

## Data preparation
**1.** To the protest network were included only political parties, trade unions and NGOs. People (e.g. "studets", "citizens"), commercial organizations (e.g. markets or big companies (except trade unions)) were excluded.  
  
**2.**  All the participants were splitted by pairs   
**For example:**   
*Raw data:*   
  
| Actor specified |  
| --------------- |  
| Direct Action, FRI, Left Opposition |  

*Work data:*  
  
| Actor 1       | Actor 2         |  
| ------------- | --------------- |  
| Direct Action | FRI             |  
| Direct Action | Left Opposition |  
| FRI           | Left Opposition |   
  
  
**3.** Tidying data was started in OpenRefine via text clustering and space removing.
  
**4.** Protest monitoring was prepared in English language with transliteration of Ukrainian organizations - most of the duplicates (for example, Ukrainian political party *"Батьківщина"* (later was renamed into *"БЮТ"*) was coded in the raw data as *"BYT", "Motherland", "Fatherland", "Homeland", "Batkivschina"* etc.) were deleted manually.  
   
# Files in the folder  
### .csv files  
+ *"allnames.csv"* - vertices attributes  
+ *"Edges all years.csv"* - list of the pairs and edge attributes
  
### R scripts  
+ *"Data_preparation.R"* - read.csv and setting all of the attributes (for vertices and edges)

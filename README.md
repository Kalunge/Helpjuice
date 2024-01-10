# Search Analytics App

> This application is designed to record and analyze search queries entered by users in real-time. It includes a simple backend built with Ruby on Rails and a Vanilla JS frontend.

Loom video demonstrating functionality
[Loom Video](https://www.loom.com/share/1eb7a6d9163a45b09b038aca72e89f45)


## Getting Started
### Prerequisites
Make sure you have the following installed on your machine:
- [Ruby](https://www.ruby-lang.org/en/)
- [Rails](https://gorails.com/)
- Node.js or Yarn for frontend dependencies

## Installation
git clone
```sh
https://github.com/your-username/search-analytics-app.git
cd search-analytics-app
```
## Install dependencies:
```sh
bundle install
```
## Set up the database:
```
rails db:create
rails db:migrate
```
## Start the Rails server:
rails server
rerun rails server to restart on detecting changes

Access the application in your web browser at http://localhost:3000.


## Creating Searches
The app provides an API endpoint for creating searches. Send a POST request to /searches with the search query as the query parameter. Example using cURL:
```sh
curl -X POST -d "query=what is a good car" http://localhost:3000/searches
```

## Viewing Analytics
To view search analytics, you can access the /searches/all_searches endpoint. The app provides a JSON response containing the search results. Additionally, the frontend can be customized to display these results in a user-friendly manner.

## Improvements for Scalability

### Caching
Consider implementing caching to store frequently queried searches. This can significantly reduce the load on the database and improve response times.

### Database Indexing
Add indexes to the database columns used in search queries to speed up retrieval. In the migration file db/migrate/YYYYMMDDHHMMSS_create_searches.rb, add indexes as follows:

```sh
class CreateSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :searches do |t|
      t.string :query
      t.string :ip_address

      t.timestamps
    end

    add_index :searches, :query
    add_index :searches, :ip_address
  end
end
```

### Background Processing
Move search creation and analytics processing to a background job queue. This can be achieved using tools like Sidekiq or Resque. Background processing ensures that your application remains responsive even during heavy traffic.

### Error Handling
Implement robust error handling to gracefully handle unexpected issues. Log errors for analysis and debugging. Use Rails' built-in exception handling and logging mechanisms.

### Monitoring and Alerting
Integrate monitoring tools to keep track of your application's health. Services like New Relic or Datadog can help you monitor performance, detect anomalies, and set up alerts for critical issues.

## Challenges
### Determining IP Address
Determining the accurate IP address of a user can be challenging due to factors like proxy servers and network configurations. The app uses the request.remote_ip method, which may not always reflect the user's actual IP address. Consider additional measures, such as using a service like ipinfo.io to enhance IP address accuracy. Also getting the searches as per ip address may pose a challenge.



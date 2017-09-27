# Wagon - Garage API 🚗

This API will help you store information about cars stored in your garage (repair shop 🛠). Four HTTP endpoints are here for you to use:

## Retrieve the list of cars in a garage

Here's the HTTP request you can run. Be careful, `:garage` in the URL is **dynamic**!

```bash
verb GET
url: https://wagon-garage-api.herokuapp.com/:garage/cars
```

You may choose any name for **your** garage. Your buddy and you should have different garage names! Example of garage names: 'reparator-2000', 'bricolman', 'abitbol-and-son', etc.

## Add a car to a garage

To add a new car to your garage, you need to send this HTTP request:

```bash
verb: POST
url: https://wagon-garage-api.herokuapp.com/:garage/cars
header: Content-Type: application/json
body:
  {
    "brand": "PEUGEOT",
    "model": "106",
    "owner": "ssaunier",
    "plate": "123AZ56"
  }
```

## Get infos for a car

If you know the `:id` of a car, you can retrieve its information with:

```bash
verb GET
url: https://wagon-garage-api.herokuapp.com/cars/:id
```

## Destroy a car

If you know the `:id` of a car, you can remove it with:

```bash
verb: DELETE
url: https://wagon-garage-api.herokuapp.com/cars/:id
```

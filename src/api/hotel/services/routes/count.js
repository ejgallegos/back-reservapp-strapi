module.exports = {
    routes: [
        { // Path defined with a URL parameter
            method: 'GET',
            path: '/hoteles/count',
            handler: 'hotel.count',
        },
    ]
}

// 'Hello World' nodejs12.x runtime AWS Lambda function
exports.hello = function (event, context) {
    console.log(event);
    context.succeed('hello ' + event.name + '!');
};    

/*
exports.handler = (event, context, callback) => {
    console.log('Hello, logs!');
    callback(null, 'great success');
}*/
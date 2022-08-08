import consumer from "channels/consumer"

consumer.subscriptions.create("TicTacToeChannel", {
  received(data) {
    window.location.reload()
  }
});

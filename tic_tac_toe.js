box1 = document.getElementById("index0").addEventListener("click", clicked);
box2 = document.getElementById("index1").addEventListener("click", clicked);
box3 = document.getElementById("index2").addEventListener("click", clicked);
box4 = document.getElementById("index3").addEventListener("click", clicked);
box5 = document.getElementById("index4").addEventListener("click", clicked);
box6 = document.getElementById("index5").addEventListener("click", clicked);
box7 = document.getElementById("index6").addEventListener("click", clicked);
box8 = document.getElementById("index7").addEventListener("click", clicked);
box9 = document.getElementById("index8").addEventListener("click", clicked);
newGameButton = document.getElementById("newGame").addEventListener("click", newGame);


function newGame() {
    gameboard.newGame();
}

function clicked() {
    index = this.id.slice(-1);  //gets index of clicked div
    currentPlayer = who.goes();
    gameboard.changeBoard(currentPlayer, index)
}

const who = (() => {
    let turn = 1;
    const switches = () => { //switches the turn
        ++turn
    };
    const goes = () => { //returns the player whose turn it is
        if (turn % 2 == 0){
            return player1;//player 1 turn
        } else {
            return player2;//player2 turn
        }
    };
    return {goes, switches};
})();

const Player = (name, token) => {
    return {name, token};
};

const gameboard = (() => {
    let board = ["", "", "", "", "", "", "", "", ""];
    let turn = 1;
    let gameIsNotOver = true;
    const changeBoard = (currentPlayer, index) => {
        if (gameIsNotOver) {
            if (board[index] == "") { //if board space is empty
                board[index] = currentPlayer.token //put in player token
                who.switches(); //switch the turn
                updateDisplay(currentPlayer, index);
                gameOver(currentPlayer);
            } //else do nothing
        }
    };
    const updateDisplay = (player, index) => {
        let currentBox = `index${index}`
        document.getElementById(currentBox).innerHTML = player.token;
    };
    const gameOver = (currentPlayer) => {
        if (((board[0] == board[1] && board[0] == board[2]) && (board[0] != "")) ||
            ((board[3] == board[4] && board[3] == board[5]) && (board[3] != "")) ||
            ((board[6] == board[7] && board[6] == board[8]) && (board[6] != "")) ||
            ((board[0] == board[3] && board[0] == board[6]) && (board[0] != "")) ||
            ((board[1] == board[4] && board[1] == board[7]) && (board[1] != "")) ||
            ((board[2] == board[5] && board[2] == board[8]) && (board[2] != "")) ||
            ((board[0] == board[4] && board[0] == board[8]) && (board[0] != "")) ||
            ((board[2] == board[4] && board[2] == board[6]) && (board[2] != ""))) {
                console.log("Game Over!");
                gameIsNotOver = false;
                console.log(`${currentPlayer.name} is the winna man!`)//log currentplayer as winner
        } else if (turn == 9) {
            console.log("TIE!");
            gameIsNotOver = false;
        }
        ++turn
    }
    const newGame = () => {
        board = ["", "", "", "", "", "", "", "", ""];
        turn = 1;
        gameIsNotOver = true;
        for (i = 0; i<9 ; ++i){
            let currentBoxID = `index${i}`
            currentBoxDiv = document.getElementById(currentBoxID).innerHTML = `${board[i]}`
        }
    }
    return {changeBoard, newGame};
})();


const player1 = Player("Player1", "X"); // creates player object
const player2 = Player("Player2", "O");  // creates player object
const previous = document.querySelector('#previous');
const play = document.querySelector('#play');
const next = document.querySelector('#next');

const title = document.querySelector('#title');
const image = document.querySelector('#image');

const track = document.createElement('audio');

let index = 0;
let playingSong = false;

let songs = [{
        name: 'How Long',
        path: './songs/how-long.mp3',
        image: './Top albums/audio4.jpg',
        
    },
    {
        name: 'Pay Phone',
        path: './songs/payphone.mp3',
        image: './Top albums/audio2.jpg',
    },
    {
        name: 'Intentions',
        path: './songs/intentions.mp3',
        image: './Top albums/audio3.jpg',
    },
    {
        name: 'Love Like This',
        path: './songs/love-like-this.mp3',
        image: './Top albums/audio1.jpg', 
    },
    {
        name: 'Lets Get Crazy',
        path: './songs/lets-get-crazy.mp3',
        image: './Top albums/audio5.jpg',
    }
];

function loadTrack(index) {
    track.src = songs[index].path;
    title.innerPHP = songs[index].name;
    image.src = songs[index].image;
    track.load();
}

loadTrack(index);

function playSong() {
    track.play();
    playingSong = true;
    play.innerPHP = '<i class="fas fa-pause"></i>';
}

function pauseSong() {
    track.pause();
    playingSong = false;
    play.innerPHP = '<i class="fas fa-play"></i>';
}

function nextSong() {
    if (index < songs.length - 1) {
        index += 1;
        loadTrack(index);
        playSong();
    } else {
        index = 0;
        loadTrack(index);
        playSong();

    }
}

function previousSong() {
    if (index > 0) {
        index -= 1;
        loadTrack(index);
        playSong();

    } else {
        index = songs.length;
        loadTrack(index);
        playSong();
    }
}

function justPlay() {
    if (playingSong == false) {
        playSong();

    } else {
        pauseSong();
    }
}
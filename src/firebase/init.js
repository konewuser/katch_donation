// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
import { getFirestore } from "firebase/firestore";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
    apiKey: "AIzaSyDYhI_yYWc0OYyMC2Rh1Dh4vyFLGBFaCyY",
    authDomain: "annualdinnerluckydraw.firebaseapp.com",
    projectId: "annualdinnerluckydraw",
    storageBucket: "annualdinnerluckydraw.appspot.com",
    messagingSenderId: "854928987784",
    appId: "1:854928987784:web:1c2731488c0deb47a7713d",
    measurementId: "G-RB892PWG7T"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
// init firestore service
const db = getFirestore()
export default db
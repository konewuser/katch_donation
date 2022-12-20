<template>
    <div>
        <div  class="text-center text-kadenYellow font-sunny description text-[100px]">Konew Annual Dinner Lucky Draw</div>
        <div class="grid grid-cols-2 md:grid-cols-6 gap-4">
            <div v-for="item in list" :key="item.result_no">
                <ResultBox :value="item"></ResultBox>
            </div>
        </div>
    </div>
</template>

<script>
import ResultBox from './ResultBox.vue'
import db from '../firebase/init'
import { collection, getDoc, getDocs, onSnapshot, orderBy, query } from '@firebase/firestore';
export default ({
    data(){
        return{
            list:[
            ],
        }
    },
    components:{
        ResultBox
    },
    created(){
         this.readEmployees();
    },
    methods:{
        async readEmployees() {
            onSnapshot(query(collection(db, 'results'), orderBy('result_no')),  (snapshot) => {
                this.list = []
                          console.log(snapshot);
                          snapshot.forEach((doc) => {
                    
                this.list.push(doc.data())
            })
             },
  (error) => { });
            // let sp = await getDocs(ref);
            // console.log(sp);
            // sp.forEach((doc) => {
            //     this.list.push(doc.data())
            // })
    //   db.collection("results")
    //     .get()
    //     .then((querySnapshot) => {
    //       querySnapshot.forEach((doc) => {
    //         this.list.push({
    //           id: doc.id,
    //           result_no: doc.data().result_no,
    //           winner: doc.data().winner,
    //         });
    //         console.log(doc.id, " => ", doc.data());
    //       });
    //     })
    //     .catch((error) => {
    //       console.log("Error getting documents: ", error);
    //     });
    }
    }
})
</script>
<style>
 .description{
     font-family: "Sunny Spells", Helvetica, Arial;
     text-shadow: 6px 7px 0px black;
  }

  @font-face {
  font-family: "Sunny Spells";
  src: local("Sunny Spells"),
   url(@/src/assets/fonts/sunny_spellfs.ttf) format("truetype");
}

</style>
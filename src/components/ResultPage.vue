<template>
    <div class="" style="aspect-ratio: 7/2;">
        <div class="flex flex-col w-[100%] h-[100vh] relative">
            <div class="btn absolute top-[2%] left-[2%] cursor-pointer" @click="now_page-=1" v-if="now_page>=1">prev page</div>
            <div class="btn absolute top-[2%] right-[2%] cursor-pointer" @click="now_page+=1" v-if="now_page<(this.list.length/30)-1">next page</div>
            <div class="btn absolute top-[2%] right-[10%] cursor-pointer" @click="delEmployees">Del</div>
            <div class="w-[70%] mx-auto pt-[3%] pb-[1%] flex" style="pointer-events:none;"><img src="/banner.png" class="mx-auto "></div>
            <div class="flex mb-10 mr-10 ml-10 flex-wrap">
                <div v-for="item in display_list[now_page]" :key="item.result_no" class="w-1/6 select-none">
                    <ResultBox :value="item"></ResultBox>
                </div>
            </div>
        </div>
    </div>
</template>

    
<script>
import ResultBox from './ResultBox.vue'
import db from '../firebase/init'
import {
    collection,
    deleteDoc,
    doc,
    getDoc,
    getDocs,
    onSnapshot,
    orderBy,
    query
} from '@firebase/firestore';
export default ({
    data() {
        return {
            list: [],
            display_list: [],
            now_page: 0,
            last_item: "",
        }
    },
    components: {
        ResultBox
    },
    created() {
        this.readEmployees();
    },
    methods: {
        readEmployees() {
            onSnapshot(query(collection(db, 'results'), orderBy('created_at')), (snapshot) => {
                    this.list_length = snapshot.docs.length
                    this.list = []
                    snapshot.forEach((doc) => {
                        this.list.push(doc.data())
                    })
                    this.last_item = snapshot.docs[this.list.length - 1].id;
                    this.cut_array();
                },
                (error) => {}
            )
        },
        cut_array() {
            this.display_list = []
            for (let i = 0; i < this.list.length / 30; i++) {
                let array = this.list.slice(30 * i, 30 * (i + 1))
                this.display_list.push(array);
            }
        },
        delEmployees() {
            deleteDoc(doc(db, "results", this.last_item));
            console.log(123);
        },
    }
})
</script> 

    
<style>
.description {
    font-family: "Sunny Spells", Helvetica, Arial;
    text-shadow: 6px 7px 0px black;
}

@font-face {
    font-family: "Sunny Spells";
    src: local("Sunny Spells"),
        url(@/assets/fonts/sunny_spells.ttf) format("truetype");
}

.btn {
    border: 2px black solid;
    border-radius: 15px;
    background-color: white;
    padding: 1vw;
    font-size: 1vw;
    line-height: 1vw;
}
</style>

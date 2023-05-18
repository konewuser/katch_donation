<template>
    <div class="bg-[#FF7A00]">
        <!-- <div class="">
            <div class="bg-[#FF7A00] h-[70vh] relative">
                <img src="@/assets/images/1.png" class="w-[100%] h-[70vh] absolute top_banner">
                <div class="relative">
                    <img src="@/assets/images/top_banner_word.png">
                </div>
            </div>
        </div> -->
        <div class="">
            <img src="@/assets/images/banner.jpg" class="w-[100%] hidden md:block banner">
            <img src="@/assets/images/banner_02.jpg" class="w-[100%] md:hidden" style="object-fit: cover;">
        </div>
        <div class="max-w-[1980px] mx-auto text-[20px] pt-[70px] pl-[20px] pr-[20px]">
            <div class="rounded-[12px] mx-auto border-black border-2 relative">
                <div class="rounded-[8px] centered-element font-[900] md:text-[3vw] md:w-[30vw] md:max-w-[400px] text-center lg:text-[30px] text-[4vw] min-w-[300px] w-[40vw]">
                    即睇參加流程
                </div>
                <div class="bg-[white] w-[100%] h-[100%] rounded-[12px] p-[20px] pt-[50px] font-bold">
                    <div class="">1&nbsp&nbsp&nbsp&nbsp成為Katch會員 + 預備《Katch Our Life方皓玟音樂會》門票票尾</div>
                    <div class="pt-[15px]">2&nbsp&nbsp&nbsp&nbsp到本網頁登記抽獎,並填寫資料&nbsp1)&nbsp申請人姓名&nbsp2)&nbsp香港身份證號碼(首四個數字)&nbsp3)&nbspKatch會員編號&nbsp4)&nbsp《Katch Our Life 方皓玟音樂會》門票票尾8位編號</div>
                    <div class="pt-[15px]">3&nbsp&nbsp&nbsp&nbsp成為Katch會員 + 預備《Katch Our Life方皓玟音樂會》門票票尾</div>
                    <div class="text-[8px] pt-[10px]">
                        *受條款及細則約束<br>
                        推廣生意的競賽牌照號碼:57013
                    </div>
                </div>
            </div>
        </div>
        <div class="max-w-[1980px] mx-auto text-[12px] mt-[70px] pl-[20px] pr-[20px]">
            <div class="rounded-[12px] mx-auto border-black border-2 relative">
                <div class="rounded-[8px] centered-element font-[900] md:text-[3vw] md:w-[30vw] md:max-w-[400px] text-center lg:text-[30px] text-[4vw] min-w-[300px] w-[40vw]">
                    立即參加
                </div>
                <div class="bg-[white] w-[100%] rounded-[12px] p-[20px] pt-[50px] font-bold">
                    <div class="w-[100%] md:flex h-[100%]" v-show="!api_callback" >
                        <div class="flex flex-col md:w-[60%] w-[100%]  h-[100%]">
                            <div class="md:flex items-center pt-[20px]">
                                <div class="md:w-[50%] md:text-right pr-[10px]">申請人姓名(姓名必須與香港身份證一樣)</div>
                                <input type="text" class="md:w-[50%] rounded-[12px] w-[100%]" placeholder="Chan Tai Man" v-model="name">
                            </div>
                            <div class="md:flex items-center pt-[20px]">
                                <div  class="md:w-[50%] md:text-right pr-[10px]" style="line-height: 100%;">香港身分證號碼(首四個數字)</div>
                                <input type="text" class="md:w-[50%] rounded-[12px] w-[100%]" placeholder="e.g : 1234" v-model="ID">
                            </div>
                            <div class="md:flex items-center pt-[20px]">
                                <div  class="md:w-[50%] md:text-right pr-[10px]">Katch會員編號(Katch ID)</div>
                                <input type="text" class="md:w-[50%] rounded-[12px] w-[100%]" placeholder="e.g : Katch123456" v-model="katch_id">
                            </div>
                            <div class="md:flex items-center pt-[20px]">
                                <div  class="md:w-[50%] md:text-right pr-[10px]">門票編號</div>
                                <input type="text" class="md:w-[50%] rounded-[12px] w-[100%]" placeholder="e.g : AA123456" v-model="ticket_id">
                            </div>
                        </div>
                        <div class="w-[40%] md:block hidden h-[270px]">
                            <img src="@/assets/images/ticket02.jpg" class="object-cover h-[100%]">
                        </div>

                        <div class="w-[100%] block md:hidden">
                            <img src="@/assets/images/ticket01.jpg" class="object-cover">
                        </div>
                    </div>
                    <div class="loader mx-auto" style="width: 50px;height: 50px;" v-show="!api_callback&&disable">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50" preserveAspectRatio="xMidYMid">
                            <circle cx="25" cy="25" fill="none" stroke="#FF7A00" stroke-width="4" r="20" stroke-dasharray="80 60" transform="rotate(275.845 25 25)">
                                <animateTransform attributeName="transform" type="rotate" repeatCount="indefinite" dur="1s" values="0 25 25;360 25 25" keyTimes="0;1"></animateTransform>
                            </circle>
                        </svg>
                    </div>
                    <div class="inline-block flex w-[100%]" v-show="!api_callback&&!disable">
                        <div class="bg-[#FF7A00]  mx-auto mt-[20px] pr-[30px] pl-[30px] text-[24px] rounded-[12px] font-bold" @click="submit" style="cursor: pointer;">
                            提交
                        </div>
                    </div>

                    <div class="h-[304px] w-[100%]" v-show="api_callback">
                        <div class="text-[30px] item-center">
                            <div class="flex justify-center pt-[70px]">
                                <div class="bg-black p-[20px] rounded-[50%]">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px" y="0px" viewBox="0 0 507.506 507.506" style="enable-background:new 0 0 507.506 507.506;" xml:space="preserve" width="70" height="70">
                                        <g>
                                            <path fill="#FF7A00" d="M163.865,436.934c-14.406,0.006-28.222-5.72-38.4-15.915L9.369,304.966c-12.492-12.496-12.492-32.752,0-45.248l0,0   c12.496-12.492,32.752-12.492,45.248,0l109.248,109.248L452.889,79.942c12.496-12.492,32.752-12.492,45.248,0l0,0   c12.492,12.496,12.492,32.752,0,45.248L202.265,421.019C192.087,431.214,178.271,436.94,163.865,436.934z" />
                                        </g>
                                    </svg>
                                </div>
                            </div>
                            <div class="text-center">
                                提交成功
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="max-w-[1980px] mx-auto font-bold pt-[30px] pb-[50px] pl-[20px] pr-[20px]">
            <div class="">
                「《Katch Our Life方皓玟音樂會》賞飛抽獎」的活動條款及細則(“本條款及細則”)
            </div>
            <ol class="list-decimal pl-5">
                <li>
                    Katch(HK) Limited(下稱「本司」)為本活動的主辦單位。任何人士參與由本司舉辦之「《Katch Our Life方皓玟音樂會》賞飛抽獎」( “本次活動”)即被視為明白並願意遵守本條款及細則和本司及本次活動相關的私隱政策及聲明並受其約束。
                </li>
                <li>
                    本次活動的推廣期為由即日起至2023年5月22日。
                </li>
                <li>
                    本次活動只適用於持有2023年5月19日及/或2023年5月20日《Katch Our Life方皓玟音樂會》門票(“門票”)的Katch會員(必須要以實名在Katch 應用程式內登記成為Katch會員及設定用戶名稱)(“會員”)參加。
                </li>
                <li>
                    本次活動參加辦法:合資格會員必須在2023年5月19日下午5時至2023年5月20日下午11時59分前成功於Katch 應用程式內的專頁完成登記方可參加本次活動,並獲得參加本次活動抽獎機會一個。登記時,會員必須提供其Katch會員號碼以及門票票尾上獨有的參考編號(由2個英文字母及6個數字組成)以登記參加本次活動。
                </li>
                <li>
                    每位會員每晚最多只可持一張門票登記,以獲取參加本次活動機會一個。如會員同時持有2023年5月19日以及2023年5月20日的門票,並於指定時間結束前完成登記,可共獲取參加本次活動機會兩個。每位會員最多可在本次活動中得到2個機會及最多可中獎一次。每張門票只可登記一次。
                </li>
                <li>
                    本司將會在收集全部參加者的資料後在Katch (HK) Limited辦公室內由本司職員抽出本次活動的得獎者及候補得獎者。本司會以電腦隨機方式(一按即抽出16位得獎者及候補得獎者的形式)抽出本次活動的得獎者。如得獎者未能於指定時間及地點領取獎品,其得獎資格將會被取消,並由候補得獎者補上。由於每位會員只限中獎一次,所以假如本司抽出的得獎者中有重覆的得獎者,重覆得獎的位置將會由候補得獎者補上。得獎名單之網址將於2023年5月29日在星島日報及英文虎報內公佈。
                </li>
                <li>
                    本次活動的獎品(“獎品”)為香港快運航空(Hong Kong Express)總值港幣6,000元正的現金券。獎品共有16份。
                </li>
                <li>
                    得獎的會員必須按照本司其後向其發出的電郵內的方法,於指定時間及地點領取獎品,逾期無效。
                </li>
                <li>
                    領取獎品時,得獎者必須向本司職員提供身份證明文件以確認是會員本人及出示得獎之門票票尾正本才可領取獎品。得獎者必須於簽收文件上填寫其香港身份證的頭4個字以作紀錄,否則其得獎資格將會被取消。如本司職員對會員身份或提供的門票票尾正本真偽存有懷疑,本司職員將有權取消該會員的領取獎品資格。如有任何爭拗,本司擁有最終決定權,會員不得異議。會員有責任保管門票票尾至領取獎品當日。如會員遺失、損壞及/或塗污門票,本司一概不會補發或更換門票。
                </li>
                <li>
                    如發現有會員以不正當手法參加本次活動,本司有權取消該會員參加本次活動及領取獎品資格,而不另作任何通知。
                </li>
                <li>
                    會員必須確保所提供的會員登記資料全屬真實、正確、完整、沒有誤導及欺詐成份。本司概不承擔任何未能成功傳送的手機短訊、推送通知或電郵之責任。
                </li>
                <li>
                    任何因電腦、智能電話、網絡技術問題而引致會員的申請或登記本次活動有所延誤、遺失、錯誤、無法辨識等情況,會員將被視為未能完成申請或登記本活動,而本司概不對此負上任何責任。
                </li>
                <li>
                    本司並非獎品之供應商,故此不會承擔與之相關的任何責任。一切有關該獎品的爭議,須由參加者直接與獎品供應商自行解決。
                </li>
                <li>
                    本司之職員均不得參與本次活動,以示公允。
                </li>
                <li>
                    有關收集、保留、處理或以任何方式處理個人資料有關的私隱事宜的責任及政策提供的資料,可瀏覽 Katch 應用程式內的私隱政策聲明。
                </li>
                <li>
                    本司對本條款及細則擁有絕對之解釋權。如有任何爭議,本司將保留最終決定權。
                </li>
                <li>
                    如推廣內容及本條款及細則有任何抵觸,應以本條款及細則為準。
                </li>
                <li>
                    本次活動並不構成對任何人進行本條款所述的任何交易或任何類似交易的要約、邀請或推薦。本次活動或本條款並未視作、暗示或建議任何人代表本司參與任何商業行為,本條款另有訂明除外。
                </li>
                <li>
                    並非本條款協議一方的人士無權按《合約(第三者權利)條例》(香港法例第623章)執行本條款的任何條文,或享有本條款的任何條文下的利益。
                </li>
                <li>
                    本條款在所有方面均受香港特別行政區法律的管限,並鬚根據香港特別行政區法律的解釋。雙方得受香港特別行政區法院的專屬管轄權管轄。
                </li>
                <li>
                    推廣生意的競賽牌照號碼:57013
                </li>
            </ol>
        </div>
    </div>
</template>

    
<script>
import Swal from 'sweetalert2'
export default {
    data() {
    return {
        name:"",
        ID:"",
        katch_id:"",
        ticket_id:"",
        api:"",
        api_callback:false,
        disable:false,
    }
  },
  created(){
    if(window.location.host == "icy-mud-0e58ea700.3.azurestaticapps.net"){
        this.api = "https://katch-prd-api.azurewebsites.net"
    }else{
        this.api = "https://katch-prd-api.azurewebsites.net"
    }
  },
  methods: {
    async submit(){
        this.disable = true;
        if(this.name == "" ||this.ID == "" ||this.katch_id == "" ||this.ticket_id == "" ){
            Swal.fire(
                '請輸入所有資料'
            )
            this.disable = false;
            return 
        }

        if(!/^[Kk]atch1\d{5}$/.test(this.katch_id)){
            Swal.fire(
                'Katch會員編號錯誤'
            )
            this.disable = false;
            return 
        }

        if(!/^\d{4}$/.test(this.ID)){
            Swal.fire(
                '香港身分證號碼錯誤'
            )
            this.disable = false;
            return 
        }

        if(this.ticket_id.length != 8||!/^[A-Za-z]{2}\d{6}$/.test(this.ticket_id)){
            Swal.fire(
                '門票編號錯誤'
            )
            this.disable = false;
            return 
        }

        if(this.name.length >100){
            Swal.fire(
                '申請人姓名太長'
            )
            this.disable = false;
            return 
        }

        if(!/^[\u4e00-\u9fa5a-zA-Z\s]*$/.test(this.name)){
            Swal.fire(
                '請輸入正確名字'
            )
            this.disable = false;
            return 
        }

        var katch_id = this.katch_id.replace("katch1","").replace("Katch1","")

        var api_call = await fetch(this.api+'/api/katch_our_life_event', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            name:this.name,
            ID: this.ID,
            katch_id: katch_id,
            ticket_id: this.ticket_id,
        }),
      })
      let result = await api_call.json();
      if(result.result == true){
        this.api_callback = true;
        this.disable = false;
      }else{
        this.disable = false;
        Swal.fire(
            result.message
        )
      }
    }
  }
}
</script> 

    
<style>
.top_banner{
    clip-path: polygon(0% 0%, 100% 0, 100% 73%, 0% 91%);
}

.centered-element {
  position: absolute;
  top: 0;
  left: 50%;
  background-color: black;
  padding-left: 10px;
  color:#FF7A00;
  transform: translate(-50%, -50%);
  letter-spacing:10px;
}

.banner{
    object-fit: cover;
    height:700px;
    width:100%;
}

@media only screen and (max-width: 1300px) {
    .banner{
        object-fit: cover;
        height:500px;
    }
}

@media only screen and (max-width: 940px) {
    .banner{
        object-fit: cover;
        height:400px;
    }
}
</style>

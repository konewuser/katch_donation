<template>
    <div class="h-[100%] pt-[10px] ">
        <div class="border-solid border-l-2 border-t-2 border-r-8 border-b-8 border-black bg-white mr-2 mb-2 grid place-items-center h-[100%] "  style="border-radius: 35px;">
            <div class="text-center text-[4vw] font-extrabold" >{{ value.winner }}</div>
            <div class="absolute top-[5%] left-[5%] text-[2vw] font-extrabold">{{ value.result_no }}</div>
        </div>
    </div>
</template>

<script>

export default({
    props:{
        value:Object
    }
})
</script>

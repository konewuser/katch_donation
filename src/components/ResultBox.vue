<template>
    <div>
        <div class="border-solid border-l-2 border-t-2 border-r-8 border-b-8 border-black bg-white mr-2 mb-2 grid place-items-center aspect-square"  style="border-radius: 35px;">
            <div class="text-center text-[56px] font-extrabold" >{{ value.winner }}</div>
            <div class="absolute top-[10px] left-[28px] text-[28px] font-extrabold">{{ value.result_no }}</div>
        </div>
    </div>
</template>

<script>

export default({
    props:{
        value:String
    }
})
</script>

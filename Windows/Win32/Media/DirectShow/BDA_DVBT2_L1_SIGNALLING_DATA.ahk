#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_DVBT2_L1_SIGNALLING_DATA {
    #StructPack 1

    L1Pre_TYPE : Int8

    L1Pre_BWT_S1_S2 : Int8

    L1Pre_REPETITION_GUARD_PAPR : Int8

    L1Pre_MOD_COD_FEC : Int8

    L1Pre_POSTSIZE_INFO_PILOT : Int8[5]

    L1Pre_TX_ID_AVAIL : Int8

    L1Pre_CELL_ID : Int8[2]

    L1Pre_NETWORK_ID : Int8[2]

    L1Pre_T2SYSTEM_ID : Int8[2]

    L1Pre_NUM_T2_FRAMES : Int8

    L1Pre_NUM_DATA_REGENFLAG_L1POSTEXT : Int8[2]

    L1Pre_NUMRF_CURRENTRF_RESERVED : Int8[2]

    L1Pre_CRC32 : Int8[4]

    L1PostData : Int8[1]

}

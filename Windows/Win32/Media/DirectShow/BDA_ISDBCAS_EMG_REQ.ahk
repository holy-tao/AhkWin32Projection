#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_ISDBCAS_EMG_REQ {
    #StructPack 1

    bCLA : Int8

    bINS : Int8

    bP1 : Int8

    bP2 : Int8

    bLC : Int8

    bCardId : Int8[6]

    bProtocol : Int8

    bCABroadcasterGroupId : Int8

    bMessageControl : Int8

    bMessageCode : Int8[1]

}

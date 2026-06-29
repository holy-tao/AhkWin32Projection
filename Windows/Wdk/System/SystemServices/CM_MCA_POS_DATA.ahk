#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct CM_MCA_POS_DATA {
    #StructPack 2

    AdapterId : UInt16

    PosData1 : Int8

    PosData2 : Int8

    PosData3 : Int8

    PosData4 : Int8

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_CAS_REQUESTTUNERDATA {
    #StructPack 4

    ucRequestPriority : Int8

    ucRequestReason : Int8

    ucRequestConsequences : Int8

    ulEstimatedTime : UInt32

}

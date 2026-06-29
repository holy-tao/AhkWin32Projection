#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KSYSTEM_TIME {
    #StructPack 4

    LowPart : UInt32

    High1Time : Int32

    High2Time : Int32

}

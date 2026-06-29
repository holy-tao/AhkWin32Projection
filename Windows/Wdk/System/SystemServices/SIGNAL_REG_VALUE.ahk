#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct SIGNAL_REG_VALUE {
    #StructPack 8

    RegName : Int8[32]

    MsrAddr : UInt32

    Value : Int64

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct POWER_SEQUENCE {
    #StructPack 4

    SequenceD1 : UInt32

    SequenceD2 : UInt32

    SequenceD3 : UInt32

}

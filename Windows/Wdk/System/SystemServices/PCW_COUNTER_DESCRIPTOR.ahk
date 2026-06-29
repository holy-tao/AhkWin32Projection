#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCW_COUNTER_DESCRIPTOR {
    #StructPack 2

    Id : UInt16

    StructIndex : UInt16

    Offset : UInt16

    Size : UInt16

}

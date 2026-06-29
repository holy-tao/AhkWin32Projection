#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_UNION_ARM_SELECTOR {
    #StructPack 4

    Reserved1 : Int8

    Alignment : Int8

    Reserved2 : UInt16

    Arms : UInt32

}

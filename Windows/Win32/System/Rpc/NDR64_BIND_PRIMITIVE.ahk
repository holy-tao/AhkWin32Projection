#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_BIND_PRIMITIVE {
    #StructPack 2

    HandleType : Int8

    Flags : Int8

    StackOffset : UInt16

    Reserved : UInt16

}

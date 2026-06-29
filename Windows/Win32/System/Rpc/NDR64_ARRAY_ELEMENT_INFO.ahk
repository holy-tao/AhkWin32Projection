#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_ARRAY_ELEMENT_INFO {
    #StructPack 8

    ElementMemSize : UInt32

    Element : IntPtr

}

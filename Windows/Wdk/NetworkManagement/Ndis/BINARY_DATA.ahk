#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct BINARY_DATA {
    #StructPack 8

    Length : UInt16

    Buffer : IntPtr

}

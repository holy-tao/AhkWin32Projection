#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct RTL_BITMAP {
    #StructPack 8

    SizeOfBitMap : UInt32

    Buffer : IntPtr

}

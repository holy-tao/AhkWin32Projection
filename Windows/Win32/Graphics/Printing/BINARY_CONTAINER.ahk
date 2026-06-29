#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct BINARY_CONTAINER {
    #StructPack 8

    cbBuf : UInt32

    pData : IntPtr

}

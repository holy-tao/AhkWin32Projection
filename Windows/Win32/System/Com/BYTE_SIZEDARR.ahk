#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct BYTE_SIZEDARR {
    #StructPack 8

    clSize : UInt32

    pData : IntPtr

}

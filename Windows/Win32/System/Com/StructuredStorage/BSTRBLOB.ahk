#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct BSTRBLOB {
    #StructPack 8

    cbSize : UInt32

    pData : IntPtr

}

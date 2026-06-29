#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct COR_SECATTR {
    #StructPack 8

    tkCtor : UInt32

    pCustomAttribute : IntPtr

    cbCustomAttribute : UInt32

}

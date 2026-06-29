#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.LibraryLoader
 */
export default struct ENUMUILANG {
    #StructPack 8

    NumOfEnumUILang : UInt32

    SizeOfEnumUIBuffer : UInt32

    pEnumUIBuffer : IntPtr

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct GOPHER_ABSTRACT_ATTRIBUTE_TYPE {
    #StructPack 8

    ShortAbstract : IntPtr

    AbstractFile : IntPtr

}

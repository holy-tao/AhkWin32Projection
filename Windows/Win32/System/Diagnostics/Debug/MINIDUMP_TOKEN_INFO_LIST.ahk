#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_TOKEN_INFO_LIST {
    #StructPack 4

    TokenListSize : UInt32

    TokenListEntries : UInt32

    ListHeaderSize : UInt32

    ElementHeaderSize : UInt32

}

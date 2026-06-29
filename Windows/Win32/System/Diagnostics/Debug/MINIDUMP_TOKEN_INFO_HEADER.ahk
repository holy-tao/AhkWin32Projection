#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_TOKEN_INFO_HEADER {
    #StructPack 8

    TokenSize : UInt32

    TokenId : UInt32

    TokenHandle : Int64

}

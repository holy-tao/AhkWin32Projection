#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct NEGOTIATE_PACKAGE_PREFIXES {
    #StructPack 4

    MessageType : UInt32

    PrefixCount : UInt32

    Offset : UInt32

    Pad : UInt32

}

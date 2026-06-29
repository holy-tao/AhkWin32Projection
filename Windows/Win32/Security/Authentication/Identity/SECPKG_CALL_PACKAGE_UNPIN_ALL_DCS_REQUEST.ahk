#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_CALL_PACKAGE_UNPIN_ALL_DCS_REQUEST {
    #StructPack 4

    MessageType : UInt32

    Flags : UInt32

}

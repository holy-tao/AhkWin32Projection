#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_EVENT_ROLE_CHANGE {
    #StructPack 4

    PreviousRole : UInt32

    NewRole : UInt32

}

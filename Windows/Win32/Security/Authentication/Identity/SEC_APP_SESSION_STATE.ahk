#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SEC_APP_SESSION_STATE {
    #StructPack 2

    AppSessionStateSize : UInt16

    AppSessionState : Int8[1]

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct LEGACY_IDENTITY_UI_PARAMS {
    #StructPack 8

    eapType : UInt32

    dwFlags : UInt32

    dwSizeofConnectionData : UInt32

    pConnectionData : IntPtr

    dwSizeofUserData : UInt32

    pUserData : IntPtr

    dwSizeofUserDataOut : UInt32

    pUserDataOut : IntPtr

    pwszIdentity : PWSTR

    dwError : UInt32

}

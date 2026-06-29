#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EAP_ERROR.ahk" { EAP_ERROR }
#Import ".\EAP_METHOD_TYPE.ahk" { EAP_METHOD_TYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\EAP_TYPE.ahk" { EAP_TYPE }

/**
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EAPHOST_IDENTITY_UI_PARAMS {
    #StructPack 8

    eapMethodType : EAP_METHOD_TYPE

    dwFlags : UInt32

    dwSizeofConnectionData : UInt32

    pConnectionData : IntPtr

    dwSizeofUserData : UInt32

    pUserData : IntPtr

    dwSizeofUserDataOut : UInt32

    pUserDataOut : IntPtr

    pwszIdentity : PWSTR

    dwError : UInt32

    pEapError : EAP_ERROR.Ptr

}

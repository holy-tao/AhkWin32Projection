#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import ".\WEBAUTHN_PLUGIN_REQUEST_TYPE.ahk" { WEBAUTHN_PLUGIN_REQUEST_TYPE }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_PLUGIN_OPERATION_REQUEST {
    #StructPack 8

    hWnd : HWND

    transactionId : Guid

    cbRequestSignature : UInt32

    pbRequestSignature : IntPtr

    requestType : WEBAUTHN_PLUGIN_REQUEST_TYPE

    cbEncodedRequest : UInt32

    pbEncodedRequest : IntPtr

}

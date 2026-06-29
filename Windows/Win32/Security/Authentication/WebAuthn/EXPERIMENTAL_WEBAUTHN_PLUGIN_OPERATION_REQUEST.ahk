#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct EXPERIMENTAL_WEBAUTHN_PLUGIN_OPERATION_REQUEST {
    #StructPack 8

    hWnd : HWND

    transactionId : Guid

    cbRequestSignature : UInt32

    pbRequestSignature : IntPtr

    cbEncodedRequest : UInt32

    pbEncodedRequest : IntPtr

}

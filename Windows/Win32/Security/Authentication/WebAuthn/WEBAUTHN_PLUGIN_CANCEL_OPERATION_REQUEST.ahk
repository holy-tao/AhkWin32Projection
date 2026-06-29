#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_PLUGIN_CANCEL_OPERATION_REQUEST {
    #StructPack 8

    transactionId : Guid

    cbRequestSignature : UInt32

    pbRequestSignature : IntPtr

}

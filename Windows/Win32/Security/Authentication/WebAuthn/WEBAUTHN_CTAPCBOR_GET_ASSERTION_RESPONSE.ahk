#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WEBAUTHN_CREDENTIAL.ahk" { WEBAUTHN_CREDENTIAL }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WEBAUTHN_ASSERTION.ahk" { WEBAUTHN_ASSERTION }
#Import ".\WEBAUTHN_USER_ENTITY_INFORMATION.ahk" { WEBAUTHN_USER_ENTITY_INFORMATION }
#Import ".\WEBAUTHN_EXTENSION.ahk" { WEBAUTHN_EXTENSION }
#Import ".\WEBAUTHN_EXTENSIONS.ahk" { WEBAUTHN_EXTENSIONS }
#Import ".\WEBAUTHN_HMAC_SECRET_SALT.ahk" { WEBAUTHN_HMAC_SECRET_SALT }

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_CTAPCBOR_GET_ASSERTION_RESPONSE {
    #StructPack 8

    WebAuthNAssertion : WEBAUTHN_ASSERTION

    pUserInformation : WEBAUTHN_USER_ENTITY_INFORMATION.Ptr

    dwNumberOfCredentials : UInt32

    lUserSelected : Int32

    cbLargeBlobKey : UInt32

    pbLargeBlobKey : IntPtr

    cbUnsignedExtensionOutputs : UInt32

    pbUnsignedExtensionOutputs : IntPtr

}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\WEBAUTHN_CREDENTIAL.ahk
#Include .\WEBAUTHN_EXTENSIONS.ahk
#Include .\WEBAUTHN_ASSERTION.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 * @version v4.0.30319
 */
class WEBAUTHN_CTAPCBOR_GET_ASSERTION_RESPONSE extends Win32Struct
{
    static sizeof => 216

    static packingSize => 8

    /**
     * @type {WEBAUTHN_ASSERTION}
     */
    WebAuthNAssertion{
        get {
            if(!this.HasProp("__WebAuthNAssertion"))
                this.__WebAuthNAssertion := WEBAUTHN_ASSERTION(0, this)
            return this.__WebAuthNAssertion
        }
    }

    /**
     * @type {Pointer<WEBAUTHN_USER_ENTITY_INFORMATION>}
     */
    pUserInformation {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * @type {Integer}
     */
    dwNumberOfCredentials {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

    /**
     * @type {Integer}
     */
    lUserSelected {
        get => NumGet(this, 180, "int")
        set => NumPut("int", value, this, 180)
    }

    /**
     * @type {Integer}
     */
    cbLargeBlobKey {
        get => NumGet(this, 184, "uint")
        set => NumPut("uint", value, this, 184)
    }

    /**
     * @type {Pointer<Integer>}
     */
    pbLargeBlobKey {
        get => NumGet(this, 192, "ptr")
        set => NumPut("ptr", value, this, 192)
    }

    /**
     * @type {Integer}
     */
    cbUnsignedExtensionOutputs {
        get => NumGet(this, 200, "uint")
        set => NumPut("uint", value, this, 200)
    }

    /**
     * @type {Pointer<Integer>}
     */
    pbUnsignedExtensionOutputs {
        get => NumGet(this, 208, "ptr")
        set => NumPut("ptr", value, this, 208)
    }
}

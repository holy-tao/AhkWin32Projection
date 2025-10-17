#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WEBAUTHN_CREDENTIAL.ahk
#Include .\WEBAUTHN_EXTENSIONS.ahk
#Include .\WEBAUTHN_ASSERTION.ahk

/**
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class EXPERIMENTAL_WEBAUTHN_CTAPCBOR_GET_ASSERTION_RESPONSE extends Win32Struct
{
    static sizeof => 184

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
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * @type {Integer}
     */
    dwNumberOfCredentials {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * @type {Integer}
     */
    lUserSelected {
        get => NumGet(this, 148, "int")
        set => NumPut("int", value, this, 148)
    }

    /**
     * @type {Integer}
     */
    cbLargeBlobKey {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbLargeBlobKey {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * @type {Integer}
     */
    cbUnsignedExtensionOutputs {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbUnsignedExtensionOutputs {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }
}

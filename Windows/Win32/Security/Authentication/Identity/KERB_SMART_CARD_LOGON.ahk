#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * Contains information about a smart card logon session.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ns-ntsecapi-kerb_smart_card_logon
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_SMART_CARD_LOGON extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-kerb_logon_submit_type">KERB_LOGON_SUBMIT_TYPE</a> value identifying the type of logon request being made. This member must be set to <b>KerbInteractiveLogon</b>.
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> that specifies the PIN associated with the smart card.
     * @type {LSA_UNICODE_STRING}
     */
    Pin{
        get {
            if(!this.HasProp("__Pin"))
                this.__Pin := LSA_UNICODE_STRING(this.ptr + 8)
            return this.__Pin
        }
    }

    /**
     * The length, in characters, of the <b>CspData</b> member.
     * @type {Integer}
     */
    CspDataLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A pointer to a <b>KERB_SMARTCARD_CSP_INFO</b> structure that contains information about the smart card cryptographic service provider (CSP) or a pointer to a marshaled <b>KERB_CERTIFICATE_INFO</b> structure when updating certificate credentials.
     * @type {Pointer<Byte>}
     */
    CspData {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Information about the Relying Party.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_rp_entity_information
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WEBAUTHN_RP_ENTITY_INFORMATION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Version of this structure, to allow for modifications in the future. This field is required and should be set to **CURRENT_VERSION**.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Identifier for the Relying Party. This field is required.
     * @type {PWSTR}
     */
    pwszId{
        get {
            if(!this.HasProp("__pwszId"))
                this.__pwszId := PWSTR(this.ptr + 8)
            return this.__pwszId
        }
    }

    /**
     * Contains the friendly name of the Relying Party, such as "Acme Corporation", "Widgets Inc", or "Contoso". This field is required.
     * @type {PWSTR}
     */
    pwszName{
        get {
            if(!this.HasProp("__pwszName"))
                this.__pwszName := PWSTR(this.ptr + 16)
            return this.__pwszName
        }
    }

    /**
     * Optional URL pointing to the Relying Party's logo.
     * @type {PWSTR}
     */
    pwszIcon{
        get {
            if(!this.HasProp("__pwszIcon"))
                this.__pwszIcon := PWSTR(this.ptr + 24)
            return this.__pwszIcon
        }
    }
}

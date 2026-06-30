#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Used by the WintrustGetDefaultForUsage function to retrieve callback information for a provider's default usage.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-crypt_provider_defusage
 * @namespace Windows.Win32.Security.WinTrust
 */
class CRYPT_PROVIDER_DEFUSAGE extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * Size, in bytes, of the structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * GUID that specifies the provider's default action.
     * @type {Guid}
     */
    gActionID {
        get {
            if(!this.HasProp("__gActionID"))
                this.__gActionID := Guid(4, this)
            return this.__gActionID
        }
    }

    /**
     * Pointer to a data buffer used to pass policy-specific data to a policy provider.
     * @type {Pointer<Void>}
     */
    pDefPolicyCallbackData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to a data buffer used to pass subject interface package (SIP) specific data to an SIP provider.
     * @type {Pointer<Void>}
     */
    pDefSIPClientData {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}

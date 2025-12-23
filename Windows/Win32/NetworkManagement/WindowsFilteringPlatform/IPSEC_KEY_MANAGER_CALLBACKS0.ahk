#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the set of callbacks which should be invoked by IPsec at various stages of SA negotiation.
 * @remarks
 * If the <b>IPSEC_KEY_MANAGER_FLAG_DICTATE_KEY</b> flag is set, all three callbacks must be specified; otherwise, only the <b>keyNotify</b> callback should be specified.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/ns-fwpmu-ipsec_key_manager_callbacks0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_KEY_MANAGER_CALLBACKS0 extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b>GUID</b>
     * 
     * Reserved for system use.
     * @type {Pointer<Guid>}
     */
    reserved {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * Reserved for system use.
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nc-fwpmu-ipsec_key_manager_key_dictation_check0">IPSEC_KEY_MANAGER_KEY_DICTATION_CHECK0</a></b>
     * 
     * Specifies that the Trusted Intermediary Agent (TIA) will dictate the keys for the SA being negotiated. Only used if the <b>IPSEC_DICTATE_KEY</b> flag is set.
     * @type {Pointer<IPSEC_KEY_MANAGER_KEY_DICTATION_CHECK0>}
     */
    keyDictationCheck {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nc-fwpmu-ipsec_key_manager_dictate_key0">IPSEC_KEY_MANAGER_DICTATE_KEY0</a></b>
     * 
     * Allows the TIA to dictate the keys for the SA being negotiated. Only used if the <b>IPSEC_DICTATE_KEY</b> flag is set.
     * @type {Pointer<IPSEC_KEY_MANAGER_DICTATE_KEY0>}
     */
    keyDictation {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nc-fwpmu-ipsec_key_manager_notify_key0">IPSEC_KEY_MANAGER_NOTIFY_KEY0</a></b>
     * 
     * Notifies the TIA of the keys for the SA being negotiated.
     * @type {Pointer<IPSEC_KEY_MANAGER_NOTIFY_KEY0>}
     */
    keyNotify {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}

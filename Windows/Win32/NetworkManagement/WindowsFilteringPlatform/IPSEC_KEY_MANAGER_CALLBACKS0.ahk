#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Specifies the set of callbacks which should be invoked by IPsec at various stages of SA negotiation.
 * @remarks
 * If the <b>IPSEC_KEY_MANAGER_FLAG_DICTATE_KEY</b> flag is set, all three callbacks must be specified; otherwise, only the <b>keyNotify</b> callback should be specified.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/ns-fwpmu-ipsec_key_manager_callbacks0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_KEY_MANAGER_CALLBACKS0 {
    #StructPack 8

    /**
     * Type: <b>GUID</b>
     * 
     * Reserved for system use.
     */
    reserved : Guid

    /**
     * Type: <b>UINT32</b>
     * 
     * Reserved for system use.
     */
    flags : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nc-fwpmu-ipsec_key_manager_key_dictation_check0">IPSEC_KEY_MANAGER_KEY_DICTATION_CHECK0</a></b>
     * 
     * Specifies that the Trusted Intermediary Agent (TIA) will dictate the keys for the SA being negotiated. Only used if the <b>IPSEC_DICTATE_KEY</b> flag is set.
     */
    keyDictationCheck : IntPtr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nc-fwpmu-ipsec_key_manager_dictate_key0">IPSEC_KEY_MANAGER_DICTATE_KEY0</a></b>
     * 
     * Allows the TIA to dictate the keys for the SA being negotiated. Only used if the <b>IPSEC_DICTATE_KEY</b> flag is set.
     */
    keyDictation : IntPtr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nc-fwpmu-ipsec_key_manager_notify_key0">IPSEC_KEY_MANAGER_NOTIFY_KEY0</a></b>
     * 
     * Notifies the TIA of the keys for the SA being negotiated.
     */
    keyNotify : IntPtr

}

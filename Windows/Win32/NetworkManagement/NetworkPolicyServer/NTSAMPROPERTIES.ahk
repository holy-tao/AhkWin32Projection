#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The values of the NTSAMPROPERTIES enumeration type specify properties related to the NT Security Accounts Manager (SAM).
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-ntsamproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
export default struct NTSAMPROPERTIES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies whether to allow NT LAN Manager (NTLM) authentication.
     * @type {Integer (Int32)}
     */
    static PROPERTY_NTSAM_ALLOW_LM_AUTHENTICATION => 1026
}

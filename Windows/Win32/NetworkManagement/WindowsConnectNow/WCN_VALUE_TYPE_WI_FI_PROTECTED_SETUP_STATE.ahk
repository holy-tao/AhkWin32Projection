#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * WCN_VALUE_TYPE_WI_FI_PROTECTED_SETUP_STATE enumeration.
 * @remarks
 * A device is considered 'not configured' if it is using factory default wireless settings. If the wireless settings have been customized by the user, the device is considered to be 'configured'. A factory reset will restore the device to a 'not configured' state.
 * @see https://learn.microsoft.com/windows/win32/api/wcntypes/ne-wcntypes-wcn_value_type_wi_fi_protected_setup_state
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 */
export default struct WCN_VALUE_TYPE_WI_FI_PROTECTED_SETUP_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_SS_RESERVED00 => 0

    /**
     * The device is not configured.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_SS_NOT_CONFIGURED => 1

    /**
     * The device is configured.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_SS_CONFIGURED => 2
}

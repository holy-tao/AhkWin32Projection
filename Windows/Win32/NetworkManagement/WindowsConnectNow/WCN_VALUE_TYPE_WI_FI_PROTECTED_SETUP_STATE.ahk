#Requires AutoHotkey v2.0.0 64-bit

/**
 * WCN_VALUE_TYPE_WI_FI_PROTECTED_SETUP_STATE enumeration.
 * @remarks
 * 
 * A device is considered 'not configured' if it is using factory default wireless settings. If the wireless settings have been customized by the user, the device is considered to be 'configured'. A factory reset will restore the device to a 'not configured' state.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wcntypes/ne-wcntypes-wcn_value_type_wi_fi_protected_setup_state
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 * @version v4.0.30319
 */
class WCN_VALUE_TYPE_WI_FI_PROTECTED_SETUP_STATE{

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

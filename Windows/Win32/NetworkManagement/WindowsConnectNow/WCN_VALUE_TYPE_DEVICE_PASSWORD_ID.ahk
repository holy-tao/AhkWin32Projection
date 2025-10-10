#Requires AutoHotkey v2.0.0 64-bit

/**
 * WCN_VALUE_TYPE_DEVICE_PASSWORD_ID enumeration defines values that specify the origin or 'type' of a password.
 * @see https://docs.microsoft.com/windows/win32/api//wcntypes/ne-wcntypes-wcn_value_type_device_password_id
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 * @version v4.0.30319
 */
class WCN_VALUE_TYPE_DEVICE_PASSWORD_ID{

    /**
     * The PIN password, obtained from the label, or
 * display will be used. This password may correspond to the label, display, or a user-defined password that has been
 * configured to replace the original device password.
 * 
 * 
 * To authenticate with the default password ID, call <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-setpassword">IWCNDevice::SetPassword</a> with the PIN password type defined by <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/ne-wcndevice-wcn_password_type">WCN_PASSWORD_TYPE</a>.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_DP_DEFAULT => 0

    /**
     * The user has overridden the default password with a manually selected value.
 * 
 * 
 * <div class="alert"><b>Note</b>  Not supported in Windows 7.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_DP_USER_SPECIFIED => 1

    /**
     * The default PIN password has been overridden by a strong, machine-generated
 * device password value. 
 * 
 * <div class="alert"><b>Note</b>  Not supported in Windows 7.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_DP_MACHINE_SPECIFIED => 2

    /**
     * The 256-bit rekeying password
 * associated with the device will be used.
 * 
 * <div class="alert"><b>Note</b>  Not supported in Windows 7.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_DP_REKEY => 3

    /**
     * A password entered via a push button interface will be used. 
 * 
 * To authenticate with the default password ID, call <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-setpassword">IWCNDevice::SetPassword</a> with the push button password type defined by <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/ne-wcndevice-wcn_password_type">WCN_PASSWORD_TYPE</a>.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_DP_PUSHBUTTON => 4

    /**
     * A PIN has been obtained from the Registrar via a display or
 * other out-of-band method. 
 * 
 * <div class="alert"><b>Note</b>  Not supported in Windows 7.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_DP_REGISTRAR_SPECIFIED => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_DP_NFC_CONNECTION_HANDOVER => 7

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_DP_WFD_SERVICES => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_DP_OUTOFBAND_MIN => 16

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_DP_OUTOFBAND_MAX => 65535
}

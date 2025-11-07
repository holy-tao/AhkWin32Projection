#Requires AutoHotkey v2.0.0 64-bit

/**
 * WCN_PASSWORD_TYPE enumeration defines the authentication that will be used in a WPS session.
 * @see https://docs.microsoft.com/windows/win32/api//wcndevice/ne-wcndevice-wcn_password_type
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 * @version v4.0.30319
 */
class WCN_PASSWORD_TYPE{

    /**
     * Indicates the device uses a WPS button interface to put the device into wireless provisioning mode. If this value is specified when calling <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-setpassword">IWCNDevice::SetPassword</a>, set <i>dwPasswordLength</i> to zero and <i>pbPassword</i> to <b>NULL</b>.
     * @type {Integer (Int32)}
     */
    static WCN_PASSWORD_TYPE_PUSH_BUTTON => 0

    /**
     * Indicates that authentication is secured via a PIN. The user must provide the PIN of the device. Usually, the PIN is a 4 or 8-digit number printed on a label attached to the device, or displayed on the screen. If this value is specified when calling <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-setpassword">IWCNDevice::SetPassword</a>, set <i>dwPasswordLength</i> to the number of digits in the password, and <i>pbPassword</i> to point to a buffer containing the ASCII representation of the pin.
     * @type {Integer (Int32)}
     */
    static WCN_PASSWORD_TYPE_PIN => 1

    /**
     * Indicates that authentication is secured via a PIN, as above, but that the PIN is specified by the registrar.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_PASSWORD_TYPE_PIN_REGISTRAR_SPECIFIED => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WCN_PASSWORD_TYPE_OOB_SPECIFIED => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WCN_PASSWORD_TYPE_WFDS => 4
}

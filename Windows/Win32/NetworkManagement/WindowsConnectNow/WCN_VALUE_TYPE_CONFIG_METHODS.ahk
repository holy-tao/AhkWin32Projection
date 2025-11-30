#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * WCN_VALUE_TYPE_CONFIG_METHODS enumeration defines the configuration methods supported by the Enrollee or Registrar.
 * @see https://docs.microsoft.com/windows/win32/api//wcntypes/ne-wcntypes-wcn_value_type_config_methods
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 * @version v4.0.30319
 */
class WCN_VALUE_TYPE_CONFIG_METHODS extends Win32Enum{

    /**
     * USB-A (flash drive) configuration is supported.
     * 
     * <div class="alert"><b>Note</b>  Not supported in Windows 7 and later. Not supported in WPS 2.0.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CM_USBA => 1

    /**
     * Ethernet configuration is supported.
     * 
     * <div class="alert"><b>Note</b>  Not supported in Windows 7 and later. Not supported in WPS 2.0.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CM_ETHERNET => 2

    /**
     * Label configuration is supported. To authenticate with the default password ID, call <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-setpassword">IWCNDevice::SetPassword</a> with the PIN password type defined by <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/ne-wcndevice-wcn_password_type">WCN_PASSWORD_TYPE</a>.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CM_LABEL => 4

    /**
     * Display configuration is supported. To authenticate with the default password ID, call <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-setpassword">IWCNDevice::SetPassword</a> with the PIN password type defined by <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/ne-wcndevice-wcn_password_type">WCN_PASSWORD_TYPE</a>.
     * 
     * <div class="alert"><b>Note</b>  For WPS 2.0, use <b>WCN_VALUE_CM_VIRT_DISPLAY</b> or <b>WCN_VALUE_CM_PHYS_DISPLAY</b>.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CM_DISPLAY => 8

    /**
     * External near-field communication (NFC) token configuration is supported.
     * 
     * <div class="alert"><b>Note</b>  Not supported in Windows 7.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CM_EXTERNAL_NFC => 16

    /**
     * Integrated NFC token configuration is supported.
     * 
     * <div class="alert"><b>Note</b>  Not supported in Windows 7.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CM_INTEGRATED_NFC => 32

    /**
     * NFC interface configuration is supported.
     * 
     * <div class="alert"><b>Note</b>  Not supported in Windows 7.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CM_NFC_INTERFACE => 64

    /**
     * Push button configuration is supported. To authenticate with the default password ID, call <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-setpassword">IWCNDevice::SetPassword</a> with the push button password type defined by <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/ne-wcndevice-wcn_password_type">WCN_PASSWORD_TYPE</a>.
     * 
     * <div class="alert"><b>Note</b>  For WPS 2.0, use <b>WCN_VALUE_CM_VIRT_PUSHBUTTON</b> or <b>WCN_VALUE_CM_PHYS_PUSHBUTTON</b>.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CM_PUSHBUTTON => 128

    /**
     * Keypad configuration is supported.
     * 
     * <div class="alert"><b>Note</b>  Not supported in Windows 7.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CM_KEYPAD => 256

    /**
     * Virtual push button configuration is supported.  To authenticate with the default password ID, call <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-setpassword">IWCNDevice::SetPassword</a> with the push button password type defined by <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/ne-wcndevice-wcn_password_type">WCN_PASSWORD_TYPE</a>.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CM_VIRT_PUSHBUTTON => 640

    /**
     * Physical push button configuration is supported.  To authenticate with the default password ID, call <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-setpassword">IWCNDevice::SetPassword</a> with the push button password type defined by <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/ne-wcndevice-wcn_password_type">WCN_PASSWORD_TYPE</a>.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CM_PHYS_PUSHBUTTON => 1152

    /**
     * Virtual display configuration is supported. To authenticate with the default password ID, call <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-setpassword">IWCNDevice::SetPassword</a> with the PIN password type defined by <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/ne-wcndevice-wcn_password_type">WCN_PASSWORD_TYPE</a>.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CM_VIRT_DISPLAY => 8200

    /**
     * Physical display configuration is supported. To authenticate with the default password ID, call <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-setpassword">IWCNDevice::SetPassword</a> with the PIN password type defined by <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/ne-wcndevice-wcn_password_type">WCN_PASSWORD_TYPE</a>.
     * 
     * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CM_PHYS_DISPLAY => 16392
}

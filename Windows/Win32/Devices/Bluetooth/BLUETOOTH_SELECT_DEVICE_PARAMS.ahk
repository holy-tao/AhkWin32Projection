#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Facilitates and manages the visibility, authentication, and selection of Bluetooth devices and services.
 * @remarks
 * To free the array of 
  * <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structures passed in the <b>pDevices</b> member, call the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothselectdevicesfree">BluetoothSelectDevicesFree</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_select_device_params
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BLUETOOTH_SELECT_DEVICE_PARAMS extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Size, in bytes, of the 
     * <b>BLUETOOTH_SELECT_DEVICE_PARAMS</b> structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of classes in <b>prgClassOfDevices</b>. Set to zero to search for all devices.
     * @type {Integer}
     */
    cNumOfClasses {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Array of class of devices to find.
     * @type {Pointer<BLUETOOTH_COD_PAIRS>}
     */
    prgClassOfDevices {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Sets the information text when not <b>NULL</b>.
     * @type {Pointer<PWSTR>}
     */
    pszInfo {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Handle to the parent window. Set to <b>NULL</b> for no parent.
     * @type {Pointer<HWND>}
     */
    hwndParent {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * If <b>TRUE</b>, forces authentication before returning.
     * @type {Integer}
     */
    fForceAuthentication {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * If <b>TRUE</b>, authenticated devices are shown in the picker.
     * @type {Integer}
     */
    fShowAuthenticated {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * If <b>TRUE</b>, remembered devices are shown in the picker.
     * @type {Integer}
     */
    fShowRemembered {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * If <b>TRUE</b>, unknown devices that are not authenticated or remembered are shown in the picker.
     * @type {Integer}
     */
    fShowUnknown {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * If <b>TRUE</b>, starts the Add New Device wizard.
     * @type {Integer}
     */
    fAddNewDeviceWizard {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * If <b>TRUE</b>, skips the Services page in the Add New Device wizard.
     * @type {Integer}
     */
    fSkipServicesPage {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * A pointer to a callback function that is called for each device. If the callback function returns <b>TRUE</b>, the item is added. If the callback function returns <b>FALSE</b>, the item is not shown. Set <b>pfnDeviceCallback</b> to null for no callback. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nc-bluetoothapis-pfn_device_callback">PFN_DEVICE_CALLBACK</a>.
     * @type {Pointer<PFN_DEVICE_CALLBACK>}
     */
    pfnDeviceCallback {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Parameter to be passed as <b>pvParam</b> to the callback function pointed to in <b>pfnDeviceCallback</b>.
     * @type {Pointer<Void>}
     */
    pvParam {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * On input, specifies the number of desired calls. Set to zero for no limit. On output, returns the number of devices returned.
     * @type {Integer}
     */
    cNumDevices {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structures.
     * @type {Pointer<BLUETOOTH_DEVICE_INFO>}
     */
    pDevices {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}

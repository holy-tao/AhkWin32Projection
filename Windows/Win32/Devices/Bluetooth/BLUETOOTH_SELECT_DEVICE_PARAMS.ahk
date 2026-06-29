#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\BLUETOOTH_DEVICE_INFO.ahk" { BLUETOOTH_DEVICE_INFO }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\BLUETOOTH_COD_PAIRS.ahk" { BLUETOOTH_COD_PAIRS }

/**
 * Facilitates and manages the visibility, authentication, and selection of Bluetooth devices and services.
 * @remarks
 * To free the array of 
 * <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structures passed in the <b>pDevices</b> member, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothselectdevicesfree">BluetoothSelectDevicesFree</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_select_device_params
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BLUETOOTH_SELECT_DEVICE_PARAMS {
    #StructPack 8

    /**
     * Size, in bytes, of the 
     * <b>BLUETOOTH_SELECT_DEVICE_PARAMS</b> structure.
     */
    dwSize : UInt32

    /**
     * Number of classes in <b>prgClassOfDevices</b>. Set to zero to search for all devices.
     */
    cNumOfClasses : UInt32

    /**
     * Array of class of devices to find.
     */
    prgClassOfDevices : BLUETOOTH_COD_PAIRS.Ptr

    /**
     * Sets the information text when not <b>NULL</b>.
     */
    pszInfo : PWSTR

    /**
     * Handle to the parent window. Set to <b>NULL</b> for no parent.
     */
    hwndParent : HWND

    /**
     * If <b>TRUE</b>, forces authentication before returning.
     */
    fForceAuthentication : BOOL

    /**
     * If <b>TRUE</b>, authenticated devices are shown in the picker.
     */
    fShowAuthenticated : BOOL

    /**
     * If <b>TRUE</b>, remembered devices are shown in the picker.
     */
    fShowRemembered : BOOL

    /**
     * If <b>TRUE</b>, unknown devices that are not authenticated or remembered are shown in the picker.
     */
    fShowUnknown : BOOL

    /**
     * If <b>TRUE</b>, starts the Add New Device wizard.
     */
    fAddNewDeviceWizard : BOOL

    /**
     * If <b>TRUE</b>, skips the Services page in the Add New Device wizard.
     */
    fSkipServicesPage : BOOL

    /**
     * A pointer to a callback function that is called for each device. If the callback function returns <b>TRUE</b>, the item is added. If the callback function returns <b>FALSE</b>, the item is not shown. Set <b>pfnDeviceCallback</b> to null for no callback. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nc-bluetoothapis-pfn_device_callback">PFN_DEVICE_CALLBACK</a>.
     */
    pfnDeviceCallback : IntPtr

    /**
     * Parameter to be passed as <b>pvParam</b> to the callback function pointed to in <b>pfnDeviceCallback</b>.
     */
    pvParam : IntPtr

    /**
     * On input, specifies the number of desired calls. Set to zero for no limit. On output, returns the number of devices returned.
     */
    cNumDevices : UInt32

    /**
     * Pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structures.
     */
    pDevices : BLUETOOTH_DEVICE_INFO.Ptr

}

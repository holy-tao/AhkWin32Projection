#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\BLUETOOTH_DEVICE_INFO.ahk" { BLUETOOTH_DEVICE_INFO }

/**
 * A callback prototype used in association with selecting Bluetooth devices.
 * @remarks
 * The 
 * <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure pointed to in <i>pDevice</i> is the device that the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothselectdevices">BluetoothSelectDevices</a> function is querying to determine if that device should be added to the list view.
 * 
 * If the callback performs SDP queries for each device, the list of devices from which the user can choose will be delayed until all devices can be queried. A recommended approach is to use the service to call bitfield in the class of device, available through <b>GET_COD_SERVICE</b>, to determine whether the device should be displayed to the user. The service class bitfield is available in the <b>pDevice</b> parameter through the <b>ulClassOfDevice</b> member.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nc-bluetoothapis-pfn_device_callback
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct PFN_DEVICE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DEVICE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pvParam A parameter passed in from  the <b>pvParam</b> member of the 
     * <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_select_device_params">BLUETOOTH_SELECT_DEVICE_PARAMS</a> structure through the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothselectdevices">BluetoothSelectDevices</a> function.
     * @param {Pointer<BLUETOOTH_DEVICE_INFO>} pDevice Remote Bluetooth address queried; this is the address inserted into the user-presented list of Bluetooth devices.
     * @returns {BOOL} Returning <b>FALSE</b> prevents the device from being added to the list view of Bluetooth devices.
     */
    Call(pvParam, pDevice) {
        pvParamMarshal := pvParam is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pvParamMarshal, pvParam, BLUETOOTH_DEVICE_INFO.Ptr, pDevice, BOOL)
        return result
    }

    /**
     * A PFN_DEVICE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DEVICE_CALLBACK {
        /**
         * Creates a PFN_DEVICE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", BLUETOOTH_DEVICE_INFO) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", BLUETOOTH_DEVICE_INFO.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

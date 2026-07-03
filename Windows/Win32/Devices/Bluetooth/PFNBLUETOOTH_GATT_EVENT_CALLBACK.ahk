#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BTH_LE_GATT_EVENT_TYPE.ahk" { BTH_LE_GATT_EVENT_TYPE }

/**
 * Profile drivers implement a Bluetooth GATT event callback to be called whenever the value of a specific characteristic changes.
 * @see https://learn.microsoft.com/windows/win32/api/bthledef/nc-bthledef-pfnbluetooth_gatt_event_callback
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct PFNBLUETOOTH_GATT_EVENT_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFNBLUETOOTH_GATT_EVENT_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {BTH_LE_GATT_EVENT_TYPE} EventType The type of GATT event.
     * @param {Pointer<Void>} EventOutParameter Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/bthledef/ns-bthledef-bluetooth_gatt_value_changed_event">BLUETOOTH_GATT_VALUE_CHANGED_EVENT</a> structure.
     * @param {Pointer<Void>} _Context The context specified by the profile driver in the <i>CallbackContext</i> parameter of 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattregisterevent">BluetoothGATTRegisterEvent</a> function 
     *       when the profile driver registered the GATT callback function.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(EventType, EventOutParameter, _Context) {
        EventOutParameterMarshal := EventOutParameter is VarRef ? "ptr" : "ptr"
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, BTH_LE_GATT_EVENT_TYPE, EventType, EventOutParameterMarshal, EventOutParameter, _ContextMarshal, _Context)
    }

    /**
     * A PFNBLUETOOTH_GATT_EVENT_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNBLUETOOTH_GATT_EVENT_CALLBACK {
        /**
         * Creates a PFNBLUETOOTH_GATT_EVENT_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(BTH_LE_GATT_EVENT_TYPE, "ptr", "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BTH_LE_GATT_EVENT_TYPE, "ptr", "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}

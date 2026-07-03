#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BLUETOOTH_DEVICE_INFO.ahk" { BLUETOOTH_DEVICE_INFO }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Used in conjunction with the BluetoothRegisterForAuthentication function.
 * @remarks
 * A caller can register for multiple addresses with the same callback function.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nc-bluetoothapis-pfn_authentication_callback
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct PFN_AUTHENTICATION_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFN_AUTHENTICATION_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pvParam Optional. A context pointer previously passed into the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothregisterforauthentication">BluetoothRegisterForAuthentication</a> function.
     * @param {Pointer<BLUETOOTH_DEVICE_INFO>} pDevice A remote Bluetooth device requesting authentication. The remote address is the same address used to register the callback during the previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothregisterforauthentication">BluetoothRegisterForAuthentication</a> function.
     * @returns {BOOL} The return value from this function is ignored by the system.
     */
    Call(pvParam, pDevice) {
        pvParamMarshal := pvParam is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pvParamMarshal, pvParam, BLUETOOTH_DEVICE_INFO.Ptr, pDevice, BOOL)
        return result
    }

    /**
     * A PFN_AUTHENTICATION_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_AUTHENTICATION_CALLBACK {
        /**
         * Creates a PFN_AUTHENTICATION_CALLBACK pointer that invokes the given AHK function when called.
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

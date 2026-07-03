#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BLUETOOTH_AUTHENTICATION_CALLBACK_PARAMS.ahk" { BLUETOOTH_AUTHENTICATION_CALLBACK_PARAMS }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * PFN_AUTHENTICATION_CALLBACK_EX function is a callback function prototype used in conjunction with the BluetoothRegisterForAuthenticationEx function.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nc-bluetoothapis-pfn_authentication_callback_ex
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct PFN_AUTHENTICATION_CALLBACK_EX {
    value : IntPtr

    __value {
        set {
            if (value is PFN_AUTHENTICATION_CALLBACK_EX) {
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
     * @param {Pointer<BLUETOOTH_AUTHENTICATION_CALLBACK_PARAMS>} pAuthCallbackParams A <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_authentication_callback_params">BLUETOOTH_AUTHENTICATION_CALLBACK_PARAMS</a> structure that contains device and authentication configuration information specific to the Bluetooth device responding to an authentication request.
     * @returns {BOOL} The return value from this function is ignored by the system.
     */
    Call(pvParam, pAuthCallbackParams) {
        pvParamMarshal := pvParam is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pvParamMarshal, pvParam, BLUETOOTH_AUTHENTICATION_CALLBACK_PARAMS.Ptr, pAuthCallbackParams, BOOL)
        return result
    }

    /**
     * A PFN_AUTHENTICATION_CALLBACK_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_AUTHENTICATION_CALLBACK_EX {
        /**
         * Creates a PFN_AUTHENTICATION_CALLBACK_EX pointer that invokes the given AHK function when called.
         * @param {Func("ptr", BLUETOOTH_AUTHENTICATION_CALLBACK_PARAMS) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", BLUETOOTH_AUTHENTICATION_CALLBACK_PARAMS.Ptr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}

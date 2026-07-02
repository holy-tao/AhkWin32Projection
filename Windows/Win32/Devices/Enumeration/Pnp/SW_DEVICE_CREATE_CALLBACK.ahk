#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HSWDEVICE.ahk" { HSWDEVICE }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Provides a device with backing in the registry and allows the caller to then make calls to Software Device API functions with the hSwDevice handle.
 * @remarks
 * The operating system calls the <b>SW_DEVICE_CREATE_CALLBACK</b> callback function after PnP enumerates the device.  After the callback function is called, the device has backing in the registry and calls to Software Device API functions can be made by using the <i>hSwDevice</i> handle.  You can also use other APIs that work with devices for the device that is created.  
 * 
 * PnP enumeration of a device is the first step that a device undergoes.  After PnP enumeration of the device, the device only has registry backing, and you can set properties against the device. Just because PnP enumerated the device, the device hasn't started yet, and no driver for the device has registered or enabled interfaces yet.  In many cases, we recommend that apps wait for device-interface arrival if they want to use the device.
 * 
 * 
 * <div class="alert"><b>Note</b>  The callback function supplies the device instance ID for the created device. We recommend that callers of the Software Device API not try to guess at or construct the device instance ID themselves; always use the value provided by the callback function.</div>
 * <div> </div>
 * The callback function will execute on an arbitrary thread-pool thread.  Client apps can perform as much work as needed in the callback function.
 * 
 * In Windows 8, you can't call <a href="https://docs.microsoft.com/windows/desktop/api/swdevice/nf-swdevice-swdeviceclose">SwDeviceClose</a> inside the callback function.  Doing so will cause a deadlock.  Be careful of releasing a ref counted object that will call <b>SwDeviceClose</b> when its destructor runs.  In Windows 8.1, this restriction is lifted, and you can call <b>SwDeviceClose</b> inside the callback function.
 * 
 * Always check the HRESULT that is passed to <i>CreateResult</i> to make sure PnP was able to enumerate the device.
 * @see https://learn.microsoft.com/windows/win32/api/swdevice/nc-swdevice-sw_device_create_callback
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 */
export default struct SW_DEVICE_CREATE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is SW_DEVICE_CREATE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HSWDEVICE} _hSwDevice The handle for the software device.
     * @param {HRESULT} CreateResult An HRESULT that indicates if the enumeration of the software device was successful.
     * @param {Pointer<Void>} pContext The context that was optionally supplied by the client app to <a href="https://docs.microsoft.com/windows/desktop/api/swdevice/nf-swdevice-swdevicecreate">SwDeviceCreate</a>.
     * @param {PWSTR} pszDeviceInstanceId The device instance ID that PnP assigned to the device.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_hSwDevice, CreateResult, pContext, pszDeviceInstanceId) {
        pszDeviceInstanceId := pszDeviceInstanceId is String ? StrPtr(pszDeviceInstanceId) : pszDeviceInstanceId

        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, HSWDEVICE, _hSwDevice, "int", CreateResult, pContextMarshal, pContext, "ptr", pszDeviceInstanceId)
    }

    /**
     * A SW_DEVICE_CREATE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SW_DEVICE_CREATE_CALLBACK {
        /**
         * Creates a SW_DEVICE_CREATE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(HSWDEVICE, "int", "ptr", PWSTR) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HSWDEVICE, "int", "ptr", PWSTR, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

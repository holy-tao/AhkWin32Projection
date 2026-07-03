#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Destroys an instance of a software plug-in Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nc-dxvahd-pdxvahdsw_destroydevice
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct PDXVAHDSW_DestroyDevice {
    value : IntPtr

    __value {
        set {
            if (value is PDXVAHDSW_DestroyDevice) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hDevice A handle to the plug-in DXVA-HD device.
     * @returns {HRESULT} If this callback function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     */
    Call(hDevice) {
        result := DllCall(this.value, HANDLE, hDevice, "HRESULT")
        return result
    }

    /**
     * A PDXVAHDSW_DestroyDevice that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDXVAHDSW_DestroyDevice {
        /**
         * Creates a PDXVAHDSW_DestroyDevice pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

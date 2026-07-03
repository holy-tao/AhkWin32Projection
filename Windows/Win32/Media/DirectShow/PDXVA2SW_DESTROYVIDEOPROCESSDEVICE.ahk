#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct PDXVA2SW_DESTROYVIDEOPROCESSDEVICE {
    value : IntPtr

    __value {
        set {
            if (value is PDXVA2SW_DESTROYVIDEOPROCESSDEVICE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hDevice 
     * @returns {HRESULT} 
     */
    Call(hDevice) {
        result := DllCall(this.value, HANDLE, hDevice, "HRESULT")
        return result
    }

    /**
     * A PDXVA2SW_DESTROYVIDEOPROCESSDEVICE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDXVA2SW_DESTROYVIDEOPROCESSDEVICE {
        /**
         * Creates a PDXVA2SW_DESTROYVIDEOPROCESSDEVICE pointer that invokes the given AHK function when called.
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

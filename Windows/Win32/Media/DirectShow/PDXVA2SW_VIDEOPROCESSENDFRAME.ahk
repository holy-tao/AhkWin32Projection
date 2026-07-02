#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct PDXVA2SW_VIDEOPROCESSENDFRAME {
    value : IntPtr

    __value {
        set {
            if (value is PDXVA2SW_VIDEOPROCESSENDFRAME) {
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
     * @param {Pointer<HANDLE>} pHandleComplete 
     * @returns {HRESULT} 
     */
    Call(hDevice, pHandleComplete) {
        result := DllCall(this.value, HANDLE, hDevice, HANDLE.Ptr, pHandleComplete, "HRESULT")
        return result
    }

    /**
     * A PDXVA2SW_VIDEOPROCESSENDFRAME that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDXVA2SW_VIDEOPROCESSENDFRAME {
        /**
         * Creates a PDXVA2SW_VIDEOPROCESSENDFRAME pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, HANDLE) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, HANDLE.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DXVA2_VIDEOPROCESSBLT.ahk" { DXVA2_VIDEOPROCESSBLT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct PDXVA2SW_VIDEOPROCESSBLT {
    value : IntPtr

    __value {
        set {
            if (value is PDXVA2SW_VIDEOPROCESSBLT) {
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
     * @param {Pointer<DXVA2_VIDEOPROCESSBLT>} pBlt 
     * @returns {HRESULT} 
     */
    Call(hDevice, pBlt) {
        result := DllCall(this.value, HANDLE, hDevice, DXVA2_VIDEOPROCESSBLT.Ptr, pBlt, "HRESULT")
        return result
    }

    /**
     * A PDXVA2SW_VIDEOPROCESSBLT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDXVA2SW_VIDEOPROCESSBLT {
        /**
         * Creates a PDXVA2SW_VIDEOPROCESSBLT pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, DXVA2_VIDEOPROCESSBLT) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, DXVA2_VIDEOPROCESSBLT.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

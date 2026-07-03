#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Destroys a software Microsoft DirectX Video Acceleration High Definition (DXVA-HD) video processor.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/nc-dxvahd-pdxvahdsw_destroyvideoprocessor
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct PDXVAHDSW_DestroyVideoProcessor {
    value : IntPtr

    __value {
        set {
            if (value is PDXVAHDSW_DestroyVideoProcessor) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hVideoProcessor A handle to the software DXVA-HD video processor.
     * @returns {HRESULT} If this callback function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     */
    Call(hVideoProcessor) {
        result := DllCall(this.value, HANDLE, hVideoProcessor, "HRESULT")
        return result
    }

    /**
     * A PDXVAHDSW_DestroyVideoProcessor that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDXVAHDSW_DestroyVideoProcessor {
        /**
         * Creates a PDXVAHDSW_DestroyVideoProcessor pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}

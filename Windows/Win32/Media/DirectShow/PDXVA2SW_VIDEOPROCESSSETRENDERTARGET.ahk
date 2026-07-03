#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\Direct3D9\IDirect3DSurface9.ahk" { IDirect3DSurface9 }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct PDXVA2SW_VIDEOPROCESSSETRENDERTARGET {
    value : IntPtr

    __value {
        set {
            if (value is PDXVA2SW_VIDEOPROCESSSETRENDERTARGET) {
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
     * @param {IDirect3DSurface9} pRenderTarget 
     * @returns {HRESULT} 
     */
    Call(hDevice, pRenderTarget) {
        result := DllCall(this.value, HANDLE, hDevice, "ptr", pRenderTarget, "HRESULT")
        return result
    }

    /**
     * A PDXVA2SW_VIDEOPROCESSSETRENDERTARGET that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDXVA2SW_VIDEOPROCESSSETRENDERTARGET {
        /**
         * Creates a PDXVA2SW_VIDEOPROCESSSETRENDERTARGET pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, "ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "ptr", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

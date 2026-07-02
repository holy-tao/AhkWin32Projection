#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\DirectDraw\DDSURFACEDESC.ahk" { DDSURFACEDESC }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct LPD3DENUMTEXTUREFORMATSCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is LPD3DENUMTEXTUREFORMATSCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDSURFACEDESC>} lpDdsd 
     * @param {Pointer<Void>} lpContext 
     * @returns {HRESULT} 
     */
    Call(lpDdsd, lpContext) {
        lpContextMarshal := lpContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DDSURFACEDESC.Ptr, lpDdsd, lpContextMarshal, lpContext, "HRESULT")
        return result
    }

    /**
     * A LPD3DENUMTEXTUREFORMATSCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPD3DENUMTEXTUREFORMATSCALLBACK {
        /**
         * Creates a LPD3DENUMTEXTUREFORMATSCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(DDSURFACEDESC, "ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDSURFACEDESC.Ptr, "ptr", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\DirectDraw\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct LPD3DENUMPIXELFORMATSCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is LPD3DENUMPIXELFORMATSCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDPIXELFORMAT>} lpDDPixFmt 
     * @param {Pointer<Void>} lpContext 
     * @returns {HRESULT} 
     */
    Call(lpDDPixFmt, lpContext) {
        lpContextMarshal := lpContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DDPIXELFORMAT.Ptr, lpDDPixFmt, lpContextMarshal, lpContext, "HRESULT")
        return result
    }

    /**
     * A LPD3DENUMPIXELFORMATSCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPD3DENUMPIXELFORMATSCALLBACK {
        /**
         * Creates a LPD3DENUMPIXELFORMATSCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(DDPIXELFORMAT, "ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDPIXELFORMAT.Ptr, "ptr", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

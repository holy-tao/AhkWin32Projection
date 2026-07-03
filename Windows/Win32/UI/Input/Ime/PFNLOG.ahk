#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMEDP.ahk" { IMEDP }

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct PFNLOG {
    value : IntPtr

    __value {
        set {
            if (value is PFNLOG) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<IMEDP>} param0 
     * @param {HRESULT} param1 
     * @returns {BOOL} 
     */
    Call(param0, param1) {
        result := DllCall(this.value, IMEDP.Ptr, param0, "int", param1, BOOL)
        return result
    }

    /**
     * A PFNLOG that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNLOG {
        /**
         * Creates a PFNLOG pointer that invokes the given AHK function when called.
         * @param {Func(IMEDP, "int") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IMEDP.Ptr, "int", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct PShutdownTextServices {
    value : IntPtr

    __value {
        set {
            if (value is PShutdownTextServices) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IUnknown} pTextServices 
     * @returns {HRESULT} 
     */
    Call(pTextServices) {
        result := DllCall(this.value, "ptr", pTextServices, "HRESULT")
        return result
    }

    /**
     * A PShutdownTextServices that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PShutdownTextServices {
        /**
         * Creates a PShutdownTextServices pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

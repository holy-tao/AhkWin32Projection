#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\PROPSHEETUI_INFO.ahk" { PROPSHEETUI_INFO }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PFNPROPSHEETUI {
    value : IntPtr

    __value {
        set {
            if (value is PFNPROPSHEETUI) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<PROPSHEETUI_INFO>} pPSUIInfo 
     * @param {LPARAM} _lParam 
     * @returns {Integer} 
     */
    Call(pPSUIInfo, _lParam) {
        result := DllCall(this.value, PROPSHEETUI_INFO.Ptr, pPSUIInfo, LPARAM, _lParam, Int32)
        return result
    }

    /**
     * A PFNPROPSHEETUI that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNPROPSHEETUI {
        /**
         * Creates a PFNPROPSHEETUI pointer that invokes the given AHK function when called.
         * @param {Func(PROPSHEETUI_INFO, LPARAM) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PROPSHEETUI_INFO.Ptr, LPARAM, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

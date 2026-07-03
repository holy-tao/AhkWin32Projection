#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\HPROPSHEETPAGE.ahk" { HPROPSHEETPAGE }

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct LPFNSVADDPROPSHEETPAGE {
    value : IntPtr

    __value {
        set {
            if (value is LPFNSVADDPROPSHEETPAGE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HPROPSHEETPAGE} param0 
     * @param {LPARAM} param1 
     * @returns {BOOL} 
     */
    Call(param0, param1) {
        result := DllCall(this.value, HPROPSHEETPAGE, param0, LPARAM, param1, BOOL)
        return result
    }

    /**
     * A LPFNSVADDPROPSHEETPAGE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFNSVADDPROPSHEETPAGE {
        /**
         * Creates a LPFNSVADDPROPSHEETPAGE pointer that invokes the given AHK function when called.
         * @param {Func(HPROPSHEETPAGE, LPARAM) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HPROPSHEETPAGE, LPARAM, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

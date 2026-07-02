#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LPFNSVADDPROPSHEETPAGE.ahk" { LPFNSVADDPROPSHEETPAGE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct LPFNADDPROPSHEETPAGES {
    value : IntPtr

    __value {
        set {
            if (value is LPFNADDPROPSHEETPAGES) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {Pointer<LPFNSVADDPROPSHEETPAGE>} param1 
     * @param {LPARAM} param2 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, param0Marshal, param0, LPFNSVADDPROPSHEETPAGE, param1, LPARAM, param2, BOOL)
        return result
    }

    /**
     * A LPFNADDPROPSHEETPAGES that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFNADDPROPSHEETPAGES {
        /**
         * Creates a LPFNADDPROPSHEETPAGES pointer that invokes the given AHK function when called.
         * @param {Func("ptr", LPFNSVADDPROPSHEETPAGE, LPARAM) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", LPFNSVADDPROPSHEETPAGE, LPARAM, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

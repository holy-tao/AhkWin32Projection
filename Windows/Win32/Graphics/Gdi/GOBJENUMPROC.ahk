#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }

/**
 * The EnumObjectsProc function is an application-defined callback function used with the EnumObjects function.
 * @remarks
 * An application must register this function by passing its address to the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-enumobjects">EnumObjects</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/nc-wingdi-gobjenumproc
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct GOBJENUMPROC {
    value : IntPtr

    __value {
        set {
            if (value is GOBJENUMPROC) {
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
     * @param {LPARAM} param1 
     * @returns {Integer} To continue enumeration, the callback function must return a nonzero value. This value is user-defined.
     * 
     * To stop enumeration, the callback function must return zero.
     */
    Call(param0, param1) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, param0Marshal, param0, LPARAM, param1, Int32)
        return result
    }

    /**
     * A GOBJENUMPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends GOBJENUMPROC {
        /**
         * Creates a GOBJENUMPROC pointer that invokes the given AHK function when called.
         * @param {Func("ptr", LPARAM) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", LPARAM, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}

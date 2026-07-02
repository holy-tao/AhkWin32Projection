#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct PACQUIRE_FOR_LAZY_WRITE_EX {
    value : IntPtr

    __value {
        set {
            if (value is PACQUIRE_FOR_LAZY_WRITE_EX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {Integer} InFlags 
     * @param {Pointer<Integer>} OutFlags 
     * @returns {BOOLEAN} 
     */
    Call(_Context, InFlags, OutFlags) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        OutFlagsMarshal := OutFlags is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, UInt32, InFlags, OutFlagsMarshal, OutFlags, BOOLEAN)
        return result
    }

    /**
     * A PACQUIRE_FOR_LAZY_WRITE_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PACQUIRE_FOR_LAZY_WRITE_EX {
        /**
         * Creates a PACQUIRE_FOR_LAZY_WRITE_EX pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, "uint*") => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, "uint*", BOOLEAN])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

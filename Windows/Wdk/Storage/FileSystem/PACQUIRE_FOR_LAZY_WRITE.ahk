#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct PACQUIRE_FOR_LAZY_WRITE {
    value : IntPtr

    __value {
        set {
            if (value is PACQUIRE_FOR_LAZY_WRITE) {
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
     * @param {BOOLEAN} Wait 
     * @returns {BOOLEAN} 
     */
    Call(_Context, Wait) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, BOOLEAN, Wait, BOOLEAN)
        return result
    }

    /**
     * A PACQUIRE_FOR_LAZY_WRITE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PACQUIRE_FOR_LAZY_WRITE {
        /**
         * Creates a PACQUIRE_FOR_LAZY_WRITE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", BOOLEAN) => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", BOOLEAN, BOOLEAN])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

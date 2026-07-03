#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IWABObject.ahk" { IWABObject }

/**
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct LPWABALLOCATEMORE {
    value : IntPtr

    __value {
        set {
            if (value is LPWABALLOCATEMORE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IWABObject} lpWABObject 
     * @param {Integer} cbSize 
     * @param {Pointer<Void>} lpObject 
     * @param {Pointer<Pointer<Void>>} lppBuffer 
     * @returns {Integer} 
     */
    Call(lpWABObject, cbSize, lpObject, lppBuffer) {
        lpObjectMarshal := lpObject is VarRef ? "ptr" : "ptr"
        lppBufferMarshal := lppBuffer is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, "ptr", lpWABObject, UInt32, cbSize, lpObjectMarshal, lpObject, lppBufferMarshal, lppBuffer, Int32)
        return result
    }

    /**
     * A LPWABALLOCATEMORE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWABALLOCATEMORE {
        /**
         * Creates a LPWABALLOCATEMORE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, "ptr", "ptr*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, "ptr", "ptr*", Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

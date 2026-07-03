#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IWABObject.ahk" { IWABObject }

/**
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct LPWABFREEBUFFER {
    value : IntPtr

    __value {
        set {
            if (value is LPWABFREEBUFFER) {
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
     * @param {Pointer<Void>} lpBuffer 
     * @returns {Integer} 
     */
    Call(lpWABObject, lpBuffer) {
        lpBufferMarshal := lpBuffer is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, "ptr", lpWABObject, lpBufferMarshal, lpBuffer, UInt32)
        return result
    }

    /**
     * A LPWABFREEBUFFER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWABFREEBUFFER {
        /**
         * Creates a LPWABFREEBUFFER pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}

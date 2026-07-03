#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct ObjectReferenceCallback {
    value : IntPtr

    __value {
        set {
            if (value is ObjectReferenceCallback) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} root 
     * @param {Pointer<Pointer>} _reference 
     * @param {Pointer<Void>} clientData 
     * @returns {BOOL} 
     */
    Call(root, _reference, clientData) {
        _referenceMarshal := _reference is VarRef ? "ptr*" : "ptr"
        clientDataMarshal := clientData is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, IntPtr, root, _referenceMarshal, _reference, clientDataMarshal, clientData, BOOL)
        return result
    }

    /**
     * A ObjectReferenceCallback that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends ObjectReferenceCallback {
        /**
         * Creates a ObjectReferenceCallback pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, "ptr*", "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, "ptr*", "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KspQueryAttributesFn {
    value : IntPtr

    __value {
        set {
            if (value is KspQueryAttributesFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} ContextId 
     * @param {Integer} Attribute 
     * @param {Pointer<Void>} _Buffer 
     * @returns {NTSTATUS} 
     */
    Call(ContextId, Attribute, _Buffer) {
        _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, IntPtr, ContextId, UInt32, Attribute, _BufferMarshal, _Buffer, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A KspQueryAttributesFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends KspQueryAttributesFn {
        /**
         * Creates a KspQueryAttributesFn pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, UInt32, "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, UInt32, "ptr", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

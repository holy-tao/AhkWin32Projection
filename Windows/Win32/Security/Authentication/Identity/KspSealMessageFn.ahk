#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SecBufferDesc.ahk" { SecBufferDesc }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KspSealMessageFn {
    value : IntPtr

    __value {
        set {
            if (value is KspSealMessageFn) {
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
     * @param {Integer} fQOP 
     * @param {Pointer<SecBufferDesc>} Message 
     * @param {Integer} MessageSeqNo 
     * @returns {NTSTATUS} 
     */
    Call(ContextId, fQOP, Message, MessageSeqNo) {
        result := DllCall(this.value, IntPtr, ContextId, UInt32, fQOP, SecBufferDesc.Ptr, Message, UInt32, MessageSeqNo, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A KspSealMessageFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends KspSealMessageFn {
        /**
         * Creates a KspSealMessageFn pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, UInt32, SecBufferDesc, UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, UInt32, SecBufferDesc.Ptr, UInt32, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

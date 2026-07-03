#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\SecBufferDesc.ahk" { SecBufferDesc }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KspUnsealMessageFn {
    value : IntPtr

    __value {
        set {
            if (value is KspUnsealMessageFn) {
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
     * @param {Pointer<SecBufferDesc>} Message 
     * @param {Integer} MessageSeqNo 
     * @param {Pointer<Integer>} pfQOP 
     * @returns {NTSTATUS} 
     */
    Call(ContextId, Message, MessageSeqNo, pfQOP) {
        pfQOPMarshal := pfQOP is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, IntPtr, ContextId, SecBufferDesc.Ptr, Message, UInt32, MessageSeqNo, pfQOPMarshal, pfQOP, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A KspUnsealMessageFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends KspUnsealMessageFn {
        /**
         * Creates a KspUnsealMessageFn pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, SecBufferDesc, UInt32, "uint*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, SecBufferDesc.Ptr, UInt32, "uint*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

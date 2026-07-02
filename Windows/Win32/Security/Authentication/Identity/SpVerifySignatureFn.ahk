#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SecBufferDesc.ahk" { SecBufferDesc }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpVerifySignatureFn {
    value : IntPtr

    __value {
        set {
            if (value is SpVerifySignatureFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} ContextHandle 
     * @param {Pointer<SecBufferDesc>} MessageBuffers 
     * @param {Integer} MessageSequenceNumber 
     * @param {Pointer<Integer>} QualityOfProtection 
     * @returns {NTSTATUS} 
     */
    Call(ContextHandle, MessageBuffers, MessageSequenceNumber, QualityOfProtection) {
        QualityOfProtectionMarshal := QualityOfProtection is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, IntPtr, ContextHandle, SecBufferDesc.Ptr, MessageBuffers, UInt32, MessageSequenceNumber, QualityOfProtectionMarshal, QualityOfProtection, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A SpVerifySignatureFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpVerifySignatureFn {
        /**
         * Creates a SpVerifySignatureFn pointer that invokes the given AHK function when called.
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

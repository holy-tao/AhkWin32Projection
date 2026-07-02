#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SecBufferDesc.ahk" { SecBufferDesc }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpMakeSignatureFn {
    value : IntPtr

    __value {
        set {
            if (value is SpMakeSignatureFn) {
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
     * @param {Integer} QualityOfProtection 
     * @param {Pointer<SecBufferDesc>} MessageBuffers 
     * @param {Integer} MessageSequenceNumber 
     * @returns {NTSTATUS} 
     */
    Call(ContextHandle, QualityOfProtection, MessageBuffers, MessageSequenceNumber) {
        result := DllCall(this.value, IntPtr, ContextHandle, UInt32, QualityOfProtection, SecBufferDesc.Ptr, MessageBuffers, UInt32, MessageSequenceNumber, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A SpMakeSignatureFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpMakeSignatureFn {
        /**
         * Creates a SpMakeSignatureFn pointer that invokes the given AHK function when called.
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

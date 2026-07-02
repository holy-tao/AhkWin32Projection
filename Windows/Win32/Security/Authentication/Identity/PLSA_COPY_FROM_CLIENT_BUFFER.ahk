#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_COPY_FROM_CLIENT_BUFFER {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_COPY_FROM_CLIENT_BUFFER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} ClientRequest 
     * @param {Integer} Length 
     * @param {Integer} BufferToCopy 
     * @param {Integer} ClientBaseAddress 
     * @returns {NTSTATUS} 
     */
    Call(ClientRequest, Length, BufferToCopy, ClientBaseAddress) {
        ClientRequestMarshal := ClientRequest is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, ClientRequestMarshal, ClientRequest, UInt32, Length, IntPtr, BufferToCopy, IntPtr, ClientBaseAddress, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PLSA_COPY_FROM_CLIENT_BUFFER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_COPY_FROM_CLIENT_BUFFER {
        /**
         * Creates a PLSA_COPY_FROM_CLIENT_BUFFER pointer that invokes the given AHK function when called.
         * @param {Func("ptr*", UInt32, IntPtr, IntPtr) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr*", UInt32, IntPtr, IntPtr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

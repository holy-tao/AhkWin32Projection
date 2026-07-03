#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_COPY_TO_CLIENT_BUFFER {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_COPY_TO_CLIENT_BUFFER) {
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
     * @param {Integer} ClientBaseAddress 
     * @param {Integer} BufferToCopy 
     * @returns {NTSTATUS} 
     */
    Call(ClientRequest, Length, ClientBaseAddress, BufferToCopy) {
        ClientRequestMarshal := ClientRequest is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, ClientRequestMarshal, ClientRequest, UInt32, Length, IntPtr, ClientBaseAddress, IntPtr, BufferToCopy, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PLSA_COPY_TO_CLIENT_BUFFER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_COPY_TO_CLIENT_BUFFER {
        /**
         * Creates a PLSA_COPY_TO_CLIENT_BUFFER pointer that invokes the given AHK function when called.
         * @param {Func("ptr*", UInt32, IntPtr, IntPtr) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr*", UInt32, IntPtr, IntPtr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}

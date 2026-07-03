#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_FREE_CLIENT_BUFFER {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_FREE_CLIENT_BUFFER) {
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
     * @param {Pointer<Void>} ClientBaseAddress 
     * @returns {NTSTATUS} 
     */
    Call(ClientRequest, ClientBaseAddress) {
        ClientRequestMarshal := ClientRequest is VarRef ? "ptr*" : "ptr"
        ClientBaseAddressMarshal := ClientBaseAddress is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, ClientRequestMarshal, ClientRequest, ClientBaseAddressMarshal, ClientBaseAddress, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PLSA_FREE_CLIENT_BUFFER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_FREE_CLIENT_BUFFER {
        /**
         * Creates a PLSA_FREE_CLIENT_BUFFER pointer that invokes the given AHK function when called.
         * @param {Func("ptr*", "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr*", "ptr", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}

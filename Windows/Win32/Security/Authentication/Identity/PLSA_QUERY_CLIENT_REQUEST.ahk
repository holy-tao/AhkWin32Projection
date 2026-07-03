#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_QUERY_CLIENT_REQUEST {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_QUERY_CLIENT_REQUEST) {
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
     * @param {Integer} QueryType 
     * @param {Pointer<Pointer<Void>>} ReplyBuffer 
     * @returns {NTSTATUS} 
     */
    Call(ClientRequest, QueryType, ReplyBuffer) {
        ClientRequestMarshal := ClientRequest is VarRef ? "ptr*" : "ptr"
        ReplyBufferMarshal := ReplyBuffer is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, ClientRequestMarshal, ClientRequest, UInt32, QueryType, ReplyBufferMarshal, ReplyBuffer, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PLSA_QUERY_CLIENT_REQUEST that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_QUERY_CLIENT_REQUEST {
        /**
         * Creates a PLSA_QUERY_CLIENT_REQUEST pointer that invokes the given AHK function when called.
         * @param {Func("ptr*", UInt32, "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr*", UInt32, "ptr*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}

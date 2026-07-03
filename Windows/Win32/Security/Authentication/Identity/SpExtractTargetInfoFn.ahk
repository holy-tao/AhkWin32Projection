#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpExtractTargetInfoFn {
    value : IntPtr

    __value {
        set {
            if (value is SpExtractTargetInfoFn) {
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
     * @param {Integer} ProtocolSubmitBuffer 
     * @param {Pointer<Void>} ClientBufferBase 
     * @param {Integer} SubmitBufferLength 
     * @param {Pointer<Pointer<Void>>} ppvTargetInfo 
     * @param {Pointer<Integer>} pcbTargetInfo 
     * @returns {NTSTATUS} 
     */
    Call(ClientRequest, ProtocolSubmitBuffer, ClientBufferBase, SubmitBufferLength, ppvTargetInfo, pcbTargetInfo) {
        ClientRequestMarshal := ClientRequest is VarRef ? "ptr*" : "ptr"
        ClientBufferBaseMarshal := ClientBufferBase is VarRef ? "ptr" : "ptr"
        ppvTargetInfoMarshal := ppvTargetInfo is VarRef ? "ptr*" : "ptr"
        pcbTargetInfoMarshal := pcbTargetInfo is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, ClientRequestMarshal, ClientRequest, IntPtr, ProtocolSubmitBuffer, ClientBufferBaseMarshal, ClientBufferBase, UInt32, SubmitBufferLength, ppvTargetInfoMarshal, ppvTargetInfo, pcbTargetInfoMarshal, pcbTargetInfo, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A SpExtractTargetInfoFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpExtractTargetInfoFn {
        /**
         * Creates a SpExtractTargetInfoFn pointer that invokes the given AHK function when called.
         * @param {Func("ptr*", IntPtr, "ptr", UInt32, "ptr*", "uint*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr*", IntPtr, "ptr", UInt32, "ptr*", "uint*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}

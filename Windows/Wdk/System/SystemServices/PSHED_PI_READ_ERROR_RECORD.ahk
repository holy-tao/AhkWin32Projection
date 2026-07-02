#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PSHED_PI_READ_ERROR_RECORD {
    value : IntPtr

    __value {
        set {
            if (value is PSHED_PI_READ_ERROR_RECORD) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} PluginContext 
     * @param {Integer} Flags 
     * @param {Integer} ErrorRecordId 
     * @param {Pointer<Integer>} NextErrorRecordId 
     * @param {Pointer<Integer>} RecordLength 
     * @param {Integer} ErrorRecord 
     * @returns {NTSTATUS} 
     */
    Call(PluginContext, Flags, ErrorRecordId, NextErrorRecordId, RecordLength, ErrorRecord) {
        PluginContextMarshal := PluginContext is VarRef ? "ptr" : "ptr"
        NextErrorRecordIdMarshal := NextErrorRecordId is VarRef ? "uint*" : "ptr"
        RecordLengthMarshal := RecordLength is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, PluginContextMarshal, PluginContext, UInt32, Flags, Int64, ErrorRecordId, NextErrorRecordIdMarshal, NextErrorRecordId, RecordLengthMarshal, RecordLength, IntPtr, ErrorRecord, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PSHED_PI_READ_ERROR_RECORD that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSHED_PI_READ_ERROR_RECORD {
        /**
         * Creates a PSHED_PI_READ_ERROR_RECORD pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, Int64, "uint*", "uint*", IntPtr) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, Int64, "uint*", "uint*", IntPtr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

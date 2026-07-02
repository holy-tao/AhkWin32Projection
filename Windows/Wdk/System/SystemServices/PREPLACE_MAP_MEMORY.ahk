#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PREPLACE_MAP_MEMORY {
    value : IntPtr

    __value {
        set {
            if (value is PREPLACE_MAP_MEMORY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} TargetPhysicalAddress 
     * @param {Integer} SparePhysicalAddress 
     * @param {Pointer<Integer>} NumberOfBytes 
     * @param {Pointer<Pointer<Void>>} TargetAddress 
     * @param {Pointer<Pointer<Void>>} SpareAddress 
     * @returns {NTSTATUS} 
     */
    Call(TargetPhysicalAddress, SparePhysicalAddress, NumberOfBytes, TargetAddress, SpareAddress) {
        NumberOfBytesMarshal := NumberOfBytes is VarRef ? "int64*" : "ptr"
        TargetAddressMarshal := TargetAddress is VarRef ? "ptr*" : "ptr"
        SpareAddressMarshal := SpareAddress is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, Int64, TargetPhysicalAddress, Int64, SparePhysicalAddress, NumberOfBytesMarshal, NumberOfBytes, TargetAddressMarshal, TargetAddress, SpareAddressMarshal, SpareAddress, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PREPLACE_MAP_MEMORY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PREPLACE_MAP_MEMORY {
        /**
         * Creates a PREPLACE_MAP_MEMORY pointer that invokes the given AHK function when called.
         * @param {Func(Int64, Int64, "int64*", "ptr*", "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int64, Int64, "int64*", "ptr*", "ptr*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

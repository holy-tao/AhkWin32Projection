#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PQUERY_APPINSTANCE_VERSION {
    value : IntPtr

    __value {
        set {
            if (value is PQUERY_APPINSTANCE_VERSION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Guid>} AppInstanceId 
     * @param {Pointer<Integer>} InstanceVersionHigh 
     * @param {Pointer<Integer>} InstanceVersionLow 
     * @param {Pointer<NTSTATUS>} VersionStatus 
     * @returns {Integer} 
     */
    Call(AppInstanceId, InstanceVersionHigh, InstanceVersionLow, VersionStatus) {
        InstanceVersionHighMarshal := InstanceVersionHigh is VarRef ? "uint*" : "ptr"
        InstanceVersionLowMarshal := InstanceVersionLow is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, Guid.Ptr, AppInstanceId, InstanceVersionHighMarshal, InstanceVersionHigh, InstanceVersionLowMarshal, InstanceVersionLow, "ptr", VersionStatus, UInt32)
        return result
    }

    /**
     * A PQUERY_APPINSTANCE_VERSION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PQUERY_APPINSTANCE_VERSION {
        /**
         * Creates a PQUERY_APPINSTANCE_VERSION pointer that invokes the given AHK function when called.
         * @param {Func(Guid, "uint*", "uint*", "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, "uint*", "uint*", "ptr", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}

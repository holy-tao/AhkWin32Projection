#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PREGISTER_APPINSTANCE_VERSION {
    value : IntPtr

    __value {
        set {
            if (value is PREGISTER_APPINSTANCE_VERSION) {
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
     * @param {Integer} InstanceVersionHigh 
     * @param {Integer} InstanceVersionLow 
     * @returns {Integer} 
     */
    Call(AppInstanceId, InstanceVersionHigh, InstanceVersionLow) {
        result := DllCall(this.value, Guid.Ptr, AppInstanceId, Int64, InstanceVersionHigh, Int64, InstanceVersionLow, UInt32)
        return result
    }

    /**
     * A PREGISTER_APPINSTANCE_VERSION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PREGISTER_APPINSTANCE_VERSION {
        /**
         * Creates a PREGISTER_APPINSTANCE_VERSION pointer that invokes the given AHK function when called.
         * @param {Func(Guid, Int64, Int64) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, Int64, Int64, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}

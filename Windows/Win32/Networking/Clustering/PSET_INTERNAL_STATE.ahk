#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CLUSTER_RESOURCE_APPLICATION_STATE.ahk" { CLUSTER_RESOURCE_APPLICATION_STATE }

/**
 * Sets the internal state of a resource.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/nc-resapi-pset_internal_state
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PSET_INTERNAL_STATE {
    value : IntPtr

    __value {
        set {
            if (value is PSET_INTERNAL_STATE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} param0 
     * @param {CLUSTER_RESOURCE_APPLICATION_STATE} stateType A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/ne-resapi-cluster_resource_application_state">CLUSTER_RESOURCE_APPLICATION_STATE</a> value
     * @param {BOOL} active Whether the resource is active
     * @returns {Integer} 
     */
    Call(param0, stateType, active) {
        result := DllCall(this.value, IntPtr, param0, CLUSTER_RESOURCE_APPLICATION_STATE, stateType, BOOL, active, UInt32)
        return result
    }

    /**
     * A PSET_INTERNAL_STATE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSET_INTERNAL_STATE {
        /**
         * Creates a PSET_INTERNAL_STATE pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, CLUSTER_RESOURCE_APPLICATION_STATE, BOOL) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, CLUSTER_RESOURCE_APPLICATION_STATE, BOOL, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

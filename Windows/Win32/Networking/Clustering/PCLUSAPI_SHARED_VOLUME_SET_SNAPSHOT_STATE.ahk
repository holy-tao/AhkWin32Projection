#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CLUSTER_SHARED_VOLUME_SNAPSHOT_STATE.ahk" { CLUSTER_SHARED_VOLUME_SNAPSHOT_STATE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_SHARED_VOLUME_SET_SNAPSHOT_STATE {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_SHARED_VOLUME_SET_SNAPSHOT_STATE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Guid} guidSnapshotSet 
     * @param {PWSTR} lpszVolumeName 
     * @param {CLUSTER_SHARED_VOLUME_SNAPSHOT_STATE} state 
     * @returns {Integer} 
     */
    Call(guidSnapshotSet, lpszVolumeName, state) {
        lpszVolumeName := lpszVolumeName is String ? StrPtr(lpszVolumeName) : lpszVolumeName

        result := DllCall(this.value, Guid, guidSnapshotSet, "ptr", lpszVolumeName, CLUSTER_SHARED_VOLUME_SNAPSHOT_STATE, state, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_SHARED_VOLUME_SET_SNAPSHOT_STATE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_SHARED_VOLUME_SET_SNAPSHOT_STATE {
        /**
         * Creates a PCLUSAPI_SHARED_VOLUME_SET_SNAPSHOT_STATE pointer that invokes the given AHK function when called.
         * @param {Func(Guid, PWSTR, CLUSTER_SHARED_VOLUME_SNAPSHOT_STATE) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid, PWSTR, CLUSTER_SHARED_VOLUME_SNAPSHOT_STATE, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

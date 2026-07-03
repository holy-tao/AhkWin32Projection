#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_IS_FILE_ON_CLUSTER_SHARED_VOLUME {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_IS_FILE_ON_CLUSTER_SHARED_VOLUME) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} lpszPathName 
     * @param {Pointer<BOOL>} pbFileIsOnSharedVolume 
     * @returns {Integer} 
     */
    Call(lpszPathName, pbFileIsOnSharedVolume) {
        lpszPathName := lpszPathName is String ? StrPtr(lpszPathName) : lpszPathName

        pbFileIsOnSharedVolumeMarshal := pbFileIsOnSharedVolume is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, "ptr", lpszPathName, pbFileIsOnSharedVolumeMarshal, pbFileIsOnSharedVolume, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_IS_FILE_ON_CLUSTER_SHARED_VOLUME that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_IS_FILE_ON_CLUSTER_SHARED_VOLUME {
        /**
         * Creates a PCLUSAPI_IS_FILE_ON_CLUSTER_SHARED_VOLUME pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, BOOL) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, BOOL.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSTER_IS_PATH_ON_SHARED_VOLUME {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSTER_IS_PATH_ON_SHARED_VOLUME) {
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
     * @returns {BOOL} 
     */
    Call(lpszPathName) {
        lpszPathName := lpszPathName is String ? StrPtr(lpszPathName) : lpszPathName

        result := DllCall(this.value, "ptr", lpszPathName, BOOL)
        return result
    }

    /**
     * A PCLUSTER_IS_PATH_ON_SHARED_VOLUME that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSTER_IS_PATH_ON_SHARED_VOLUME {
        /**
         * Creates a PCLUSTER_IS_PATH_ON_SHARED_VOLUME pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_RESTORE_CLUSTER_DATABASE {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_RESTORE_CLUSTER_DATABASE) {
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
     * @param {BOOL} bForce 
     * @param {PWSTR} lpszQuorumDriveLetter 
     * @returns {Integer} 
     */
    Call(lpszPathName, bForce, lpszQuorumDriveLetter) {
        lpszPathName := lpszPathName is String ? StrPtr(lpszPathName) : lpszPathName
        lpszQuorumDriveLetter := lpszQuorumDriveLetter is String ? StrPtr(lpszQuorumDriveLetter) : lpszQuorumDriveLetter

        result := DllCall(this.value, "ptr", lpszPathName, BOOL, bForce, "ptr", lpszQuorumDriveLetter, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_RESTORE_CLUSTER_DATABASE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_RESTORE_CLUSTER_DATABASE {
        /**
         * Creates a PCLUSAPI_RESTORE_CLUSTER_DATABASE pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, BOOL, PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, BOOL, PWSTR, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

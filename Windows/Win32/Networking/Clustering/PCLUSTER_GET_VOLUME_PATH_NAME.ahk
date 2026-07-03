#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSTER_GET_VOLUME_PATH_NAME {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSTER_GET_VOLUME_PATH_NAME) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} lpszFileName 
     * @param {PWSTR} lpszVolumePathName 
     * @param {Integer} cchBufferLength 
     * @returns {BOOL} 
     */
    Call(lpszFileName, lpszVolumePathName, cchBufferLength) {
        lpszFileName := lpszFileName is String ? StrPtr(lpszFileName) : lpszFileName
        lpszVolumePathName := lpszVolumePathName is String ? StrPtr(lpszVolumePathName) : lpszVolumePathName

        result := DllCall(this.value, "ptr", lpszFileName, "ptr", lpszVolumePathName, UInt32, cchBufferLength, BOOL)
        return result
    }

    /**
     * A PCLUSTER_GET_VOLUME_PATH_NAME that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSTER_GET_VOLUME_PATH_NAME {
        /**
         * Creates a PCLUSTER_GET_VOLUME_PATH_NAME pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR, UInt32, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}

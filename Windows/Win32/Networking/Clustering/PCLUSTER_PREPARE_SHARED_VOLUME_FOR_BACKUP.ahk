#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSTER_PREPARE_SHARED_VOLUME_FOR_BACKUP {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSTER_PREPARE_SHARED_VOLUME_FOR_BACKUP) {
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
     * @param {Pointer<Integer>} lpcchVolumePathName 
     * @param {PWSTR} lpszVolumeName 
     * @param {Pointer<Integer>} lpcchVolumeName 
     * @returns {Integer} 
     */
    Call(lpszFileName, lpszVolumePathName, lpcchVolumePathName, lpszVolumeName, lpcchVolumeName) {
        lpszFileName := lpszFileName is String ? StrPtr(lpszFileName) : lpszFileName
        lpszVolumePathName := lpszVolumePathName is String ? StrPtr(lpszVolumePathName) : lpszVolumePathName
        lpszVolumeName := lpszVolumeName is String ? StrPtr(lpszVolumeName) : lpszVolumeName

        lpcchVolumePathNameMarshal := lpcchVolumePathName is VarRef ? "uint*" : "ptr"
        lpcchVolumeNameMarshal := lpcchVolumeName is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, "ptr", lpszFileName, "ptr", lpszVolumePathName, lpcchVolumePathNameMarshal, lpcchVolumePathName, "ptr", lpszVolumeName, lpcchVolumeNameMarshal, lpcchVolumeName, UInt32)
        return result
    }

    /**
     * A PCLUSTER_PREPARE_SHARED_VOLUME_FOR_BACKUP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSTER_PREPARE_SHARED_VOLUME_FOR_BACKUP {
        /**
         * Creates a PCLUSTER_PREPARE_SHARED_VOLUME_FOR_BACKUP pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR, "uint*", PWSTR, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR, "uint*", PWSTR, "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

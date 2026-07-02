#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSTER_GET_VOLUME_NAME_FOR_VOLUME_MOUNT_POINT {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSTER_GET_VOLUME_NAME_FOR_VOLUME_MOUNT_POINT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} lpszVolumeMountPoint 
     * @param {PWSTR} lpszVolumeName 
     * @param {Integer} cchBufferLength 
     * @returns {BOOL} 
     */
    Call(lpszVolumeMountPoint, lpszVolumeName, cchBufferLength) {
        lpszVolumeMountPoint := lpszVolumeMountPoint is String ? StrPtr(lpszVolumeMountPoint) : lpszVolumeMountPoint
        lpszVolumeName := lpszVolumeName is String ? StrPtr(lpszVolumeName) : lpszVolumeName

        result := DllCall(this.value, "ptr", lpszVolumeMountPoint, "ptr", lpszVolumeName, UInt32, cchBufferLength, BOOL)
        return result
    }

    /**
     * A PCLUSTER_GET_VOLUME_NAME_FOR_VOLUME_MOUNT_POINT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSTER_GET_VOLUME_NAME_FOR_VOLUME_MOUNT_POINT {
        /**
         * Creates a PCLUSTER_GET_VOLUME_NAME_FOR_VOLUME_MOUNT_POINT pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

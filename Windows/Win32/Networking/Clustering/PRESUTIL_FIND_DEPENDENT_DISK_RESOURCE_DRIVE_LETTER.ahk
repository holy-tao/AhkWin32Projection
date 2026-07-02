#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HRESOURCE.ahk" { HRESOURCE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_FIND_DEPENDENT_DISK_RESOURCE_DRIVE_LETTER {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_FIND_DEPENDENT_DISK_RESOURCE_DRIVE_LETTER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HCLUSTER} _hCluster 
     * @param {HRESOURCE} _hResource 
     * @param {PWSTR} pszDriveLetter 
     * @param {Pointer<Integer>} pcchDriveLetter 
     * @returns {Integer} 
     */
    Call(_hCluster, _hResource, pszDriveLetter, pcchDriveLetter) {
        pszDriveLetter := pszDriveLetter is String ? StrPtr(pszDriveLetter) : pszDriveLetter

        pcchDriveLetterMarshal := pcchDriveLetter is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HCLUSTER, _hCluster, HRESOURCE, _hResource, "ptr", pszDriveLetter, pcchDriveLetterMarshal, pcchDriveLetter, UInt32)
        return result
    }

    /**
     * A PRESUTIL_FIND_DEPENDENT_DISK_RESOURCE_DRIVE_LETTER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_FIND_DEPENDENT_DISK_RESOURCE_DRIVE_LETTER {
        /**
         * Creates a PRESUTIL_FIND_DEPENDENT_DISK_RESOURCE_DRIVE_LETTER pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, HRESOURCE, PWSTR, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, HRESOURCE, PWSTR, "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

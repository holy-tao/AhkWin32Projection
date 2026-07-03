#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSTER_SET_ACCOUNT_ACCESS {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSTER_SET_ACCOUNT_ACCESS) {
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
     * @param {PWSTR} szAccountSID 
     * @param {Integer} dwAccess 
     * @param {Integer} dwControlType 
     * @returns {Integer} 
     */
    Call(_hCluster, szAccountSID, dwAccess, dwControlType) {
        szAccountSID := szAccountSID is String ? StrPtr(szAccountSID) : szAccountSID

        result := DllCall(this.value, HCLUSTER, _hCluster, "ptr", szAccountSID, UInt32, dwAccess, UInt32, dwControlType, UInt32)
        return result
    }

    /**
     * A PCLUSTER_SET_ACCOUNT_ACCESS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSTER_SET_ACCOUNT_ACCESS {
        /**
         * Creates a PCLUSTER_SET_ACCOUNT_ACCESS pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, PWSTR, UInt32, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, PWSTR, UInt32, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}

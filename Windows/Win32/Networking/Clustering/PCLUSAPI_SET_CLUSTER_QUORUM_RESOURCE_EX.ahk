#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HRESOURCE.ahk" { HRESOURCE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSAPI_SET_CLUSTER_QUORUM_RESOURCE_EX {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSAPI_SET_CLUSTER_QUORUM_RESOURCE_EX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HRESOURCE} _hResource 
     * @param {PWSTR} lpszDeviceName 
     * @param {Integer} dwMaxQuorumLogSize 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    Call(_hResource, lpszDeviceName, dwMaxQuorumLogSize, lpszReason) {
        lpszDeviceName := lpszDeviceName is String ? StrPtr(lpszDeviceName) : lpszDeviceName
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall(this.value, HRESOURCE, _hResource, "ptr", lpszDeviceName, UInt32, dwMaxQuorumLogSize, "ptr", lpszReason, UInt32)
        return result
    }

    /**
     * A PCLUSAPI_SET_CLUSTER_QUORUM_RESOURCE_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSAPI_SET_CLUSTER_QUORUM_RESOURCE_EX {
        /**
         * Creates a PCLUSAPI_SET_CLUSTER_QUORUM_RESOURCE_EX pointer that invokes the given AHK function when called.
         * @param {Func(HRESOURCE, PWSTR, UInt32, PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HRESOURCE, PWSTR, UInt32, PWSTR, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DOT11EXT_IHV_DISCOVERY_PROFILE_LIST.ahk" { DOT11EXT_IHV_DISCOVERY_PROFILE_LIST }
#Import ".\DOT11EXT_IHV_PROFILE_PARAMS.ahk" { DOT11EXT_IHV_PROFILE_PARAMS }
#Import ".\DOT11_BSS_LIST.ahk" { DOT11_BSS_LIST }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXTIHV_CREATE_DISCOVERY_PROFILES {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXTIHV_CREATE_DISCOVERY_PROFILES) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hIhvExtAdapter 
     * @param {BOOL} bInsecure 
     * @param {Pointer<DOT11EXT_IHV_PROFILE_PARAMS>} pIhvProfileParams 
     * @param {Pointer<DOT11_BSS_LIST>} pConnectableBssid 
     * @param {Pointer<DOT11EXT_IHV_DISCOVERY_PROFILE_LIST>} pIhvDiscoveryProfileList 
     * @param {Pointer<Integer>} pdwReasonCode 
     * @returns {Integer} 
     */
    Call(hIhvExtAdapter, bInsecure, pIhvProfileParams, pConnectableBssid, pIhvDiscoveryProfileList, pdwReasonCode) {
        pdwReasonCodeMarshal := pdwReasonCode is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HANDLE, hIhvExtAdapter, BOOL, bInsecure, DOT11EXT_IHV_PROFILE_PARAMS.Ptr, pIhvProfileParams, DOT11_BSS_LIST.Ptr, pConnectableBssid, DOT11EXT_IHV_DISCOVERY_PROFILE_LIST.Ptr, pIhvDiscoveryProfileList, pdwReasonCodeMarshal, pdwReasonCode, UInt32)
        return result
    }

    /**
     * A DOT11EXTIHV_CREATE_DISCOVERY_PROFILES that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXTIHV_CREATE_DISCOVERY_PROFILES {
        /**
         * Creates a DOT11EXTIHV_CREATE_DISCOVERY_PROFILES pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, BOOL, DOT11EXT_IHV_PROFILE_PARAMS, DOT11_BSS_LIST, DOT11EXT_IHV_DISCOVERY_PROFILE_LIST, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, BOOL, DOT11EXT_IHV_PROFILE_PARAMS.Ptr, DOT11_BSS_LIST.Ptr, DOT11EXT_IHV_DISCOVERY_PROFILE_LIST.Ptr, "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

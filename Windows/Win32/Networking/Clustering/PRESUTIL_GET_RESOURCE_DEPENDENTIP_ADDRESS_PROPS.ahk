#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HRESOURCE.ahk" { HRESOURCE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_GET_RESOURCE_DEPENDENTIP_ADDRESS_PROPS {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_GET_RESOURCE_DEPENDENTIP_ADDRESS_PROPS) {
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
     * @param {PWSTR} pszAddress 
     * @param {Pointer<Integer>} pcchAddress 
     * @param {PWSTR} pszSubnetMask 
     * @param {Pointer<Integer>} pcchSubnetMask 
     * @param {PWSTR} pszNetwork 
     * @param {Pointer<Integer>} pcchNetwork 
     * @returns {Integer} 
     */
    Call(_hResource, pszAddress, pcchAddress, pszSubnetMask, pcchSubnetMask, pszNetwork, pcchNetwork) {
        pszAddress := pszAddress is String ? StrPtr(pszAddress) : pszAddress
        pszSubnetMask := pszSubnetMask is String ? StrPtr(pszSubnetMask) : pszSubnetMask
        pszNetwork := pszNetwork is String ? StrPtr(pszNetwork) : pszNetwork

        pcchAddressMarshal := pcchAddress is VarRef ? "uint*" : "ptr"
        pcchSubnetMaskMarshal := pcchSubnetMask is VarRef ? "uint*" : "ptr"
        pcchNetworkMarshal := pcchNetwork is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HRESOURCE, _hResource, "ptr", pszAddress, pcchAddressMarshal, pcchAddress, "ptr", pszSubnetMask, pcchSubnetMaskMarshal, pcchSubnetMask, "ptr", pszNetwork, pcchNetworkMarshal, pcchNetwork, UInt32)
        return result
    }

    /**
     * A PRESUTIL_GET_RESOURCE_DEPENDENTIP_ADDRESS_PROPS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_GET_RESOURCE_DEPENDENTIP_ADDRESS_PROPS {
        /**
         * Creates a PRESUTIL_GET_RESOURCE_DEPENDENTIP_ADDRESS_PROPS pointer that invokes the given AHK function when called.
         * @param {Func(HRESOURCE, PWSTR, "uint*", PWSTR, "uint*", PWSTR, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HRESOURCE, PWSTR, "uint*", PWSTR, "uint*", PWSTR, "uint*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}

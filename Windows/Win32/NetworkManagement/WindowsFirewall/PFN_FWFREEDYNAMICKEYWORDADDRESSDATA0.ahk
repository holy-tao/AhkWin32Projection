#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FW_DYNAMIC_KEYWORD_ADDRESS_DATA0.ahk" { FW_DYNAMIC_KEYWORD_ADDRESS_DATA0 }

/**
 * Function pointer type of the entry point in the service that you call to free dynamic keyword address data structs allocated by the service.
 * @remarks
 * You should call this function only on values returned by [FWEnumDynamicKeywordAddressById0](nc-netfw-pfn_fwenumdynamickeywordaddressbyid0.md) or [FWEnumDynamicKeywordAddressesByType0](nc-netfw-pfn_fwenumdynamickeywordaddressesbytype0.md).
 * @see https://learn.microsoft.com/windows/win32/api/netfw/nc-netfw-pfn_fwfreedynamickeywordaddressdata0
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct PFN_FWFREEDYNAMICKEYWORDADDRESSDATA0 {
    value : IntPtr

    __value {
        set {
            if (value is PFN_FWFREEDYNAMICKEYWORDADDRESSDATA0) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<FW_DYNAMIC_KEYWORD_ADDRESS_DATA0>} dynamicKeywordAddressData Type: \_In\_ **[PFW_DYNAMIC_KEYWORD_ADDRESS0](ns-netfw-fw_dynamic_keyword_address0.md)**
     * 
     * A pointer to either a single dynamic keyword address data object to be freed, or the head of a list of dynamic keyword address data object to be freed.
     * @returns {Integer} Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * If the function succeeds, then it returns **ERROR_SUCCESS**.
     */
    Call(dynamicKeywordAddressData) {
        result := DllCall(this.value, FW_DYNAMIC_KEYWORD_ADDRESS_DATA0.Ptr, dynamicKeywordAddressData, UInt32)
        return result
    }

    /**
     * A PFN_FWFREEDYNAMICKEYWORDADDRESSDATA0 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_FWFREEDYNAMICKEYWORDADDRESSDATA0 {
        /**
         * Creates a PFN_FWFREEDYNAMICKEYWORDADDRESSDATA0 pointer that invokes the given AHK function when called.
         * @param {Func(FW_DYNAMIC_KEYWORD_ADDRESS_DATA0) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FW_DYNAMIC_KEYWORD_ADDRESS_DATA0.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

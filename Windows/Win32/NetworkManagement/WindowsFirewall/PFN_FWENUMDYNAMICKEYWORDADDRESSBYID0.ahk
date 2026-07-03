#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import ".\FW_DYNAMIC_KEYWORD_ADDRESS_DATA0.ahk" { FW_DYNAMIC_KEYWORD_ADDRESS_DATA0 }

/**
 * Function pointer type of the entry point in the service that you call to enumerate the specific dynamic keyword addresses by ID.
 * @remarks
 * If the object returned via *dynamicKeywordAddressData* is non-NULL, then its *pNext* field is always null.
 * 
 * You must free the the returned addresses object by calling [FWFreeDynamicKeywordAddressData0](nc-netfw-pfn_fwfreedynamickeywordaddressdata0.md).
 * @see https://learn.microsoft.com/windows/win32/api/netfw/nc-netfw-pfn_fwenumdynamickeywordaddressbyid0
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct PFN_FWENUMDYNAMICKEYWORDADDRESSBYID0 {
    value : IntPtr

    __value {
        set {
            if (value is PFN_FWENUMDYNAMICKEYWORDADDRESSBYID0) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Guid} dynamicKeywordAddressId Type: **[GUID](/windows/win32/api/guiddef/ns-guiddef-guid)**
     * 
     * The id of the dynamic keyword address object to enumerate.
     * @param {Pointer<Pointer<FW_DYNAMIC_KEYWORD_ADDRESS_DATA0>>} dynamicKeywordAddressData Type: \_Out\_ **[PFW_DYNAMIC_KEYWORD_ADDRESS0](ns-netfw-fw_dynamic_keyword_address0.md)\***
     * 
     * The address of a pointer to a dynamic keyword address object, which will hold the object returned. You must free this object by calling [FWFreeDynamicKeywordAddressData0](nc-netfw-pfn_fwfreedynamickeywordaddressdata0.md).
     * @returns {Integer} Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * If the function succeeds, then it returns **ERROR_SUCCESS**.
     */
    Call(dynamicKeywordAddressId, dynamicKeywordAddressData) {
        dynamicKeywordAddressDataMarshal := dynamicKeywordAddressData is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, Guid, dynamicKeywordAddressId, dynamicKeywordAddressDataMarshal, dynamicKeywordAddressData, UInt32)
        return result
    }

    /**
     * A PFN_FWENUMDYNAMICKEYWORDADDRESSBYID0 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_FWENUMDYNAMICKEYWORDADDRESSBYID0 {
        /**
         * Creates a PFN_FWENUMDYNAMICKEYWORDADDRESSBYID0 pointer that invokes the given AHK function when called.
         * @param {Func(Guid, "ptr*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid, "ptr*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

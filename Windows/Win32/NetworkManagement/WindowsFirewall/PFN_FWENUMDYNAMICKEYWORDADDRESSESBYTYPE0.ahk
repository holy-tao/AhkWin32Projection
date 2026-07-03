#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FW_DYNAMIC_KEYWORD_ADDRESS_DATA0.ahk" { FW_DYNAMIC_KEYWORD_ADDRESS_DATA0 }

/**
 * Function pointer type of the entry point in the service that you call to enumerate dynamic keyword addresses by type. You can request a particular subset of objects based on the enumeration flags passed in.
 * @remarks
 * You must free the address of the first returned object in the list (the head of the list) by calling [FWFreeDynamicKeywordAddressData0](nc-netfw-pfn_fwfreedynamickeywordaddressdata0.md).
 * @see https://learn.microsoft.com/windows/win32/api/netfw/nc-netfw-pfn_fwenumdynamickeywordaddressesbytype0
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct PFN_FWENUMDYNAMICKEYWORDADDRESSESBYTYPE0 {
    value : IntPtr

    __value {
        set {
            if (value is PFN_FWENUMDYNAMICKEYWORDADDRESSESBYTYPE0) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} flags Type: **[DWORD](/windows/win32/api/guiddef/ns-guiddef-guid)**
     * 
     * Using the value [FW_DYNAMIC_KEYWORD_ADDRESS_ENUM_FLAGS_AUTO_RESOLVE](ne-netfw-fw_dynamic_keyword_address_enum_flags.md) will enumerate all objects that have the [FW_DYNAMIC_KEYWORD_ADDRESS_FLAGS_AUTO_RESOLVE](ne-netfw-fw_dynamic_keyword_address_flags.md) flag set.
     * 
     * Using the value [FW_DYNAMIC_KEYWORD_ADDRESS_ENUM_FLAGS_NON_AUTO_RESOLVE](ne-netfw-fw_dynamic_keyword_address_enum_flags.md) will enumerate all objects that have the [FW_DYNAMIC_KEYWORD_ADDRESS_FLAGS_AUTO_RESOLVE](ne-netfw-fw_dynamic_keyword_address_flags.md) flag *not* set.
     * 
     * Using the value [FW_DYNAMIC_KEYWORD_ADDRESS_ENUM_FLAGS_NON_AUTO_RESOLVE](ne-netfw-fw_dynamic_keyword_address_enum_flags.md) will enumerate *all* objects.
     * @param {Pointer<Pointer<FW_DYNAMIC_KEYWORD_ADDRESS_DATA0>>} dynamicKeywordAddressData Type: \_Out\_ **[PFW_DYNAMIC_KEYWORD_ADDRESS0](ns-netfw-fw_dynamic_keyword_address0.md)\***
     * 
     * The address of a pointer to a dynamic keyword address object, which will hold a linked list of objects returned. You must free this address by calling [FWFreeDynamicKeywordAddressData0](nc-netfw-pfn_fwfreedynamickeywordaddressdata0.md).
     * @returns {Integer} Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * If the function succeeds, then it returns **ERROR_SUCCESS**. Otherwise, it returns one of the following values.
     * 
     * |Return value|Description|
     * |-|-|
     * |ERROR_INVALID_PARAMETER|A zero value was passed in for the *flags* parameter.|
     */
    Call(flags, dynamicKeywordAddressData) {
        dynamicKeywordAddressDataMarshal := dynamicKeywordAddressData is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, UInt32, flags, dynamicKeywordAddressDataMarshal, dynamicKeywordAddressData, UInt32)
        return result
    }

    /**
     * A PFN_FWENUMDYNAMICKEYWORDADDRESSESBYTYPE0 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_FWENUMDYNAMICKEYWORDADDRESSESBYTYPE0 {
        /**
         * Creates a PFN_FWENUMDYNAMICKEYWORDADDRESSESBYTYPE0 pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "ptr*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "ptr*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}

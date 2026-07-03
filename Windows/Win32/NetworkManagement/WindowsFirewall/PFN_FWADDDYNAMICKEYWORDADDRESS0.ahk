#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FW_DYNAMIC_KEYWORD_ADDRESS0.ahk" { FW_DYNAMIC_KEYWORD_ADDRESS0 }

/**
 * Function pointer type of the entry point in the service that you call to add the specified dynamic keyword address.
 * @remarks
 * * If the **FW_DYNAMIC_KEYWORD_ADDRESS_FLAGS_AUTO_RESOLVE** flag is set, then:
 *   * the *addresses* must be NULL, and
 *   * the *keyword* field should be a string that can be resolved; that is, a FQDN or hostname.
 * * If the **FW_DYNAMIC_KEYWORD_ADDRESS_FLAGS_AUTO_RESOLVE** flag is *not* set, then the *addresses* field must be a comma-separated list of IP address tokens. Tokens can be individual IP addresses, ranges, or subnets. Valid token formats include:
 *   * A valid IPv4 address (for example, 10.0.0.10)
 *   * A valid IPv6 address (for example, 2620:1ec:c11::200)
 *   * An IPv4 address range in the format \<start address\>-\<end address\>, with no spaces included (for example, 10.0.0.0-10.0.0.255)
 *   * An IPv6 address range in the format \<start address\>-\<end address\>, with no spaces included (for example, 2001:db8:abcd:12::-2001:db8:abcd:12:ffff:ffff:ffff:ffff)
 *   * A valid IPv4 subnet specified using the network prefix notation (for example, 10.0.0.0/24)
 *   * A valid IPv6 subnet specified using the prefix length notation (for example, 2001:db8:abcd:0012::0/64)
 * * A dynamic keyword address persists across reboots. For the *AutoResolved* objects, the addresses are *not* persisted across boot cycles, and must be re-evaluated during the following boot cycle.
 * @see https://learn.microsoft.com/windows/win32/api/netfw/nc-netfw-pfn_fwadddynamickeywordaddress0
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct PFN_FWADDDYNAMICKEYWORDADDRESS0 {
    value : IntPtr

    __value {
        set {
            if (value is PFN_FWADDDYNAMICKEYWORDADDRESS0) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<FW_DYNAMIC_KEYWORD_ADDRESS0>} dynamicKeywordAddress Type: **const [PFW_DYNAMIC_KEYWORD_ADDRESS0](ns-netfw-fw_dynamic_keyword_address0.md)**
     * 
     * A pointer to a constant (populated) dynamic keyword address object.
     * @returns {Integer} Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * If the function succeeds (the object was successfully created and added), then it returns **ERROR_SUCCESS**. Otherwise, it returns one of the following values.
     * 
     * |Return value|Description|
     * |-|-|
     * |ERROR_ACCESS_DENIED|The caller doesn't have proper permissions to create this object.|
     * |ERROR_ALREADY_EXISTS|An object with the specified ID already exists on the system.|
     * |ERROR_INVALID_PARAMETER|Invalid [FW_DYNAMIC_KEYWORD_ADDRESS0](ns-netfw-fw_dynamic_keyword_address0.md). See [**Remarks**](#remarks) for valid usage.|
     */
    Call(dynamicKeywordAddress) {
        result := DllCall(this.value, FW_DYNAMIC_KEYWORD_ADDRESS0.Ptr, dynamicKeywordAddress, UInt32)
        return result
    }

    /**
     * A PFN_FWADDDYNAMICKEYWORDADDRESS0 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_FWADDDYNAMICKEYWORDADDRESS0 {
        /**
         * Creates a PFN_FWADDDYNAMICKEYWORDADDRESS0 pointer that invokes the given AHK function when called.
         * @param {Func(FW_DYNAMIC_KEYWORD_ADDRESS0) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FW_DYNAMIC_KEYWORD_ADDRESS0.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Function pointer type of the entry point in the service that you call to update the dynamic keyword address with the input ID.
 * @remarks
 * If *append* is **TRUE**, then the input addresses will be appended to the object's current list of addresses. If the input parameter is a duplicate of an address already set in the object, then it will be discarded, and **ERROR_SUCCESS** will be returned.
 * 
 * The firewall service treats an address as a duplicate if the address is exactly equivalent to a value in the dynamic keyword address's existing addresses field. Duplicate values are considered on an individual element basis, so an update with a list of IP addresses might have only a subset of duplicate input discarded. For example, if the dynamic keyword address object contains `127.0.0.0-127.0.0.255`, then any input of `127.0.0.0-127.0.0.255` or `127.0.0.0/24` would be discarded. However, an input such as `127.0.0.0-127.0.0.40` would not be discarded, since that is a subset, and not a direct duplicate.
 * 
 * If *append* is **FALSE**, then the object's current list of addresses will be overwritten by the input.
 * 
 * *Non-AutoResolve* objects that originated from MDM will result in **ERROR_ACCESS_DENIED**.
 * 
 * *Non-AutoResolve* objects that were locally created (through API or PowerShell) are updated via this API.
 * 
 * *AutoResolve* objects of any origin are updateable via this API.
 * 
 * To clear the addresses for an object, pass in NULL for the *updatedAddresses* value.
 * 
 * Valid format for the *updatedAddresses* parameter is a comma-separated list of IP address tokens. Tokens can be individual IP addresses, ranges, or subnets. Valid token formats include:
 *   * A valid IPv4 address (for example, 10.0.0.10)
 *   * A valid IPv6 address (for example, 2620:1ec:c11::200)
 *   * An IPv4 address range in the format \<start address\>-\<end address\>, with no spaces included (for example, 10.0.0.0-10.0.0.255)
 *   * An IPv6 address range in the format \<start address\>-\<end address\>, with no spaces included (for example, 2001:db8:abcd:12::-2001:db8:abcd:12:ffff:ffff:ffff:ffff)
 *   * A valid IPv4 subnet specified using the network prefix notation (for example, 10.0.0.0/24)
 *   * A valid IPv6 subnet specified using the prefix length notation (for example, 2001:db8:abcd:0012::0/64)
 * @see https://learn.microsoft.com/windows/win32/api/netfw/nc-netfw-pfn_fwupdatedynamickeywordaddress0
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct PFN_FWUPDATEDYNAMICKEYWORDADDRESS0 {
    value : IntPtr

    __value {
        set {
            if (value is PFN_FWUPDATEDYNAMICKEYWORDADDRESS0) {
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
     * The id of the dynamic keyword address object to update.
     * @param {PWSTR} updatedAddresses Type: **[PCWSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * A comma-separated list of IP addresses, subnets, or ranges to update the object with.
     * @param {BOOL} append Type: **[BOOL](/windows/win32/winprog/windows-data-types)**
     * 
     * Set to **TRUE**, and the *updatedAddresses* will be appended to the object's current list of addresses. Set to **FALSE**, and the *updatedAddresses* will replace the object's current list of addresses.
     * @returns {Integer} Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * If the function succeeds (the object was successfully updated), then it returns **ERROR_SUCCESS**. Otherwise, it returns one of the following values.
     * 
     * |Return value|Description|
     * |-|-|
     * |ERROR_ACCESS_DENIED|The caller doesn't have proper permissions to operate on the object with the specified ID. This error occurs when this API is called on *non-AutoResolve* objects managed by MDM.|
     * |ERROR_INVALID_PARAMETER|Common error conditions include: No object with the specified ID exists; the addresses are in an invalid format.|
     */
    Call(dynamicKeywordAddressId, updatedAddresses, append) {
        updatedAddresses := updatedAddresses is String ? StrPtr(updatedAddresses) : updatedAddresses

        result := DllCall(this.value, Guid, dynamicKeywordAddressId, "ptr", updatedAddresses, BOOL, append, UInt32)
        return result
    }

    /**
     * A PFN_FWUPDATEDYNAMICKEYWORDADDRESS0 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_FWUPDATEDYNAMICKEYWORDADDRESS0 {
        /**
         * Creates a PFN_FWUPDATEDYNAMICKEYWORDADDRESS0 pointer that invokes the given AHK function when called.
         * @param {Func(Guid, PWSTR, BOOL) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid, PWSTR, BOOL, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}

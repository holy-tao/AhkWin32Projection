#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/netfw/nc-netfw-pfn_fwupdatedynamickeywordaddress0
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class PFN_FWUPDATEDYNAMICKEYWORDADDRESS0 extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Guid} dynamicKeywordAddressId 
     * @param {PWSTR} updatedAddresses 
     * @param {BOOL} append 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(dynamicKeywordAddressId, updatedAddresses, append) {
        updatedAddresses := updatedAddresses is String ? StrPtr(updatedAddresses) : updatedAddresses

        result := ComCall(3, this, "ptr", dynamicKeywordAddressId, "ptr", updatedAddresses, "int", append, "uint")
        return result
    }
}

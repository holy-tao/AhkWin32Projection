#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/netfw/nc-netfw-pfn_fwadddynamickeywordaddress0
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class PFN_FWADDDYNAMICKEYWORDADDRESS0 extends IUnknown {

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
     * @param {Pointer<FW_DYNAMIC_KEYWORD_ADDRESS0>} dynamicKeywordAddress 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(dynamicKeywordAddress) {
        result := ComCall(3, this, "ptr", dynamicKeywordAddress, "uint")
        return result
    }
}

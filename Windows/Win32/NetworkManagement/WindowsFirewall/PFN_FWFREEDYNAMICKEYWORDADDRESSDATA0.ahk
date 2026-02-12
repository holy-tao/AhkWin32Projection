#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Function pointer type of the entry point in the service that you call to free dynamic keyword address data structs allocated by the service.
 * @remarks
 * You should call this function only on values returned by [FWEnumDynamicKeywordAddressById0](nc-netfw-pfn_fwenumdynamickeywordaddressbyid0.md) or [FWEnumDynamicKeywordAddressesByType0](nc-netfw-pfn_fwenumdynamickeywordaddressesbytype0.md).
 * @see https://learn.microsoft.com/windows/win32/api//content/netfw/nc-netfw-pfn_fwfreedynamickeywordaddressdata0
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class PFN_FWFREEDYNAMICKEYWORDADDRESSDATA0 extends IUnknown {

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
     * @param {Pointer<FW_DYNAMIC_KEYWORD_ADDRESS_DATA0>} dynamicKeywordAddressData 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(dynamicKeywordAddressData) {
        result := ComCall(3, this, "ptr", dynamicKeywordAddressData, "uint")
        return result
    }
}

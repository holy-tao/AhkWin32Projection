#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Function pointer type of the entry point in the service that you call to enumerate dynamic keyword addresses by type. You can request a particular subset of objects based on the enumeration flags passed in.
 * @remarks
 * You must free the address of the first returned object in the list (the head of the list) by calling [FWFreeDynamicKeywordAddressData0](nc-netfw-pfn_fwfreedynamickeywordaddressdata0.md).
 * @see https://learn.microsoft.com/windows/win32/api//content/netfw/nc-netfw-pfn_fwenumdynamickeywordaddressesbytype0
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class PFN_FWENUMDYNAMICKEYWORDADDRESSESBYTYPE0 extends IUnknown {

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
     * @param {Integer} flags 
     * @param {Pointer<Pointer<FW_DYNAMIC_KEYWORD_ADDRESS_DATA0>>} dynamicKeywordAddressData 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(flags, dynamicKeywordAddressData) {
        dynamicKeywordAddressDataMarshal := dynamicKeywordAddressData is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "uint", flags, dynamicKeywordAddressDataMarshal, dynamicKeywordAddressData, "uint")
        return result
    }
}

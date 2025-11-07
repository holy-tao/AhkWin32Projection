#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IFaxOutboundRoutingRule.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxOutboundRoutingRules interface describes a configuration collection that is used by a fax client application to manage the fax outbound routing rules.
 * @remarks
 * 
 * A default implementation of <b>IFaxOutboundRoutingRules</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutboundroutingrules">FaxOutboundRoutingRules</a> object.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxoutboundroutingrules
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxOutboundRoutingRules extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxOutboundRoutingRules
     * @type {Guid}
     */
    static IID => Guid("{dcefa1e7-ae7d-4ed6-8521-369edcca5120}")

    /**
     * The class identifier for FaxOutboundRoutingRules
     * @type {Guid}
     */
    static CLSID => Guid("{d385beca-e624-4473-bfaa-9f4000831f54}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "get_Item", "get_Count", "ItemByCountryAndArea", "RemoveByCountryAndArea", "Remove", "Add"]

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutingrules-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {IFaxOutboundRoutingRule} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutingrules-get_item
     */
    get_Item(lIndex) {
        result := ComCall(8, this, "int", lIndex, "ptr*", &pFaxOutboundRoutingRule := 0, "HRESULT")
        return IFaxOutboundRoutingRule(pFaxOutboundRoutingRule)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutingrules-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * 
     * @param {Integer} lCountryCode 
     * @param {Integer} lAreaCode 
     * @returns {IFaxOutboundRoutingRule} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutingrules-itembycountryandarea
     */
    ItemByCountryAndArea(lCountryCode, lAreaCode) {
        result := ComCall(10, this, "int", lCountryCode, "int", lAreaCode, "ptr*", &pFaxOutboundRoutingRule := 0, "HRESULT")
        return IFaxOutboundRoutingRule(pFaxOutboundRoutingRule)
    }

    /**
     * 
     * @param {Integer} lCountryCode 
     * @param {Integer} lAreaCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutingrules-removebycountryandarea
     */
    RemoveByCountryAndArea(lCountryCode, lAreaCode) {
        result := ComCall(11, this, "int", lCountryCode, "int", lAreaCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutingrules-remove
     */
    Remove(lIndex) {
        result := ComCall(12, this, "int", lIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lCountryCode 
     * @param {Integer} lAreaCode 
     * @param {VARIANT_BOOL} bUseDevice 
     * @param {BSTR} bstrGroupName 
     * @param {Integer} lDeviceId 
     * @returns {IFaxOutboundRoutingRule} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutingrules-add
     */
    Add(lCountryCode, lAreaCode, bUseDevice, bstrGroupName, lDeviceId) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(13, this, "int", lCountryCode, "int", lAreaCode, "short", bUseDevice, "ptr", bstrGroupName, "int", lDeviceId, "ptr*", &pFaxOutboundRoutingRule := 0, "HRESULT")
        return IFaxOutboundRoutingRule(pFaxOutboundRoutingRule)
    }
}

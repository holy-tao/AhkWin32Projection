#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    get__NewEnum(ppUnk) {
        result := ComCall(7, this, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<IFaxOutboundRoutingRule>} pFaxOutboundRoutingRule 
     * @returns {HRESULT} 
     */
    get_Item(lIndex, pFaxOutboundRoutingRule) {
        result := ComCall(8, this, "int", lIndex, "ptr", pFaxOutboundRoutingRule, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCount 
     * @returns {HRESULT} 
     */
    get_Count(plCount) {
        result := ComCall(9, this, "int*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lCountryCode 
     * @param {Integer} lAreaCode 
     * @param {Pointer<IFaxOutboundRoutingRule>} pFaxOutboundRoutingRule 
     * @returns {HRESULT} 
     */
    ItemByCountryAndArea(lCountryCode, lAreaCode, pFaxOutboundRoutingRule) {
        result := ComCall(10, this, "int", lCountryCode, "int", lAreaCode, "ptr", pFaxOutboundRoutingRule, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lCountryCode 
     * @param {Integer} lAreaCode 
     * @returns {HRESULT} 
     */
    RemoveByCountryAndArea(lCountryCode, lAreaCode) {
        result := ComCall(11, this, "int", lCountryCode, "int", lAreaCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {HRESULT} 
     */
    Remove(lIndex) {
        result := ComCall(12, this, "int", lIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lCountryCode 
     * @param {Integer} lAreaCode 
     * @param {VARIANT_BOOL} bUseDevice 
     * @param {BSTR} bstrGroupName 
     * @param {Integer} lDeviceId 
     * @param {Pointer<IFaxOutboundRoutingRule>} pFaxOutboundRoutingRule 
     * @returns {HRESULT} 
     */
    Add(lCountryCode, lAreaCode, bUseDevice, bstrGroupName, lDeviceId, pFaxOutboundRoutingRule) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(13, this, "int", lCountryCode, "int", lAreaCode, "short", bUseDevice, "ptr", bstrGroupName, "int", lDeviceId, "ptr", pFaxOutboundRoutingRule, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

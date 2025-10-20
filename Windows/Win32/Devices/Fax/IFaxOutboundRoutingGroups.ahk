#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxOutboundRoutingGroups interface describes a configuration collection used by a fax client application to manage the fax outbound routing groups, represented by IFaxOutboundRoutingGroup interfaces.
 * @remarks
 * 
  * A default implementation of <b>IFaxOutboundRoutingGroups</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutboundroutinggroups">FaxOutboundRoutingGroups</a> object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxoutboundroutinggroups
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxOutboundRoutingGroups extends IDispatch{
    /**
     * The interface identifier for IFaxOutboundRoutingGroups
     * @type {Guid}
     */
    static IID => Guid("{235cbef7-c2de-4bfd-b8da-75097c82c87f}")

    /**
     * The class identifier for FaxOutboundRoutingGroups
     * @type {Guid}
     */
    static CLSID => Guid("{ccbea1a5-e2b4-4b57-9421-b04b6289464b}")

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
     * @param {VARIANT} vIndex 
     * @param {Pointer<IFaxOutboundRoutingGroup>} pFaxOutboundRoutingGroup 
     * @returns {HRESULT} 
     */
    get_Item(vIndex, pFaxOutboundRoutingGroup) {
        result := ComCall(8, this, "ptr", vIndex, "ptr", pFaxOutboundRoutingGroup, "int")
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
     * @param {BSTR} bstrName 
     * @param {Pointer<IFaxOutboundRoutingGroup>} pFaxOutboundRoutingGroup 
     * @returns {HRESULT} 
     */
    Add(bstrName, pFaxOutboundRoutingGroup) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(10, this, "ptr", bstrName, "ptr", pFaxOutboundRoutingGroup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} vIndex 
     * @returns {HRESULT} 
     */
    Remove(vIndex) {
        result := ComCall(11, this, "ptr", vIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

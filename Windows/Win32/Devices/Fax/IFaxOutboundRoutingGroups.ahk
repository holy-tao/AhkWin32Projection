#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IFaxOutboundRoutingGroup.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "get_Item", "get_Count", "Add", "Remove"]

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutinggroups-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * 
     * @param {VARIANT} vIndex 
     * @returns {IFaxOutboundRoutingGroup} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutinggroups-get_item
     */
    get_Item(vIndex) {
        result := ComCall(8, this, "ptr", vIndex, "ptr*", &pFaxOutboundRoutingGroup := 0, "HRESULT")
        return IFaxOutboundRoutingGroup(pFaxOutboundRoutingGroup)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutinggroups-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {IFaxOutboundRoutingGroup} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutinggroups-add
     */
    Add(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(10, this, "ptr", bstrName, "ptr*", &pFaxOutboundRoutingGroup := 0, "HRESULT")
        return IFaxOutboundRoutingGroup(pFaxOutboundRoutingGroup)
    }

    /**
     * 
     * @param {VARIANT} vIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutinggroups-remove
     */
    Remove(vIndex) {
        result := ComCall(11, this, "ptr", vIndex, "HRESULT")
        return result
    }
}

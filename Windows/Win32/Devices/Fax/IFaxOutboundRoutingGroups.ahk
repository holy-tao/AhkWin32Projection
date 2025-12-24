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
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * The IFaxOutboundRoutingGroups::get__NewEnum method returns a reference to an enumerator object that you can use to iterate through the FaxOutboundRoutingGroups collection.
     * @returns {IUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * Receives an indirect pointer to the enumerator object's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface for this collection.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutboundroutinggroups-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * The IFaxOutboundRoutingGroups::get_Item method returns a IFaxOutboundRoutingGroup interface from the collection.
     * @param {VARIANT} vIndex Type: <b>VARIANT</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">Variant</a> that specifies the item to retrieve from the collection. 
     * 
     * 
     * 
     * 
     * If this parameter is type VT_I2 or VT_I4, the parameter specifies the index of the item to retrieve from the collection. The index is 1-based. If this parameter is type VT_BSTR, the parameter is a unique name that identifies the outbound routing group to retrieve. Other types are not supported.
     * @returns {IFaxOutboundRoutingGroup} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxoutboundroutinggroup">IFaxOutboundRoutingGroup</a>**</b>
     * 
     * An address of a pointer that receives the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxoutboundroutinggroup">IFaxOutboundRoutingGroup</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutboundroutinggroups-get_item
     */
    get_Item(vIndex) {
        result := ComCall(8, this, "ptr", vIndex, "ptr*", &pFaxOutboundRoutingGroup := 0, "HRESULT")
        return IFaxOutboundRoutingGroup(pFaxOutboundRoutingGroup)
    }

    /**
     * The Count property represents the number of objects in the FaxOutboundRoutingGroups collection. This is the total number of outbound routing groups associated with the fax server.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutboundroutinggroups-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * The IFaxOutboundRoutingGroups::Add method adds an outbound routing group to the collection represented by the IFaxOutboundRoutingGroups interface.
     * @param {BSTR} bstrName Type: <b>BSTR</b>
     * 
     * Null-terminated string that indicates the name of the group to add. Note that you cannot add the special <b>All Devices</b> routing group.
     * @returns {IFaxOutboundRoutingGroup} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxoutboundroutinggroup">IFaxOutboundRoutingGroup</a>**</b>
     * 
     * Address of a pointer that receives a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxoutboundroutinggroup">IFaxOutboundRoutingGroup</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutboundroutinggroups-add
     */
    Add(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(10, this, "ptr", bstrName, "ptr*", &pFaxOutboundRoutingGroup := 0, "HRESULT")
        return IFaxOutboundRoutingGroup(pFaxOutboundRoutingGroup)
    }

    /**
     * The Remove method removes an item from the FaxOutboundRoutingGroups collection.
     * @param {VARIANT} vIndex Type: <b>VARIANT</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">Variant</a> that specifies the item to remove from the collection.
     * 				
     * 
     * 
     * 
     * If this parameter is type VT_I2 or VT_I4, it specifies the index of the item to remove from the collection. Valid values for this parameter are in the range from 1 to n, where n is the number of objects returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutboundroutinggroups-count-vb">IFaxOutboundRoutingGroups::get_Count</a> method. The index is 1-based. If this parameter is type VT_BSTR, the parameter is a unique name that identifies the outbound routing group to remove. Other types are not supported.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutboundroutinggroups-remove
     */
    Remove(vIndex) {
        result := ComCall(11, this, "ptr", vIndex, "HRESULT")
        return result
    }
}

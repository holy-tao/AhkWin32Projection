#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IFaxOutboundRoutingGroup.ahk" { IFaxOutboundRoutingGroup }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IFaxOutboundRoutingGroups interface describes a configuration collection used by a fax client application to manage the fax outbound routing groups, represented by IFaxOutboundRoutingGroup interfaces.
 * @remarks
 * A default implementation of <b>IFaxOutboundRoutingGroups</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutboundroutinggroups">FaxOutboundRoutingGroups</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxoutboundroutinggroups
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxOutboundRoutingGroups extends IDispatch {
    /**
     * The interface identifier for IFaxOutboundRoutingGroups
     * @type {Guid}
     */
    static IID := Guid("{235cbef7-c2de-4bfd-b8da-75097c82c87f}")

    /**
     * The class identifier for FaxOutboundRoutingGroups
     * @type {Guid}
     */
    static CLSID := Guid("{ccbea1a5-e2b4-4b57-9421-b04b6289464b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxOutboundRoutingGroups interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get__NewEnum : IntPtr
        get_Item     : IntPtr
        get_Count    : IntPtr
        Add          : IntPtr
        Remove       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxOutboundRoutingGroups.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutinggroups-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * The IFaxOutboundRoutingGroups::get_Item method returns a IFaxOutboundRoutingGroup interface from the collection.
     * @remarks
     * To return the group consisting of all of the devices, set <i>vIndex</i> equal to the constant <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-bstrgroupname-alldevices">bstrGROUPNAME_ALLDEVICES</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutinggroups-get_item
     */
    get_Item(vIndex) {
        result := ComCall(8, this, VARIANT, vIndex, "ptr*", &pFaxOutboundRoutingGroup := 0, "HRESULT")
        return IFaxOutboundRoutingGroup(pFaxOutboundRoutingGroup)
    }

    /**
     * The Count property represents the number of objects in the FaxOutboundRoutingGroups collection. This is the total number of outbound routing groups associated with the fax server.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutinggroups-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * The IFaxOutboundRoutingGroups::Add method adds an outbound routing group to the collection represented by the IFaxOutboundRoutingGroups interface.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farMANAGE_CONFIG</a> access right.
     * @param {BSTR} bstrName Type: <b>BSTR</b>
     * 
     * Null-terminated string that indicates the name of the group to add. Note that you cannot add the special <b>All Devices</b> routing group.
     * @returns {IFaxOutboundRoutingGroup} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxoutboundroutinggroup">IFaxOutboundRoutingGroup</a>**</b>
     * 
     * Address of a pointer that receives a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxoutboundroutinggroup">IFaxOutboundRoutingGroup</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutinggroups-add
     */
    Add(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(10, this, BSTR, bstrName, "ptr*", &pFaxOutboundRoutingGroup := 0, "HRESULT")
        return IFaxOutboundRoutingGroup(pFaxOutboundRoutingGroup)
    }

    /**
     * The Remove method removes an item from the FaxOutboundRoutingGroups collection.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farMANAGE_CONFIG</a> access right.
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutinggroups-remove
     */
    Remove(vIndex) {
        result := ComCall(11, this, VARIANT, vIndex, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFaxOutboundRoutingGroups.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 3)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Remove)
    }
}

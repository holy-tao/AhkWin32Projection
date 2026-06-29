#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IFaxInboundRoutingMethod.ahk" { IFaxInboundRoutingMethod }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IFaxInboundRoutingMethods interface defines a configuration collection used by a fax client application to manage the ordered inbound fax routing methods.
 * @remarks
 * Each inbound routing method is represented by a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxinboundroutingmethod">IFaxInboundRoutingMethod</a> interface. The order of the routing methods in the collection determines the relative order in which the methods execute when an inbound fax requires routing.
 * 
 * A default implementation of <b>IFaxInboundRoutingMethods</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxinboundroutingmethods">FaxInboundRoutingMethods</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxinboundroutingmethods
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxInboundRoutingMethods extends IDispatch {
    /**
     * The interface identifier for IFaxInboundRoutingMethods
     * @type {Guid}
     */
    static IID := Guid("{783fca10-8908-4473-9d69-f67fbea0c6b9}")

    /**
     * The class identifier for FaxInboundRoutingMethods
     * @type {Guid}
     */
    static CLSID := Guid("{25fcb76a-b750-4b82-9266-fbbbae8922ba}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxInboundRoutingMethods interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get__NewEnum : IntPtr
        get_Item     : IntPtr
        get_Count    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxInboundRoutingMethods.Vtbl()
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
     * The IFaxInboundRoutingMethods::get__NewEnum method returns a reference to an enumerator object that you can use to iterate through the IFaxInboundRoutingMethods collection.
     * @remarks
     * In Microsoft Visual Basic, you do not need to use the <b>_NewEnum</b> property because it is automatically used in the implementation of <b>For Each ... Next</b>.
     * @returns {IUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * Address of a pointer to the enumerator object's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface for the collection.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingmethods-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * The IFaxInboundRoutingMethods::get_Item method returns a IFaxInboundRoutingMethod object from the IFaxInboundRoutingMethods collection.
     * @param {VARIANT} vIndex Type: <b>VARIANT</b>
     * 
     * <b>VARIANT</b> that specifies the item to retrieve from the collection. 
     * 
     *                     
     * 
     * If this parameter is type VT_I2 or VT_I4, the parameter specifies the index of the item to retrieve from the collection. The index is 1-based. If this parameter is type VT_BSTR, the parameter is a GUID that identifies the fax routing method to retrieve. Other types are not supported.
     * @returns {IFaxInboundRoutingMethod} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxinboundroutingmethod">IFaxInboundRoutingMethod</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxinboundroutingmethod">IFaxInboundRoutingMethod</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingmethods-get_item
     */
    get_Item(vIndex) {
        result := ComCall(8, this, VARIANT, vIndex, "ptr*", &pFaxInboundRoutingMethod := 0, "HRESULT")
        return IFaxInboundRoutingMethod(pFaxInboundRoutingMethod)
    }

    /**
     * The IFaxInboundRoutingMethods::get_Count property represents the number of objects in the IFaxInboundRoutingMethods collection. This is the total number of inbound routing methods associated with the fax server.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingmethods-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    Query(iid) {
        if (IFaxInboundRoutingMethods.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.get_Count)
    }
}

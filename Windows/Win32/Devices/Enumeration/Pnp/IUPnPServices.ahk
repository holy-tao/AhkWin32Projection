#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IUPnPService.ahk" { IUPnPService }

/**
 * The IUPnPServices interface enumerates a collection of services.
 * @see https://learn.microsoft.com/windows/win32/api/upnp/nn-upnp-iupnpservices
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 */
export default struct IUPnPServices extends IDispatch {
    /**
     * The interface identifier for IUPnPServices
     * @type {Guid}
     */
    static IID := Guid("{3f8c8e9e-9a7a-4dc8-bc41-ff31fa374956}")

    /**
     * The class identifier for UPnPServices
     * @type {Guid}
     */
    static CLSID := Guid("{c0bc4b4a-a406-4efc-932f-b8546b8100cc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUPnPServices interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count    : IntPtr
        get__NewEnum : IntPtr
        get_Item     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUPnPServices.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * The Count property specifies the number of services in the collection.
     * @returns {Integer} Receives a reference to the number of services in the collection.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpservices-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * The _NewEnum property specifies either the IEnumVARIANT or IEnumUnknown enumerator interface for the collection. (IUPnPServices.get__NewEnum)
     * @remarks
     * This property is not visible in Visual Basic; use the <b>for...each...next</b> programming construct instead.
     * @returns {IUnknown} Receives a reference to the enumerator interface.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpservices-get__newenum
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    /**
     * The Item property specifies the IUPnPService interface for a service, identified by the service ID, in the collection.
     * @param {BSTR} bstrServiceId Specifies a service in the collection.
     * @returns {IUPnPService} Receives a reference to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpservice">IUPnPService</a> interface for the specified service.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpservices-get_item
     */
    get_Item(bstrServiceId) {
        bstrServiceId := bstrServiceId is String ? BSTR.Alloc(bstrServiceId).Value : bstrServiceId

        result := ComCall(9, this, BSTR, bstrServiceId, "ptr*", &ppService := 0, "HRESULT")
        return IUPnPService(ppService)
    }

    Query(iid) {
        if (IUPnPServices.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.get_Item)
    }
}

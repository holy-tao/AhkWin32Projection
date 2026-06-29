#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IUPnPDevice.ahk" { IUPnPDevice }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IUPnPDevices interface enumerates a collection of devices.
 * @see https://learn.microsoft.com/windows/win32/api/upnp/nn-upnp-iupnpdevices
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 */
export default struct IUPnPDevices extends IDispatch {
    /**
     * The interface identifier for IUPnPDevices
     * @type {Guid}
     */
    static IID := Guid("{fdbc0c73-bda3-4c66-ac4f-f2d96fdad68c}")

    /**
     * The class identifier for UPnPDevices
     * @type {Guid}
     */
    static CLSID := Guid("{b9e84ffd-ad3c-40a4-b835-0882ebcbaaa8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUPnPDevices interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count    : IntPtr
        get__NewEnum : IntPtr
        get_Item     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUPnPDevices.Vtbl()
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
     * The Count property specifies the number of devices in the collection.
     * @returns {Integer} Receives a reference to the number of devices in the collection.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevices-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * The _NewEnum property specifies either the IEnumVARIANT or IEnumUnknown enumerator interface for the collection. (IUPnPDevices.get__NewEnum)
     * @remarks
     * This property is not visible in Visual Basic; use the <b>for...each...next</b> programming construct instead.
     * @returns {IUnknown} Receives a reference to the enumerator interface.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevices-get__newenum
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    /**
     * The Item property specifies the IUPnPDevice interface for a device, identified by the UDN, in the collection.
     * @param {BSTR} bstrUDN Specifies a device in the collection.
     * @returns {IUPnPDevice} Receives a reference to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnp/nn-upnp-iupnpdevice">IUPnPDevice</a> interface for the specified device.
     * @see https://learn.microsoft.com/windows/win32/api/upnp/nf-upnp-iupnpdevices-get_item
     */
    get_Item(bstrUDN) {
        bstrUDN := bstrUDN is String ? BSTR.Alloc(bstrUDN).Value : bstrUDN

        result := ComCall(9, this, BSTR, bstrUDN, "ptr*", &ppDevice := 0, "HRESULT")
        return IUPnPDevice(ppDevice)
    }

    Query(iid) {
        if (IUPnPDevices.IID.Equals(iid)) {
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

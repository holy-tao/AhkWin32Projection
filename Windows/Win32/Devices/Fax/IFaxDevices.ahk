#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFaxDevice.ahk" { IFaxDevice }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IFaxDevices interface defines a collection used by a fax client application to manage fax devices, where each device is represented by a FaxDevice object.
 * @remarks
 * A default implementation of <b>IFaxDevices</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevices">FaxDevices</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxdevices
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxDevices extends IDispatch {
    /**
     * The interface identifier for IFaxDevices
     * @type {Guid}
     */
    static IID := Guid("{9e46783e-f34f-482e-a360-0416becbbd96}")

    /**
     * The class identifier for FaxDevices
     * @type {Guid}
     */
    static CLSID := Guid("{5589e28e-23cb-4919-8808-e6101846e80d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxDevices interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get__NewEnum : IntPtr
        get_Item     : IntPtr
        get_Count    : IntPtr
        get_ItemById : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxDevices.Vtbl()
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
     * The IFaxDevices::get__NewEnum method returns a reference to an enumerator object that you can use to iterate through the FaxDevices collection.
     * @remarks
     * In Microsoft Visual Basic, you do not need to use the <b>_NewEnum</b> property, because it is automatically used in the implementation of <b>For Each ... Next</b>.
     * @returns {IUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * Receives an indirect pointer to the enumerator object's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface for the collection.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevices-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * The IFaxDevices::get_Item method returns a FaxDevice object from the FaxDevices collection, using its index.
     * @remarks
     * To retrieve an item from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevices">FaxDevices</a> collection using the device ID, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nf-faxcomex-ifaxdevices-get_itembyid">IFaxDevices::get_ItemById</a> property.
     * @param {VARIANT} vIndex Type: <b>VARIANT</b>
     * 
     * <b>VARIANT</b> that specifies the index of the item to retrieve from the fax device collection. If this parameter is type VT_I2 or VT_I4, the parameter specifies the index of the item to retrieve from the collection. Valid values for the index are in the range from 1 to n, where n is the number of devices returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevices-count-vb">IFaxDevices::get_Count</a> method. If this parameter is type VT_BSTR, the parameter is a string containing the unique name of the fax device to retrieve. Other types are not supported.
     * @returns {IFaxDevice} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxdevice">IFaxDevice</a>**</b>
     * 
     * Receives the address of a pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice">FaxDevice</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevices-get_item
     */
    get_Item(vIndex) {
        result := ComCall(8, this, VARIANT, vIndex, "ptr*", &pFaxDevice := 0, "HRESULT")
        return IFaxDevice(pFaxDevice)
    }

    /**
     * The IFaxDevices::get_Count property represents the number of objects in the FaxDevices collection. This is the total number of devices used by the fax server.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevices-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * The IFaxDevices::get_ItemById method returns a FaxDevice object from the FaxDevices collection, using its device ID.
     * @remarks
     * To retrieve an item from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevices">FaxDevices</a> collection using the device's index, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevices-item">Item</a> property.
     * @param {Integer} lId Type: <b>long</b>
     * 
     * The unique ID of the device to retrieve.
     * @returns {IFaxDevice} Type: <b>ppFaxDevice**</b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice">FaxDevice</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevices-get_itembyid
     */
    get_ItemById(lId) {
        result := ComCall(10, this, "int", lId, "ptr*", &ppFaxDevice := 0, "HRESULT")
        return IFaxDevice(ppFaxDevice)
    }

    Query(iid) {
        if (IFaxDevices.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get_ItemById := CallbackCreate(GetMethod(implObj, "get_ItemById"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get_ItemById)
    }
}

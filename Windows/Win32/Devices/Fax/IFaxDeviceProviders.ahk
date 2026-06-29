#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFaxDeviceProvider.ahk" { IFaxDeviceProvider }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IFaxDeviceProviders interface defines a configuration collection which contains the fax device providers on a connected fax server.
 * @remarks
 * A default implementation of <b>IFaxDeviceProviders</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdeviceproviders">FaxDeviceProviders</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxdeviceproviders
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxDeviceProviders extends IDispatch {
    /**
     * The interface identifier for IFaxDeviceProviders
     * @type {Guid}
     */
    static IID := Guid("{9fb76f62-4c7e-43a5-b6fd-502893f7e13e}")

    /**
     * The class identifier for FaxDeviceProviders
     * @type {Guid}
     */
    static CLSID := Guid("{eb8fe768-875a-4f5f-82c5-03f23aac1bd7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxDeviceProviders interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get__NewEnum : IntPtr
        get_Item     : IntPtr
        get_Count    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxDeviceProviders.Vtbl()
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
     * The IFaxDeviceProviders::get__NewEnum method returns a reference to an enumerator object that you can use to iterate through the FaxDeviceProviders collection.
     * @remarks
     * In Microsoft Visual Basic, you do not need to use the <b>_NewEnum</b> property, because it is automatically used in the implementation of <b>For Each ... Next</b>.
     * @returns {IUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * Receives an indirect pointer to the enumerator object's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface for the collection.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceproviders-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * The IFaxDeviceProviders::get_Item property returns a FaxDeviceProvider object from the FaxDeviceProviders collection.
     * @param {VARIANT} vIndex Type: <b>VARIANT</b>
     * 
     * <b>VARIANT</b> that specifies the item to retrieve from the collection.
     *                     
     *                     
     * 
     * If this parameter is type VT_I2 or VT_I4, the parameter specifies the index of the item to retrieve from the collection. The index is 1-based. If this parameter is type VT_BSTR, the parameter is the unique name that identifies the FSP to retrieve. Other types are not supported.
     * @returns {IFaxDeviceProvider} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxdeviceprovider">IFaxDeviceProvider</a>**</b>
     * 
     * Address of a pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxdeviceprovider">IFaxDeviceProvider</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceproviders-get_item
     */
    get_Item(vIndex) {
        result := ComCall(8, this, VARIANT, vIndex, "ptr*", &pFaxDeviceProvider := 0, "HRESULT")
        return IFaxDeviceProvider(pFaxDeviceProvider)
    }

    /**
     * The Count property represents the number of objects in the FaxDeviceProviders collection. This is the total number of fax device providers associated with the fax server.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceproviders-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    Query(iid) {
        if (IFaxDeviceProviders.IID.Equals(iid)) {
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

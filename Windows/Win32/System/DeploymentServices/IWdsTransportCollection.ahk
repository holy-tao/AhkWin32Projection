#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a collection of Windows Deployment Services (WDS) transport management objects.
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportcollection
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct IWdsTransportCollection extends IDispatch {
    /**
     * The interface identifier for IWdsTransportCollection
     * @type {Guid}
     */
    static IID := Guid("{b8ba4b1a-2ff4-43ab-996c-b2b10a91a6eb}")

    /**
     * The class identifier for WdsTransportCollection
     * @type {Guid}
     */
    static CLSID := Guid("{c7f18b09-391e-436e-b10b-c3ef46f2c34f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWdsTransportCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count    : IntPtr
        get_Item     : IntPtr
        get__NewEnum : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWdsTransportCollection.Vtbl()
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
     * Receives the number of objects in this collection.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcollection-get_count
     */
    get_Count() {
        result := ComCall(7, this, "uint*", &pulCount := 0, "HRESULT")
        return pulCount
    }

    /**
     * Receives a pointer to the object that matches the specified index.
     * @param {Integer} ulIndex 
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcollection-get_item
     */
    get_Item(ulIndex) {
        result := ComCall(8, this, "uint", ulIndex, "ptr*", &ppVal := 0, "HRESULT")
        return IDispatch(ppVal)
    }

    /**
     * Receives a pointer to an enumerator that can be used to iterate over the objects in this collection.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ppVal := 0, "HRESULT")
        return IUnknown(ppVal)
    }

    Query(iid) {
        if (IWdsTransportCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.get__NewEnum)
    }
}

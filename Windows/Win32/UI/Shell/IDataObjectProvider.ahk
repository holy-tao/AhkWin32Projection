#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDataObject.ahk" { IDataObject }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides methods that enable you to set or retrieve a DataPackage object's IDataObject interface, which the DataPackage uses to support interoperability. The DataPackage object is used by an app to provide data to another app.
 * @remarks
 * <h3><a id="When_to_implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to implement</h3>
 * Do not implement this interface. An implementation is provided as part of the DataPackage object.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-idataobjectprovider
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IDataObjectProvider extends IUnknown {
    /**
     * The interface identifier for IDataObjectProvider
     * @type {Guid}
     */
    static IID := Guid("{3d25f6d6-4b2a-433c-9184-7c33ad35d001}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDataObjectProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDataObject : IntPtr
        SetDataObject : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDataObjectProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets an IDataObject representation of the current DataPackage object.
     * @returns {IDataObject} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a>**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface pointer that, when this method returns successfully, points to the <b>IDataObject</b> representation of the <a href="https://docs.microsoft.com/uwp/api/Windows.ApplicationModel.DataTransfer.DataPackage">DataPackage</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idataobjectprovider-getdataobject
     */
    GetDataObject() {
        result := ComCall(3, this, "ptr*", &dataObject := 0, "HRESULT")
        return IDataObject(dataObject)
    }

    /**
     * Wraps an IDataObject instance as a Windows Runtime DataPackage.
     * @param {IDataObject} dataObject An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface pointer to the data object from which to build the DataPackage object.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idataobjectprovider-setdataobject
     */
    SetDataObject(dataObject) {
        result := ComCall(4, this, "ptr", dataObject, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDataObjectProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDataObject := CallbackCreate(GetMethod(implObj, "GetDataObject"), flags, 2)
        this.vtbl.SetDataObject := CallbackCreate(GetMethod(implObj, "SetDataObject"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDataObject)
        CallbackFree(this.vtbl.SetDataObject)
    }
}

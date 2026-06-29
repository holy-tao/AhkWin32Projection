#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPropertySheetCallback.ahk" { IPropertySheetCallback }
#Import "..\Com\IDataObject.ahk" { IDataObject }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables a snap-in component to add pages to the property sheet of an item.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-iextendpropertysheet
 * @namespace Windows.Win32.System.Mmc
 */
export default struct IExtendPropertySheet extends IUnknown {
    /**
     * The interface identifier for IExtendPropertySheet
     * @type {Guid}
     */
    static IID := Guid("{85de64dc-ef21-11cf-a285-00c04fd8dbe6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IExtendPropertySheet interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreatePropertyPages : IntPtr
        QueryPagesFor       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IExtendPropertySheet.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds pages to a property sheet.
     * @remarks
     * The IPropertySheetCallback interface is passed to the snap-in during a call to this method. The lifetime of this interface is under the control of MMC. As such, the pointer lpIDataObject is valid only during the lifetime of the immediate call to this method. Caching the lpIDataObject pointer value outside of the callback is not recommended.
     * 
     * The handle specified by the handle parameter must be saved in the property page object to notify the parent of property changes using the API function 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-mmcpropertychangenotify">MMCPropertyChangeNotify</a>.
     * 
     * If the snap-in returns a success code (S_OK, S_FALSE) from 
     * CreatePropertyPages, then the snap-in must call 
     * MMCFreeNotifyHandle. If the snap-in returns an error code, then MMC immediately frees the handle. For more information about when 
     * MMCFreeNotifyHandle should be called, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-mmcfreenotifyhandle">MMCFreeNotifyHandle</a>.
     * @param {IPropertySheetCallback} lpProvider A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-ipropertysheetcallback">IPropertySheetCallback</a> interface.
     * @param {Pointer} _handle A value that specifies the handle used to route the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-property-change">MMCN_PROPERTY_CHANGE</a> notification message to the appropriate 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icomponent">IComponent</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icomponentdata">IComponentData</a> interface.
     * 
     * For snap-ins that use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-ipropertysheetprovider">IPropertySheetProvider</a> interface directly, MMC creates the handle when the snap-in calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-ipropertysheetprovider-addprimarypages">IPropertySheetProvider::AddPrimaryPages</a> and specifies its bCreateHandle to be <b>TRUE</b>.
     * @param {IDataObject} lpIDataObject A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the object that contains context information about the scope or result item.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iextendpropertysheet-createpropertypages
     */
    CreatePropertyPages(lpProvider, _handle, lpIDataObject) {
        result := ComCall(3, this, "ptr", lpProvider, "ptr", _handle, "ptr", lpIDataObject, "HRESULT")
        return result
    }

    /**
     * Determines whether the object requires pages.
     * @remarks
     * The console calls this method to determine whether the 
     * <b>Properties</b> menu item should be added to the context menu.
     * @param {IDataObject} lpDataObject A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the object that contains context information about the scope or result item.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iextendpropertysheet-querypagesfor
     */
    QueryPagesFor(lpDataObject) {
        result := ComCall(4, this, "ptr", lpDataObject, "HRESULT")
        return result
    }

    Query(iid) {
        if (IExtendPropertySheet.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreatePropertyPages := CallbackCreate(GetMethod(implObj, "CreatePropertyPages"), flags, 4)
        this.vtbl.QueryPagesFor := CallbackCreate(GetMethod(implObj, "QueryPagesFor"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreatePropertyPages)
        CallbackFree(this.vtbl.QueryPagesFor)
    }
}

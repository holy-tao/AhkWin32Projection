#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\OPENQUERYWINDOW.ahk" { OPENQUERYWINDOW }
#Import "..\..\System\Com\IDataObject.ahk" { IDataObject }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Used to programmatically display the system-supplied directory service query dialog box.
 * @see https://learn.microsoft.com/windows/win32/api/cmnquery/nn-cmnquery-icommonquery
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct ICommonQuery extends IUnknown {
    /**
     * The interface identifier for ICommonQuery
     * @type {Guid}
     */
    static IID := Guid("{ab50dec0-6f1d-11d0-a1c4-00aa00c16e65}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICommonQuery interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OpenQueryWindow : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICommonQuery.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The ICommonQuery::OpenQueryWindow method displays the directory service query dialog. This method does not return until the dialog box has been closed by the user.
     * @param {HWND} hwndParent Contains the handle of the window to use as the parent to the query dialog box. This parameter can be <b>NULL</b> if no parent is specified.
     * @param {Pointer<OPENQUERYWINDOW>} pQueryWnd Address of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/cmnquery/ns-cmnquery-openquerywindow">OPENQUERYWINDOW</a> structure that defines the query to perform and the characteristics of the query dialog.
     * @returns {IDataObject} Address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface pointer that receives the results of the query. This parameter only receives valid data if this method returns <b>S_OK</b>. This <b>IDataObject</b> supports the following clipboard formats.
     * @see https://learn.microsoft.com/windows/win32/api/cmnquery/nf-cmnquery-icommonquery-openquerywindow
     */
    OpenQueryWindow(hwndParent, pQueryWnd) {
        result := ComCall(3, this, HWND, hwndParent, OPENQUERYWINDOW.Ptr, pQueryWnd, "ptr*", &ppDataObject := 0, "HRESULT")
        return IDataObject(ppDataObject)
    }

    Query(iid) {
        if (ICommonQuery.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OpenQueryWindow := CallbackCreate(GetMethod(implObj, "OpenQueryWindow"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OpenQueryWindow)
    }
}

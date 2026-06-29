#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDataObject.ahk" { IDataObject }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method that hosts an IFolderView object in a window.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-ifolderviewhost
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IFolderViewHost extends IUnknown {
    /**
     * The interface identifier for IFolderViewHost
     * @type {Guid}
     */
    static IID := Guid("{1ea58f02-d55a-411d-b09e-9e65ac21605b}")

    /**
     * The class identifier for FolderViewHost
     * @type {Guid}
     */
    static CLSID := Guid("{20b1cb23-6968-4eb9-b7d4-a66d00d07cee}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFolderViewHost interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFolderViewHost.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the object that hosts an IFolderView object.
     * @param {HWND} hwndParent Type: <b>HWND</b>
     * 
     * The handle of the window that contains the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nn-shobjidl-ifolderviewhost">IFolderViewHost</a> object.
     * @param {IDataObject} pdo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a>*</b>
     * 
     * The address of a pointer to a data object.
     * @param {Pointer<RECT>} prc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * The address of a pointer to a <b>RECT</b> structure that specifies the dimensions of the folder view.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ifolderviewhost-initialize
     */
    Initialize(hwndParent, pdo, prc) {
        result := ComCall(3, this, HWND, hwndParent, "ptr", pdo, RECT.Ptr, prc, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFolderViewHost.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
    }
}

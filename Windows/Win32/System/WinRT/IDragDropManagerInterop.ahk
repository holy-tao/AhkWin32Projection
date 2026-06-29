#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IInspectable.ahk" { IInspectable }

/**
 * Enables interoperability with a WinRT CoreDragDropManager object.
 * @see https://learn.microsoft.com/windows/win32/api/dragdropinterop/nn-dragdropinterop-idragdropmanagerinterop
 * @namespace Windows.Win32.System.WinRT
 */
export default struct IDragDropManagerInterop extends IInspectable {
    /**
     * The interface identifier for IDragDropManagerInterop
     * @type {Guid}
     */
    static IID := Guid("{5ad8cba7-4c01-4dac-9074-827894292d63}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDragDropManagerInterop interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        GetForWindow : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDragDropManagerInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a CoreDragDropManager object for the window of the active application.
     * @param {HWND} _hwnd Handle to the window of the active application.
     * @param {Pointer<Guid>} riid The GUID for the resource interface.
     * 
     * The REFIID, or GUID, of the interface to the resource can be obtained by using the __uuidof() macro. For example: 
     * 
     * `__uuidof(CoreDragDropManager)`
     * @returns {Pointer<Void>} Address of a pointer to a [CoreDragDropManager](/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.coredragdropmanager) object.
     * @see https://learn.microsoft.com/windows/win32/api/dragdropinterop/nf-dragdropinterop-idragdropmanagerinterop-getforwindow
     */
    GetForWindow(_hwnd, riid) {
        result := ComCall(6, this, HWND, _hwnd, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IDragDropManagerInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetForWindow := CallbackCreate(GetMethod(implObj, "GetForWindow"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetForWindow)
    }
}

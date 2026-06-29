#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDragSourceHelper.ahk" { IDragSourceHelper }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Exposes a method that adds functionality to IDragSourceHelper. This method sets the characteristics of a drag-and-drop operation over an IDragSourceHelper object.
 * @remarks
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-idragsourcehelper">IDragSourceHelper</a> interface, from which it inherits.
 * 
 * If you want to adjust the behavior of the drag image by calling <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-idragsourcehelper2-setflags">IDragSourceHelper2::SetFlags</a>, that call should be made before you call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-idragsourcehelper-initializefromwindow">InitializeFromWindow</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-idragsourcehelper-initializefrombitmap">InitializeFromBitmap</a>.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-idragsourcehelper2
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IDragSourceHelper2 extends IDragSourceHelper {
    /**
     * The interface identifier for IDragSourceHelper2
     * @type {Guid}
     */
    static IID := Guid("{83e07d0d-0c5f-4163-bf1a-60b274051e40}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDragSourceHelper2 interfaces
    */
    struct Vtbl extends IDragSourceHelper.Vtbl {
        SetFlags : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDragSourceHelper2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the characteristics of a drag-and-drop operation over an IDragSourceHelper object.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * The flags that determine the characteristics of a drag-and-drop operation over an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-idragsourcehelper">IDragSourceHelper</a> object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-idragsourcehelper2-setflags
     */
    SetFlags(dwFlags) {
        result := ComCall(5, this, "uint", dwFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDragSourceHelper2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetFlags := CallbackCreate(GetMethod(implObj, "SetFlags"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetFlags)
    }
}

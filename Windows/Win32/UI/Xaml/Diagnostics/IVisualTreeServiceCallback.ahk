#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\VisualElement.ahk" { VisualElement }
#Import ".\VisualMutationType.ahk" { VisualMutationType }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ParentChildRelation.ahk" { ParentChildRelation }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Communicates the state of the visual tree.
 * @see https://learn.microsoft.com/windows/win32/api/xamlom/nn-xamlom-ivisualtreeservicecallback
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 */
export default struct IVisualTreeServiceCallback extends IUnknown {
    /**
     * The interface identifier for IVisualTreeServiceCallback
     * @type {Guid}
     */
    static IID := Guid("{aa7a8931-80e4-4fec-8f3b-553f87b4966e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVisualTreeServiceCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnVisualTreeChange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVisualTreeServiceCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Communicates the state of the visual tree when it changes.
     * @param {ParentChildRelation} relation The association of  a parent object with a child object.
     * @param {VisualElement} element The XAML element in the visual tree.
     * @param {VisualMutationType} mutationType A value that indicates whether the change was an add or remove.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservicecallback-onvisualtreechange
     */
    OnVisualTreeChange(relation, element, mutationType) {
        result := ComCall(3, this, ParentChildRelation, relation, VisualElement, element, VisualMutationType, mutationType, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVisualTreeServiceCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnVisualTreeChange := CallbackCreate(GetMethod(implObj, "OnVisualTreeChange"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnVisualTreeChange)
    }
}

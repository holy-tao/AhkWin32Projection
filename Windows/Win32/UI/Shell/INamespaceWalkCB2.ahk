#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\INamespaceWalkCB.ahk" { INamespaceWalkCB }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Extends INamespaceWalkCB with a method that is required in order to complete a namespace walk. This method removes data collected during the walk.
 * @remarks
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-inamespacewalkcb">INamespaceWalkCB</a> interface, from which it inherits.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-inamespacewalkcb2
 * @namespace Windows.Win32.UI.Shell
 */
export default struct INamespaceWalkCB2 extends INamespaceWalkCB {
    /**
     * The interface identifier for INamespaceWalkCB2
     * @type {Guid}
     */
    static IID := Guid("{7ac7492b-c38e-438a-87db-68737844ff70}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INamespaceWalkCB2 interfaces
    */
    struct Vtbl extends INamespaceWalkCB.Vtbl {
        WalkComplete : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INamespaceWalkCB2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Removes data collected during a namespace walk.
     * @param {HRESULT} hr Type: <b>HRESULT</b>
     * 
     * The results of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-inamespacewalk-walk">Walk</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Always returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacewalkcb2-walkcomplete
     */
    WalkComplete(hr) {
        result := ComCall(7, this, "int", hr, "HRESULT")
        return result
    }

    Query(iid) {
        if (INamespaceWalkCB2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.WalkComplete := CallbackCreate(GetMethod(implObj, "WalkComplete"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.WalkComplete)
    }
}

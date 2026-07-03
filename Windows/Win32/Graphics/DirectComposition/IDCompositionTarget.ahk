#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDCompositionVisual.ahk" { IDCompositionVisual }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a binding between a Microsoft DirectComposition visual tree and a destination on top of which the visual tree should be composed.
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositiontarget
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct IDCompositionTarget extends IUnknown {
    /**
     * The interface identifier for IDCompositionTarget
     * @type {Guid}
     */
    static IID := Guid("{eacdd04c-117e-4e17-88f4-d1b12b0e3d89}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDCompositionTarget interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetRoot : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDCompositionTarget.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets a visual object as the new root object of a visual tree.
     * @remarks
     * A visual can be either the root of a single visual tree, or a child of another visual, but it cannot be both at the same time. This method fails if the <i>visual</i> parameter is already the root of another visual tree, or is a child of another visual.
     * 
     * If <i>visual</i> is NULL, the visual tree is empty. If there was a previous non-NULL root visual, that visual becomes available for use as the root of another visual tree, or as a child of another visual.
     * @param {IDCompositionVisual} visual Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionvisual">IDCompositionVisual</a>*</b>
     * 
     * The visual object that is the new root of this visual tree. This parameter can be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiontarget-setroot
     */
    SetRoot(visual) {
        result := ComCall(3, this, "ptr", visual, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDCompositionTarget.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetRoot := CallbackCreate(GetMethod(implObj, "SetRoot"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetRoot)
    }
}

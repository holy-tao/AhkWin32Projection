#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\UiaRect.ahk" { UiaRect }

/**
 * Provides Microsoft UI Automation accessibility information about a windowless rich edit control.
 * @see https://learn.microsoft.com/windows/win32/api/textserv/nn-textserv-irichedituiainformation
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IRichEditUiaInformation extends IUnknown {
    /**
     * The interface identifier for IRichEditUiaInformation
     * @type {Guid}
     */
    static IID := Guid("{23969a9d-8546-4032-a1bb-73750cbf3333}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRichEditUiaInformation interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetBoundaryRectangle : IntPtr
        IsVisible            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRichEditUiaInformation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the bounding rectangle of a windowless rich edit control.
     * @param {Pointer<UiaRect>} pUiaRect Type: <b>UiaRect*</b>
     * 
     * The bounding rectangle, in screen coordinates.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-irichedituiainformation-getboundaryrectangle
     */
    GetBoundaryRectangle(pUiaRect) {
        result := ComCall(3, this, UiaRect.Ptr, pUiaRect, "HRESULT")
        return result
    }

    /**
     * Indicates whether a windowless rich edit control is currently visible.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if the windowless rich edit control is visible, or S_FALSE otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-irichedituiainformation-isvisible
     */
    IsVisible() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRichEditUiaInformation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetBoundaryRectangle := CallbackCreate(GetMethod(implObj, "GetBoundaryRectangle"), flags, 2)
        this.vtbl.IsVisible := CallbackCreate(GetMethod(implObj, "IsVisible"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetBoundaryRectangle)
        CallbackFree(this.vtbl.IsVisible)
    }
}

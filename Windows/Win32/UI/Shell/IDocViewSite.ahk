#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Used as a site object by the IShellView interface.
 * @remarks
 * You can call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method on <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> to get a pointer to the <b>IDocViewSite</b> interface.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj/nn-shlobj-idocviewsite
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IDocViewSite extends IUnknown {
    /**
     * The interface identifier for IDocViewSite
     * @type {Guid}
     */
    static IID := Guid("{87d605e0-c511-11cf-89a9-00a0c9054129}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDocViewSite interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnSetTitle : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDocViewSite.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets or retrieves the title of the site object.
     * @param {Pointer<VARIANT>} pvTitle Type: <b>VARIANTARG*</b>
     * 
     * Specifies the view title.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-idocviewsite-onsettitle
     */
    OnSetTitle(pvTitle) {
        result := ComCall(3, this, VARIANT.Ptr, pvTitle, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDocViewSite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnSetTitle := CallbackCreate(GetMethod(implObj, "OnSetTitle"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnSetTitle)
    }
}

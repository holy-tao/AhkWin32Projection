#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\BANDINFOSFB.ahk" { BANDINFOSFB }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IShellFolder.ahk" { IShellFolder }

/**
 * IShellFolderBand may be altered or unavailable.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj/nn-shlobj-ishellfolderband
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellFolderBand extends IUnknown {
    /**
     * The interface identifier for IShellFolderBand
     * @type {Guid}
     */
    static IID := Guid("{7fe80cc8-c247-11d0-b93a-00a0c90312e1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellFolderBand interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InitializeSFB  : IntPtr
        SetBandInfoSFB : IntPtr
        GetBandInfoSFB : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellFolderBand.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes an IShellFolderBand object.
     * @param {IShellFolder} psf Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> object.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * A PIDL.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-ishellfolderband-initializesfb
     */
    InitializeSFB(psf, pidl) {
        result := ComCall(3, this, "ptr", psf, ITEMIDLIST.Ptr, pidl, "HRESULT")
        return result
    }

    /**
     * Uses the information in a BANDINFOSFB structure to set the band information for a IShellFolderBand object.
     * @param {Pointer<BANDINFOSFB>} pbi Type: <b>PBANDINFOSFB</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shlobj/ns-shlobj-bandinfosfb">BANDINFOSFB</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-ishellfolderband-setbandinfosfb
     */
    SetBandInfoSFB(pbi) {
        result := ComCall(4, this, BANDINFOSFB.Ptr, pbi, "HRESULT")
        return result
    }

    /**
     * Gets information concerning an IShellFolderBand object and places it in a BANDINFOSFB structure.
     * @param {Pointer<BANDINFOSFB>} pbi Type: <b>PBANDINFOSFB</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shlobj/ns-shlobj-bandinfosfb">BANDINFOSFB</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-ishellfolderband-getbandinfosfb
     */
    GetBandInfoSFB(pbi) {
        result := ComCall(5, this, BANDINFOSFB.Ptr, pbi, "HRESULT")
        return result
    }

    Query(iid) {
        if (IShellFolderBand.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitializeSFB := CallbackCreate(GetMethod(implObj, "InitializeSFB"), flags, 3)
        this.vtbl.SetBandInfoSFB := CallbackCreate(GetMethod(implObj, "SetBandInfoSFB"), flags, 2)
        this.vtbl.GetBandInfoSFB := CallbackCreate(GetMethod(implObj, "GetBandInfoSFB"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitializeSFB)
        CallbackFree(this.vtbl.SetBandInfoSFB)
        CallbackFree(this.vtbl.GetBandInfoSFB)
    }
}

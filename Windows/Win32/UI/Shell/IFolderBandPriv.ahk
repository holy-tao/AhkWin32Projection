#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * IFolderBandPriv is available for use in the operating systems specified in the Requirements section. It may be altered or unavailable in subsequent versions.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-ifolderbandpriv
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IFolderBandPriv extends IUnknown {
    /**
     * The interface identifier for IFolderBandPriv
     * @type {Guid}
     */
    static IID := Guid("{47c01f95-e185-412c-b5c5-4f27df965aea}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFolderBandPriv interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetCascade      : IntPtr
        SetAccelerators : IntPtr
        SetNoIcons      : IntPtr
        SetNoText       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFolderBandPriv.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets a cascade folder.
     * @param {BOOL} fCascade Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to enable cascade folders; <b>FALSE</b> to disable them.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Always returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ifolderbandpriv-setcascade
     */
    SetCascade(fCascade) {
        result := ComCall(3, this, BOOL, fCascade, "HRESULT")
        return result
    }

    /**
     * Sets accelerators.
     * @param {BOOL} fAccelerators Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to enable accelerators; <b>FALSE</b> to disable them.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Always returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ifolderbandpriv-setaccelerators
     */
    SetAccelerators(fAccelerators) {
        result := ComCall(4, this, BOOL, fAccelerators, "HRESULT")
        return result
    }

    /**
     * Sets whether icons are displayed in a folder band.
     * @param {BOOL} fNoIcons Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to display icons; otherwise, <b>FALSE</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Always returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ifolderbandpriv-setnoicons
     */
    SetNoIcons(fNoIcons) {
        result := ComCall(5, this, BOOL, fNoIcons, "HRESULT")
        return result
    }

    /**
     * Sets whether text is displayed in a folder band.
     * @param {BOOL} fNoText Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to display text; otherwise, <b>FALSE</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Always returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ifolderbandpriv-setnotext
     */
    SetNoText(fNoText) {
        result := ComCall(6, this, BOOL, fNoText, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFolderBandPriv.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetCascade := CallbackCreate(GetMethod(implObj, "SetCascade"), flags, 2)
        this.vtbl.SetAccelerators := CallbackCreate(GetMethod(implObj, "SetAccelerators"), flags, 2)
        this.vtbl.SetNoIcons := CallbackCreate(GetMethod(implObj, "SetNoIcons"), flags, 2)
        this.vtbl.SetNoText := CallbackCreate(GetMethod(implObj, "SetNoText"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetCascade)
        CallbackFree(this.vtbl.SetAccelerators)
        CallbackFree(this.vtbl.SetNoIcons)
        CallbackFree(this.vtbl.SetNoText)
    }
}

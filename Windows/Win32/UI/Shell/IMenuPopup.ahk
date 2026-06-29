#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import ".\IDeskBar.ahk" { IDeskBar }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * IMenuPopup may be altered or unavailable.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-imenupopup
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IMenuPopup extends IDeskBar {
    /**
     * The interface identifier for IMenuPopup
     * @type {Guid}
     */
    static IID := Guid("{d1e7afeb-6a2e-11d0-8c78-00c04fd918b4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMenuPopup interfaces
    */
    struct Vtbl extends IDeskBar.Vtbl {
        Popup      : IntPtr
        OnSelect   : IntPtr
        SetSubMenu : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMenuPopup.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Invokes the shortcut menu at a specified onscreen location.
     * @param {Pointer<POINTL>} ppt Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a> structure that specifies the location of the pop-up menu in screen coordinates. The pop-up menu is displayed in relation to this point as determined by the position flags set in <i>dwFlags</i>.
     * @param {Pointer<RECTL>} prcExclude Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-rectl">RECTL</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-rectl">RECTL</a> structure that specifies the rectangle to exclude when positioning the menu. In Windows Vista, the alignment of the menu in relation to this area is determined by the alignment flags set in <i>dwFlags</i>. This parameter can be <b>NULL</b> to include the entire screen.
     * @param {Integer} dwFlags Type: <b>MP_POPUPFLAGS</b>
     * 
     * One or more of the following constants that control the display of the pop-up menu.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if the object implements the pop-up menu as a modeless menu. Otherwise, returns <b>S_FALSE</b>, which indicates the end of the implementation for the menu.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-imenupopup-popup
     */
    Popup(ppt, prcExclude, dwFlags) {
        result := ComCall(8, this, POINTL.Ptr, ppt, RECTL.Ptr, prcExclude, "int", dwFlags, "HRESULT")
        return result
    }

    /**
     * Handles selection notifications.
     * @param {Integer} dwSelectType Type: <b>DWORD</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Always returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-imenupopup-onselect
     */
    OnSelect(dwSelectType) {
        result := ComCall(9, this, "uint", dwSelectType, "HRESULT")
        return result
    }

    /**
     * Sets the given menu bar interface to be the submenu of the calling application object's interface.
     * @param {IMenuPopup} pmp Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-imenupopup">IMenuPopup</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-imenupopup">IMenuPopup</a> interface that specifies the menu bar of interest.
     * @param {BOOL} fSet Type: <b>BOOL</b>
     * 
     * Removes the submenu if <i>fSet</i> is set to <b>FALSE</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Always returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-imenupopup-setsubmenu
     */
    SetSubMenu(pmp, fSet) {
        result := ComCall(10, this, "ptr", pmp, BOOL, fSet, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMenuPopup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Popup := CallbackCreate(GetMethod(implObj, "Popup"), flags, 4)
        this.vtbl.OnSelect := CallbackCreate(GetMethod(implObj, "OnSelect"), flags, 2)
        this.vtbl.SetSubMenu := CallbackCreate(GetMethod(implObj, "SetSubMenu"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Popup)
        CallbackFree(this.vtbl.OnSelect)
        CallbackFree(this.vtbl.SetSubMenu)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\IShellMenu.ahk" { IShellMenu }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that extend the IShellMenu interface by providing the ability to coordinate toolbar buttons with a menu as well as display a pop-up menu.
 * @remarks
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellmenu">IShellMenu</a> interface, from which it inherits.
 * 
 * This interface is implemented by the track Shell menu object. You can obtain that object by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> with a class identifier (CLSID) of <c>CLSID_TrackShellMenu</c>. You can obtain interface pointers using standard Component Object Model (COM) procedures. The value of CLSID_TrackShellMenu is {8278F931-2A3E-11d2-838F-00C04FD918D0}.
 * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nn-shdeprecated-itrackshellmenu
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ITrackShellMenu extends IShellMenu {
    /**
     * The interface identifier for ITrackShellMenu
     * @type {Guid}
     */
    static IID := Guid("{8278f932-2a3e-11d2-838f-00c04fd918d0}")

    /**
     * The class identifier for TrackShellMenu
     * @type {Guid}
     */
    static CLSID := Guid("{8278f931-2a3e-11d2-838f-00c04fd918d0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITrackShellMenu interfaces
    */
    struct Vtbl extends IShellMenu.Vtbl {
        SetObscured : IntPtr
        Popup       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITrackShellMenu.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Coordinates obscured items on a toolbar with items in a menu.
     * @remarks
     * Obscured buttons are those buttons that cannot be displayed due to toolbar size limitations. Commonly, to see them you must press the chevron at the end of the toolbar.
     * @param {HWND} hwndTB Type: <b>HWND</b>
     * 
     * A handle to a toolbar control whose buttons have command IDs that correspond to menu IDs in the tracked menu.
     * @param {IUnknown} punkBand Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * If this parameter points to a COM object that supports the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellmenu">IShellMenu</a> interface, menu items that correspond to visible toolbar buttons are filtered out of the menu so that they do not appear in both places. 
     *                 
     *                     
     * 
     * If this parameter is <b>NULL</b> or points to a COM object that does not support the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellmenu">IShellMenu</a> interface, then the obscured buttons in the toolbar are added to the shell menu in the position specified in <i>dwSMSetFlags</i>.
     * @param {Integer} dwSMSetFlags Type: <b>DWORD</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-itrackshellmenu-setobscured
     */
    SetObscured(hwndTB, punkBand, dwSMSetFlags) {
        result := ComCall(12, this, HWND, hwndTB, "ptr", punkBand, "uint", dwSMSetFlags, "HRESULT")
        return result
    }

    /**
     * Displays a modal pop-up menu at a specific location.
     * @param {HWND} _hwnd Type: <b>HWND</b>
     * 
     * The handle of the parent window of the pop-up menu.
     * @param {Pointer<POINTL>} ppt Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a> structure that specifies an initial point in screen coordinates. The pop-up menu is displayed in relation to this point as determined by the position flags set in <i>dwFlags</i>.
     * @param {Pointer<RECTL>} prcExclude Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-rectl">RECTL</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-rectl">RECTL</a> structure that specifies the rectangle to exclude when positioning the menu. The alignment of the menu in relation to this area is determined by the alignment flags set in <i>dwFlags</i>. This parameter can be set to <b>NULL</b>.
     * @param {Integer} dwFlags Type: <b>MP_POPUPFLAGS</b>
     * 
     * One or more of the <a href="https://docs.microsoft.com/windows/desktop/shell/mp-popupflags">MP_POPUPFLAGS</a> constants that specify options involved in the display of the pop-up menu.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-itrackshellmenu-popup
     */
    Popup(_hwnd, ppt, prcExclude, dwFlags) {
        result := ComCall(13, this, HWND, _hwnd, POINTL.Ptr, ppt, RECTL.Ptr, prcExclude, "int", dwFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITrackShellMenu.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetObscured := CallbackCreate(GetMethod(implObj, "SetObscured"), flags, 4)
        this.vtbl.Popup := CallbackCreate(GetMethod(implObj, "Popup"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetObscured)
        CallbackFree(this.vtbl.Popup)
    }
}

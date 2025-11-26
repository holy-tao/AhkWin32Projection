#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDeskBar.ahk

/**
 * IMenuPopup may be altered or unavailable.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-imenupopup
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IMenuPopup extends IDeskBar{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMenuPopup
     * @type {Guid}
     */
    static IID => Guid("{d1e7afeb-6a2e-11d0-8c78-00c04fd918b4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Popup", "OnSelect", "SetSubMenu"]

    /**
     * Invokes the shortcut menu at a specified onscreen location.
     * @param {Pointer<POINTL>} ppt Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162807(v=vs.85)">POINTL</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162807(v=vs.85)">POINTL</a> structure that specifies the location of the pop-up menu in screen coordinates. The pop-up menu is displayed in relation to this point as determined by the position flags set in <i>dwFlags</i>.
     * @param {Pointer<RECTL>} prcExclude Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162907(v=vs.85)">RECTL</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162907(v=vs.85)">RECTL</a> structure that specifies the rectangle to exclude when positioning the menu. In Windows Vista, the alignment of the menu in relation to this area is determined by the alignment flags set in <i>dwFlags</i>. This parameter can be <b>NULL</b> to include the entire screen.
     * @param {Integer} dwFlags Type: <b>MP_POPUPFLAGS</b>
     * 
     * One or more of the following constants that control the display of the pop-up menu.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if the object implements the pop-up menu as a modeless menu. Otherwise, returns <b>S_FALSE</b>, which indicates the end of the implementation for the menu.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-imenupopup-popup
     */
    Popup(ppt, prcExclude, dwFlags) {
        result := ComCall(8, this, "ptr", ppt, "ptr", prcExclude, "int", dwFlags, "HRESULT")
        return result
    }

    /**
     * Handles selection notifications.
     * @param {Integer} dwSelectType Type: <b>DWORD</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Always returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-imenupopup-onselect
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
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-imenupopup-setsubmenu
     */
    SetSubMenu(pmp, fSet) {
        result := ComCall(10, this, "ptr", pmp, "int", fSet, "HRESULT")
        return result
    }
}

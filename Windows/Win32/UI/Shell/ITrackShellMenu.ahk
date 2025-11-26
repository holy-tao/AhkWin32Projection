#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IShellMenu.ahk

/**
 * Exposes methods that extend the IShellMenu interface by providing the ability to coordinate toolbar buttons with a menu as well as display a pop-up menu.
 * @remarks
 * 
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellmenu">IShellMenu</a> interface, from which it inherits.
 * 
 * This interface is implemented by the track Shell menu object. You can obtain that object by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> with a class identifier (CLSID) of <c>CLSID_TrackShellMenu</c>. You can obtain interface pointers using standard Component Object Model (COM) procedures. The value of CLSID_TrackShellMenu is {8278F931-2A3E-11d2-838F-00C04FD918D0}.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nn-shdeprecated-itrackshellmenu
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ITrackShellMenu extends IShellMenu{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITrackShellMenu
     * @type {Guid}
     */
    static IID => Guid("{8278f932-2a3e-11d2-838f-00c04fd918d0}")

    /**
     * The class identifier for TrackShellMenu
     * @type {Guid}
     */
    static CLSID => Guid("{8278f931-2a3e-11d2-838f-00c04fd918d0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetObscured", "Popup"]

    /**
     * Coordinates obscured items on a toolbar with items in a menu.
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-itrackshellmenu-setobscured
     */
    SetObscured(hwndTB, punkBand, dwSMSetFlags) {
        hwndTB := hwndTB is Win32Handle ? NumGet(hwndTB, "ptr") : hwndTB

        result := ComCall(12, this, "ptr", hwndTB, "ptr", punkBand, "uint", dwSMSetFlags, "HRESULT")
        return result
    }

    /**
     * Displays a modal pop-up menu at a specific location.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * The handle of the parent window of the pop-up menu.
     * @param {Pointer<POINTL>} ppt Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162807(v=vs.85)">POINTL</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162807(v=vs.85)">POINTL</a> structure that specifies an initial point in screen coordinates. The pop-up menu is displayed in relation to this point as determined by the position flags set in <i>dwFlags</i>.
     * @param {Pointer<RECTL>} prcExclude Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162907(v=vs.85)">RECTL</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162907(v=vs.85)">RECTL</a> structure that specifies the rectangle to exclude when positioning the menu. The alignment of the menu in relation to this area is determined by the alignment flags set in <i>dwFlags</i>. This parameter can be set to <b>NULL</b>.
     * @param {Integer} dwFlags Type: <b>MP_POPUPFLAGS</b>
     * 
     * One or more of the <a href="https://docs.microsoft.com/windows/desktop/shell/mp-popupflags">MP_POPUPFLAGS</a> constants that specify options involved in the display of the pop-up menu.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-itrackshellmenu-popup
     */
    Popup(hwnd, ppt, prcExclude, dwFlags) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(13, this, "ptr", hwnd, "ptr", ppt, "ptr", prcExclude, "int", dwFlags, "HRESULT")
        return result
    }
}

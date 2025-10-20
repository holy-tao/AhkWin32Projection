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
     * 
     * @param {HWND} hwndTB 
     * @param {Pointer<IUnknown>} punkBand 
     * @param {Integer} dwSMSetFlags 
     * @returns {HRESULT} 
     */
    SetObscured(hwndTB, punkBand, dwSMSetFlags) {
        hwndTB := hwndTB is Win32Handle ? NumGet(hwndTB, "ptr") : hwndTB

        result := ComCall(12, this, "ptr", hwndTB, "ptr", punkBand, "uint", dwSMSetFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Pointer<POINTL>} ppt 
     * @param {Pointer<RECTL>} prcExclude 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Popup(hwnd, ppt, prcExclude, dwFlags) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(13, this, "ptr", hwnd, "ptr", ppt, "ptr", prcExclude, "int", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

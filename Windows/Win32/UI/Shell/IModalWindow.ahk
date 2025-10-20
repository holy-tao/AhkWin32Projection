#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that represents a modal window. This interface is used in the Windows XP Passport Wizard.
 * @remarks
 * 
  * <b>IModalWindow</b>'s IID is IID_IModalWindow.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-imodalwindow
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IModalWindow extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IModalWindow
     * @type {Guid}
     */
    static IID => Guid("{b4db1657-70d7-485e-8e3e-6fcb5a5c1802}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Show"]

    /**
     * 
     * @param {HWND} hwndOwner 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-imodalwindow-show
     */
    Show(hwndOwner) {
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := ComCall(3, this, "ptr", hwndOwner, "HRESULT")
        return result
    }
}

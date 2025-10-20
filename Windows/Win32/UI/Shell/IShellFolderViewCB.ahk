#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that allows communication between Windows Explorer and a folder view implemented using the system folder view object (the IShellView object returned through SHCreateShellFolderView) so that the folder view can be notified of events and modify its view accordingly.
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nn-shlobj_core-ishellfolderviewcb
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellFolderViewCB extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellFolderViewCB
     * @type {Guid}
     */
    static IID => Guid("{2047e320-f2a9-11ce-ae65-08002b2e1262}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MessageSFVCB"]

    /**
     * 
     * @param {Integer} uMsg 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ishellfolderviewcb-messagesfvcb
     */
    MessageSFVCB(uMsg, wParam, lParam) {
        result := ComCall(3, this, "uint", uMsg, "ptr", wParam, "ptr", lParam, "HRESULT")
        return result
    }
}

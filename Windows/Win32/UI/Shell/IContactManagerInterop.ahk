#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables access to ContactManager methods in an app that manages multiple windows.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-icontactmanagerinterop
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IContactManagerInterop extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactManagerInterop
     * @type {Guid}
     */
    static IID => Guid("{99eacba7-e073-43b6-a896-55afe48a0833}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowContactCardForWindow"]

    /**
     * 
     * @param {HWND} appWindow 
     * @param {IUnknown} contact 
     * @param {Pointer<RECT>} selection 
     * @param {Integer} preferredPlacement 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icontactmanagerinterop-showcontactcardforwindow
     */
    ShowContactCardForWindow(appWindow, contact, selection, preferredPlacement) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(3, this, "ptr", appWindow, "ptr", contact, "ptr", selection, "int", preferredPlacement, "HRESULT")
        return result
    }
}

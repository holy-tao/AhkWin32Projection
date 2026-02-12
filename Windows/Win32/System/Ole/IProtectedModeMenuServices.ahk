#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\UI\WindowsAndMessaging\HMENU.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IProtectedModeMenuServices extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProtectedModeMenuServices
     * @type {Guid}
     */
    static IID => Guid("{73c105ee-9dff-4a07-b83c-7eff290c266e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateMenu", "LoadMenu", "LoadMenuID"]

    /**
     * Creates a menu. The menu is initially empty, but it can be filled with menu items by using the InsertMenuItem, AppendMenu, and InsertMenu functions.
     * @remarks
     * Resources associated with a menu that is assigned to a window are freed automatically. If the menu is not assigned to a window, an application must free system resources associated with the menu before closing. An application frees menu resources by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-destroymenu">DestroyMenu</a> function.
     * @returns {HMENU} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-createmenu
     */
    CreateMenu() {
        phMenu := HMENU()
        result := ComCall(3, this, "ptr", phMenu, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phMenu
    }

    /**
     * Loads the specified menu resource from the executable (.exe) file associated with an application instance. (Unicode)
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-destroymenu">DestroyMenu</a> function is used, before an application closes, to destroy the menu and free memory that the loaded menu occupied.
     * @param {PWSTR} pszModuleName 
     * @param {PWSTR} pszMenuName 
     * @returns {HMENU} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-loadmenuw
     */
    LoadMenu(pszModuleName, pszMenuName) {
        pszModuleName := pszModuleName is String ? StrPtr(pszModuleName) : pszModuleName
        pszMenuName := pszMenuName is String ? StrPtr(pszMenuName) : pszMenuName

        phMenu := HMENU()
        result := ComCall(4, this, "ptr", pszModuleName, "ptr", pszMenuName, "ptr", phMenu, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phMenu
    }

    /**
     * 
     * @param {PWSTR} pszModuleName 
     * @param {Integer} wResourceID 
     * @returns {HMENU} 
     */
    LoadMenuID(pszModuleName, wResourceID) {
        pszModuleName := pszModuleName is String ? StrPtr(pszModuleName) : pszModuleName

        phMenu := HMENU()
        result := ComCall(5, this, "ptr", pszModuleName, "ushort", wResourceID, "ptr", phMenu, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phMenu
    }
}

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
     * @returns {HMENU} 
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-createmenu
     */
    CreateMenu() {
        phMenu := HMENU()
        result := ComCall(3, this, "ptr", phMenu, "HRESULT")
        return phMenu
    }

    /**
     * 
     * @param {PWSTR} pszModuleName 
     * @param {PWSTR} pszMenuName 
     * @returns {HMENU} 
     */
    LoadMenu(pszModuleName, pszMenuName) {
        pszModuleName := pszModuleName is String ? StrPtr(pszModuleName) : pszModuleName
        pszMenuName := pszMenuName is String ? StrPtr(pszMenuName) : pszMenuName

        phMenu := HMENU()
        result := ComCall(4, this, "ptr", pszModuleName, "ptr", pszMenuName, "ptr", phMenu, "HRESULT")
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
        result := ComCall(5, this, "ptr", pszModuleName, "ushort", wResourceID, "ptr", phMenu, "HRESULT")
        return phMenu
    }
}

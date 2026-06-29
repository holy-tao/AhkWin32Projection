#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\UI\WindowsAndMessaging\HMENU.ahk" { HMENU }

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct IProtectedModeMenuServices extends IUnknown {
    /**
     * The interface identifier for IProtectedModeMenuServices
     * @type {Guid}
     */
    static IID := Guid("{73c105ee-9dff-4a07-b83c-7eff290c266e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProtectedModeMenuServices interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateMenu : IntPtr
        LoadMenu   : IntPtr
        LoadMenuID : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProtectedModeMenuServices.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a menu. The menu is initially empty, but it can be filled with menu items by using the InsertMenuItem, AppendMenu, and InsertMenu functions.
     * @remarks
     * Resources associated with a menu that is assigned to a window are freed automatically. If the menu is not assigned to a window, an application must free system resources associated with the menu before closing. An application frees menu resources by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-destroymenu">DestroyMenu</a> function.
     * @returns {HMENU} 
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-createmenu
     */
    CreateMenu() {
        phMenu := HMENU.Owned()
        result := ComCall(3, this, HMENU.Ptr, phMenu, "HRESULT")
        return phMenu
    }

    /**
     * Loads the specified menu resource from the executable (.exe) file associated with an application instance. (ANSI)
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-destroymenu">DestroyMenu</a> function is used, before an application closes, to destroy the menu and free memory that the loaded menu occupied.
     * @param {PWSTR} pszModuleName 
     * @param {PWSTR} pszMenuName 
     * @returns {HMENU} 
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-loadmenua
     */
    LoadMenu(pszModuleName, pszMenuName) {
        pszModuleName := pszModuleName is String ? StrPtr(pszModuleName) : pszModuleName
        pszMenuName := pszMenuName is String ? StrPtr(pszMenuName) : pszMenuName

        phMenu := HMENU.Owned()
        result := ComCall(4, this, "ptr", pszModuleName, "ptr", pszMenuName, HMENU.Ptr, phMenu, "HRESULT")
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

        phMenu := HMENU.Owned()
        result := ComCall(5, this, "ptr", pszModuleName, "ushort", wResourceID, HMENU.Ptr, phMenu, "HRESULT")
        return phMenu
    }

    Query(iid) {
        if (IProtectedModeMenuServices.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateMenu := CallbackCreate(GetMethod(implObj, "CreateMenu"), flags, 2)
        this.vtbl.LoadMenu := CallbackCreate(GetMethod(implObj, "LoadMenu"), flags, 4)
        this.vtbl.LoadMenuID := CallbackCreate(GetMethod(implObj, "LoadMenuID"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateMenu)
        CallbackFree(this.vtbl.LoadMenu)
        CallbackFree(this.vtbl.LoadMenuID)
    }
}

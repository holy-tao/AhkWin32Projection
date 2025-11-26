#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk
#Include .\MenuItem.ahk
#Include ..\Com\IDispatch.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/windowsribbon/windowsribbon-element-contextmenu
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class ContextMenu extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ContextMenu
     * @type {Guid}
     */
    static IID => Guid("{dab39ce0-25e6-4e07-8362-ba9c95706545}")

    /**
     * The class identifier for ContextMenu
     * @type {Guid}
     */
    static CLSID => Guid("{dab39ce0-25e6-4e07-8362-ba9c95706545}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "get_Item", "get_Count"]

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }

    /**
     * 
     * @param {VARIANT} IndexOrPath 
     * @returns {MenuItem} 
     */
    get_Item(IndexOrPath) {
        result := ComCall(8, this, "ptr", IndexOrPath, "ptr*", &MenuItem := 0, "HRESULT")
        return MenuItem(MenuItem)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(9, this, "int*", &Count := 0, "HRESULT")
        return Count
    }
}

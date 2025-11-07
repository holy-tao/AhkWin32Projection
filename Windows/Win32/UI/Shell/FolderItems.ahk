#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include .\FolderItem.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/shell/folderitems
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class FolderItems extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for FolderItems
     * @type {Guid}
     */
    static IID => Guid("{744129e0-cbe5-11ce-8350-444553540000}")

    /**
     * The class identifier for FolderItems
     * @type {Guid}
     */
    static CLSID => Guid("{744129e0-cbe5-11ce-8350-444553540000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get_Application", "get_Parent", "Item", "_NewEnum"]

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(7, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Application() {
        result := ComCall(8, this, "ptr*", &ppid := 0, "HRESULT")
        return IDispatch(ppid)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Parent() {
        result := ComCall(9, this, "ptr*", &ppid := 0, "HRESULT")
        return IDispatch(ppid)
    }

    /**
     * 
     * @param {VARIANT} index 
     * @returns {FolderItem} 
     * @see https://learn.microsoft.com/windows/win32/shell/folderitems-item
     */
    Item(index) {
        result := ComCall(10, this, "ptr", index, "ptr*", &ppid := 0, "HRESULT")
        return FolderItem(ppid)
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/shell/folderitems--newenum
     */
    _NewEnum() {
        result := ComCall(11, this, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }
}

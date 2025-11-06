#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include .\Folder.ahk
#Include .\FolderItems.ahk
#Include .\FolderItem.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/shell/folder
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class Folder extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for Folder
     * @type {Guid}
     */
    static IID => Guid("{bbcbde60-c3ff-11ce-8350-444553540000}")

    /**
     * The class identifier for Folder
     * @type {Guid}
     */
    static CLSID => Guid("{bbcbde60-c3ff-11ce-8350-444553540000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Title", "get_Application", "get_Parent", "get_ParentFolder", "Items", "ParseName", "NewFolder", "MoveHere", "CopyHere", "GetDetailsOf"]

    /**
     * 
     * @returns {BSTR} 
     */
    get_Title() {
        pbs := BSTR()
        result := ComCall(7, this, "ptr", pbs, "HRESULT")
        return pbs
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
     * @returns {Folder} 
     */
    get_ParentFolder() {
        result := ComCall(10, this, "ptr*", &ppsf := 0, "HRESULT")
        return Folder(ppsf)
    }

    /**
     * 
     * @returns {FolderItems} 
     * @see https://learn.microsoft.com/windows/win32/shell/folder-items
     */
    Items() {
        result := ComCall(11, this, "ptr*", &ppid := 0, "HRESULT")
        return FolderItems(ppid)
    }

    /**
     * 
     * @param {BSTR} bName 
     * @returns {FolderItem} 
     * @see https://learn.microsoft.com/windows/win32/shell/folder-parsename
     */
    ParseName(bName) {
        bName := bName is String ? BSTR.Alloc(bName).Value : bName

        result := ComCall(12, this, "ptr", bName, "ptr*", &ppid := 0, "HRESULT")
        return FolderItem(ppid)
    }

    /**
     * 
     * @param {BSTR} bName 
     * @param {VARIANT} vOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/folder-newfolder
     */
    NewFolder(bName, vOptions) {
        bName := bName is String ? BSTR.Alloc(bName).Value : bName

        result := ComCall(13, this, "ptr", bName, "ptr", vOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vItem 
     * @param {VARIANT} vOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/folder-movehere
     */
    MoveHere(vItem, vOptions) {
        result := ComCall(14, this, "ptr", vItem, "ptr", vOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vItem 
     * @param {VARIANT} vOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/folder-copyhere
     */
    CopyHere(vItem, vOptions) {
        result := ComCall(15, this, "ptr", vItem, "ptr", vOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vItem 
     * @param {Integer} iColumn 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/shell/folder-getdetailsof
     */
    GetDetailsOf(vItem, iColumn) {
        pbs := BSTR()
        result := ComCall(16, this, "ptr", vItem, "int", iColumn, "ptr", pbs, "HRESULT")
        return pbs
    }
}

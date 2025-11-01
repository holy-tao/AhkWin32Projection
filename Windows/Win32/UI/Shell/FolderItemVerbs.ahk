#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/shell/folderitemverbs
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class FolderItemVerbs extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for FolderItemVerbs
     * @type {Guid}
     */
    static IID => Guid("{1f8352c0-50b0-11cf-960c-0080c7f4ee85}")

    /**
     * The class identifier for FolderItemVerbs
     * @type {Guid}
     */
    static CLSID => Guid("{1f8352c0-50b0-11cf-960c-0080c7f4ee85}")

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
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     */
    get_Count(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppid 
     * @returns {HRESULT} 
     */
    get_Application(ppid) {
        result := ComCall(8, this, "ptr*", ppid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppid 
     * @returns {HRESULT} 
     */
    get_Parent(ppid) {
        result := ComCall(9, this, "ptr*", ppid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} index 
     * @param {Pointer<FolderItemVerb>} ppid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/folderitemverbs-item
     */
    Item(index, ppid) {
        result := ComCall(10, this, "ptr", index, "ptr*", ppid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppunk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/folderitemverbs--newenum
     */
    _NewEnum(ppunk) {
        result := ComCall(11, this, "ptr*", ppunk, "HRESULT")
        return result
    }
}

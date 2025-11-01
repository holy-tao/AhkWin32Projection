#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides information and control for a collection of folders that contain tasks.
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-itaskfoldercollection
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class ITaskFolderCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITaskFolderCollection
     * @type {Guid}
     */
    static IID => Guid("{79184a66-8664-423f-97f1-637356a5d812}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get_Item", "get__NewEnum"]

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskfoldercollection-get_count
     */
    get_Count(pCount) {
        pCountMarshal := pCount is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} index 
     * @param {Pointer<ITaskFolder>} ppFolder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskfoldercollection-get_item
     */
    get_Item(index, ppFolder) {
        result := ComCall(8, this, "ptr", index, "ptr*", ppFolder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskfoldercollection-get__newenum
     */
    get__NewEnum(ppEnum) {
        result := ComCall(9, this, "ptr*", ppEnum, "HRESULT")
        return result
    }
}

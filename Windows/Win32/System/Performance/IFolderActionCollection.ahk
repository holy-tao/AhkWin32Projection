#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Manages a collection of FolderAction objects.To get this interface, access the IDataManager::FolderActions property.
 * @remarks
 * 
  * You can add one or more <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ifolderaction">IFolderAction</a> instances. Each instance determines when a folder action occurs. For example, one instance  can trigger folder actions to occur at week one (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ifolderaction-get_age">IFolderAction::Age</a> is 7) and a second instance can trigger folder actions to occur at week 10 (<b>Age</b> is 10).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//pla/nn-pla-ifolderactioncollection
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class IFolderActionCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFolderActionCollection
     * @type {Guid}
     */
    static IID => Guid("{03837544-098b-11d8-9414-505054503030}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get_Item", "get__NewEnum", "Add", "Remove", "Clear", "AddRange", "CreateFolderAction"]

    /**
     * 
     * @param {Pointer<Integer>} Count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ifolderactioncollection-get_count
     */
    get_Count(Count) {
        CountMarshal := Count is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, CountMarshal, Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @param {Pointer<IFolderAction>} Action 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ifolderactioncollection-get_item
     */
    get_Item(Index, Action) {
        result := ComCall(8, this, "ptr", Index, "ptr*", Action, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} Enum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ifolderactioncollection-get__newenum
     */
    get__NewEnum(Enum) {
        result := ComCall(9, this, "ptr*", Enum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFolderAction} Action 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ifolderactioncollection-add
     */
    Add(Action) {
        result := ComCall(10, this, "ptr", Action, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ifolderactioncollection-remove
     */
    Remove(Index) {
        result := ComCall(11, this, "ptr", Index, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ifolderactioncollection-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFolderActionCollection} Actions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ifolderactioncollection-addrange
     */
    AddRange(Actions) {
        result := ComCall(13, this, "ptr", Actions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IFolderAction>} FolderAction 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ifolderactioncollection-createfolderaction
     */
    CreateFolderAction(FolderAction) {
        result := ComCall(14, this, "ptr*", FolderAction, "HRESULT")
        return result
    }
}

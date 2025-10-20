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
     * 
     * @param {Pointer<UInt32>} Count 
     * @returns {HRESULT} 
     */
    get_Count(Count) {
        result := ComCall(7, this, "uint*", Count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @param {Pointer<IFolderAction>} Action 
     * @returns {HRESULT} 
     */
    get_Item(Index, Action) {
        result := ComCall(8, this, "ptr", Index, "ptr", Action, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} Enum 
     * @returns {HRESULT} 
     */
    get__NewEnum(Enum) {
        result := ComCall(9, this, "ptr", Enum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFolderAction>} Action 
     * @returns {HRESULT} 
     */
    Add(Action) {
        result := ComCall(10, this, "ptr", Action, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} Index 
     * @returns {HRESULT} 
     */
    Remove(Index) {
        result := ComCall(11, this, "ptr", Index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Clear() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFolderActionCollection>} Actions 
     * @returns {HRESULT} 
     */
    AddRange(Actions) {
        result := ComCall(13, this, "ptr", Actions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFolderAction>} FolderAction 
     * @returns {HRESULT} 
     */
    CreateFolderAction(FolderAction) {
        result := ComCall(14, this, "ptr", FolderAction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

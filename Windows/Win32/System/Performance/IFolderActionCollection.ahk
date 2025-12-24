#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFolderAction.ahk
#Include ..\Com\IUnknown.ahk
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
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * Retrieves the number of folder actions in the collection.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ifolderactioncollection-get_count
     */
    get_Count() {
        result := ComCall(7, this, "uint*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * Retrieves the requested folder action from the collection.
     * @remarks
     * 
     * This property is the object's default property.
     * 
     * 
     * @param {VARIANT} Index 
     * @returns {IFolderAction} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ifolderactioncollection-get_item
     */
    get_Item(Index) {
        result := ComCall(8, this, "ptr", Index, "ptr*", &Action := 0, "HRESULT")
        return IFolderAction(Action)
    }

    /**
     * Retrieves an interface to the enumeration.
     * @remarks
     * 
     * C++ programmers use this property.
     * 
     * The enumeration is a snapshot of the collection at the time of the call.
     * 
     * The items of the enumeration are variants whose type is VT_UNKNOWN. To query for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ifolderaction">IFolderAction</a> interface, use the <b>punkVal</b> member of the variant.
     * 
     * 
     * @returns {IUnknown} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ifolderactioncollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &Enum := 0, "HRESULT")
        return IUnknown(Enum)
    }

    /**
     * Adds a folder action to the collection.
     * @param {IFolderAction} Action An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ifolderaction">IFolderAction</a> interface of the action to add to the collection.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ifolderactioncollection-add
     */
    Add(Action) {
        result := ComCall(10, this, "ptr", Action, "HRESULT")
        return result
    }

    /**
     * Removes a folder action from the collection based on the specified index.
     * @param {VARIANT} Index The zero-based index of the folder action to remove from the collection. The variant type can be VT_I4, VT_UI4, or VT_DISPATCH.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ifolderactioncollection-remove
     */
    Remove(Index) {
        result := ComCall(11, this, "ptr", Index, "HRESULT")
        return result
    }

    /**
     * Removes all folder actions from the collection.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ifolderactioncollection-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Adds one or more folder actions to the collection.
     * @param {IFolderActionCollection} Actions An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ifolderactioncollection">IFolderActionCollection</a> interface to a collection of one or more folder actions to add to this collection.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ifolderactioncollection-addrange
     */
    AddRange(Actions) {
        result := ComCall(13, this, "ptr", Actions, "HRESULT")
        return result
    }

    /**
     * Creates a folder action object.
     * @returns {IFolderAction} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ifolderaction">IFolderAction</a> interface that you use to describe the action to be taken by the data manager.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-ifolderactioncollection-createfolderaction
     */
    CreateFolderAction() {
        result := ComCall(14, this, "ptr*", &FolderAction := 0, "HRESULT")
        return IFolderAction(FolderAction)
    }
}

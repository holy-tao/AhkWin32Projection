#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IFolderAction.ahk" { IFolderAction }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Manages a collection of FolderAction objects.To get this interface, access the IDataManager::FolderActions property.
 * @remarks
 * You can add one or more <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ifolderaction">IFolderAction</a> instances. Each instance determines when a folder action occurs. For example, one instance  can trigger folder actions to occur at week one (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ifolderaction-get_age">IFolderAction::Age</a> is 7) and a second instance can trigger folder actions to occur at week 10 (<b>Age</b> is 10).
 * @see https://learn.microsoft.com/windows/win32/api/pla/nn-pla-ifolderactioncollection
 * @namespace Windows.Win32.System.Performance
 */
export default struct IFolderActionCollection extends IDispatch {
    /**
     * The interface identifier for IFolderActionCollection
     * @type {Guid}
     */
    static IID := Guid("{03837544-098b-11d8-9414-505054503030}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFolderActionCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count          : IntPtr
        get_Item           : IntPtr
        get__NewEnum       : IntPtr
        Add                : IntPtr
        Remove             : IntPtr
        Clear              : IntPtr
        AddRange           : IntPtr
        CreateFolderAction : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFolderActionCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ifolderactioncollection-get_count
     */
    get_Count() {
        result := ComCall(7, this, "uint*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * Retrieves the requested folder action from the collection.
     * @remarks
     * This property is the object's default property.
     * @param {VARIANT} Index 
     * @returns {IFolderAction} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ifolderactioncollection-get_item
     */
    get_Item(Index) {
        result := ComCall(8, this, VARIANT, Index, "ptr*", &Action := 0, "HRESULT")
        return IFolderAction(Action)
    }

    /**
     * Retrieves an interface to the enumeration. (IFolderActionCollection.get__NewEnum)
     * @remarks
     * C++ programmers use this property.
     * 
     * The enumeration is a snapshot of the collection at the time of the call.
     * 
     * The items of the enumeration are variants whose type is VT_UNKNOWN. To query for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ifolderaction">IFolderAction</a> interface, use the <b>punkVal</b> member of the variant.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ifolderactioncollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &Enum := 0, "HRESULT")
        return IUnknown(Enum)
    }

    /**
     * Adds a folder action to the collection.
     * @param {IFolderAction} Action An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ifolderaction">IFolderAction</a> interface of the action to add to the collection.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ifolderactioncollection-add
     */
    Add(Action) {
        result := ComCall(10, this, "ptr", Action, "HRESULT")
        return result
    }

    /**
     * Removes a folder action from the collection based on the specified index.
     * @remarks
     * If the variant type is VT_DISPATCH, pass the <b>IDispatch</b> interface of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ifolderaction">IFolderAction</a> interface to be removed.
     * @param {VARIANT} Index The zero-based index of the folder action to remove from the collection. The variant type can be VT_I4, VT_UI4, or VT_DISPATCH.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ifolderactioncollection-remove
     */
    Remove(Index) {
        result := ComCall(11, this, VARIANT, Index, "HRESULT")
        return result
    }

    /**
     * Removes all folder actions from the collection.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ifolderactioncollection-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Adds one or more folder actions to the collection.
     * @param {IFolderActionCollection} Actions An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ifolderactioncollection">IFolderActionCollection</a> interface to a collection of one or more folder actions to add to this collection.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ifolderactioncollection-addrange
     */
    AddRange(Actions) {
        result := ComCall(13, this, "ptr", Actions, "HRESULT")
        return result
    }

    /**
     * Creates a folder action object.
     * @returns {IFolderAction} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ifolderaction">IFolderAction</a> interface that you use to describe the action to be taken by the data manager.
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-ifolderactioncollection-createfolderaction
     */
    CreateFolderAction() {
        result := ComCall(14, this, "ptr*", &FolderAction := 0, "HRESULT")
        return IFolderAction(FolderAction)
    }

    Query(iid) {
        if (IFolderActionCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 2)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 1)
        this.vtbl.AddRange := CallbackCreate(GetMethod(implObj, "AddRange"), flags, 2)
        this.vtbl.CreateFolderAction := CallbackCreate(GetMethod(implObj, "CreateFolderAction"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.Clear)
        CallbackFree(this.vtbl.AddRange)
        CallbackFree(this.vtbl.CreateFolderAction)
    }
}

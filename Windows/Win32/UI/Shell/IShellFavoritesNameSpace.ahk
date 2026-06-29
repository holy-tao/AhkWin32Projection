#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellFavoritesNameSpace extends IDispatch {
    /**
     * The interface identifier for IShellFavoritesNameSpace
     * @type {Guid}
     */
    static IID := Guid("{55136804-b2de-11d1-b9f2-00a0c98bc547}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellFavoritesNameSpace interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        MoveSelectionUp                : IntPtr
        MoveSelectionDown              : IntPtr
        ResetSort                      : IntPtr
        NewFolder                      : IntPtr
        Synchronize                    : IntPtr
        Import                         : IntPtr
        Export                         : IntPtr
        InvokeContextMenuCommand       : IntPtr
        MoveSelectionTo                : IntPtr
        get_SubscriptionsEnabled       : IntPtr
        CreateSubscriptionForSelection : IntPtr
        DeleteSubscriptionForSelection : IntPtr
        SetRoot                        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellFavoritesNameSpace.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    SubscriptionsEnabled {
        get => this.get_SubscriptionsEnabled()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MoveSelectionUp() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MoveSelectionDown() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetSort() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NewFolder() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Synchronize() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Import() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Export() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strCommand 
     * @returns {HRESULT} 
     */
    InvokeContextMenuCommand(strCommand) {
        strCommand := strCommand is String ? BSTR.Alloc(strCommand).Value : strCommand

        result := ComCall(14, this, BSTR, strCommand, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MoveSelectionTo() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_SubscriptionsEnabled() {
        result := ComCall(16, this, VARIANT_BOOL.Ptr, &pBool := 0, "HRESULT")
        return pBool
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    CreateSubscriptionForSelection() {
        result := ComCall(17, this, VARIANT_BOOL.Ptr, &pBool := 0, "HRESULT")
        return pBool
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    DeleteSubscriptionForSelection() {
        result := ComCall(18, this, VARIANT_BOOL.Ptr, &pBool := 0, "HRESULT")
        return pBool
    }

    /**
     * 
     * @param {BSTR} bstrFullPath 
     * @returns {HRESULT} 
     */
    SetRoot(bstrFullPath) {
        bstrFullPath := bstrFullPath is String ? BSTR.Alloc(bstrFullPath).Value : bstrFullPath

        result := ComCall(19, this, BSTR, bstrFullPath, "HRESULT")
        return result
    }

    Query(iid) {
        if (IShellFavoritesNameSpace.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.MoveSelectionUp := CallbackCreate(GetMethod(implObj, "MoveSelectionUp"), flags, 1)
        this.vtbl.MoveSelectionDown := CallbackCreate(GetMethod(implObj, "MoveSelectionDown"), flags, 1)
        this.vtbl.ResetSort := CallbackCreate(GetMethod(implObj, "ResetSort"), flags, 1)
        this.vtbl.NewFolder := CallbackCreate(GetMethod(implObj, "NewFolder"), flags, 1)
        this.vtbl.Synchronize := CallbackCreate(GetMethod(implObj, "Synchronize"), flags, 1)
        this.vtbl.Import := CallbackCreate(GetMethod(implObj, "Import"), flags, 1)
        this.vtbl.Export := CallbackCreate(GetMethod(implObj, "Export"), flags, 1)
        this.vtbl.InvokeContextMenuCommand := CallbackCreate(GetMethod(implObj, "InvokeContextMenuCommand"), flags, 2)
        this.vtbl.MoveSelectionTo := CallbackCreate(GetMethod(implObj, "MoveSelectionTo"), flags, 1)
        this.vtbl.get_SubscriptionsEnabled := CallbackCreate(GetMethod(implObj, "get_SubscriptionsEnabled"), flags, 2)
        this.vtbl.CreateSubscriptionForSelection := CallbackCreate(GetMethod(implObj, "CreateSubscriptionForSelection"), flags, 2)
        this.vtbl.DeleteSubscriptionForSelection := CallbackCreate(GetMethod(implObj, "DeleteSubscriptionForSelection"), flags, 2)
        this.vtbl.SetRoot := CallbackCreate(GetMethod(implObj, "SetRoot"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.MoveSelectionUp)
        CallbackFree(this.vtbl.MoveSelectionDown)
        CallbackFree(this.vtbl.ResetSort)
        CallbackFree(this.vtbl.NewFolder)
        CallbackFree(this.vtbl.Synchronize)
        CallbackFree(this.vtbl.Import)
        CallbackFree(this.vtbl.Export)
        CallbackFree(this.vtbl.InvokeContextMenuCommand)
        CallbackFree(this.vtbl.MoveSelectionTo)
        CallbackFree(this.vtbl.get_SubscriptionsEnabled)
        CallbackFree(this.vtbl.CreateSubscriptionForSelection)
        CallbackFree(this.vtbl.DeleteSubscriptionForSelection)
        CallbackFree(this.vtbl.SetRoot)
    }
}

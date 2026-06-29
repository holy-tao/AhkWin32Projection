#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ISClusNode.ahk" { ISClusNode }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct ISClusResGroupPreferredOwnerNodes extends IDispatch {
    /**
     * The interface identifier for ISClusResGroupPreferredOwnerNodes
     * @type {Guid}
     */
    static IID := Guid("{f2e606e8-2631-11d1-89f1-00a0c90d061e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISClusResGroupPreferredOwnerNodes interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count    : IntPtr
        get__NewEnum : IntPtr
        Refresh      : IntPtr
        get_Item     : IntPtr
        InsertItem   : IntPtr
        RemoveItem   : IntPtr
        get_Modified : IntPtr
        SaveChanges  : IntPtr
        AddItem      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISClusResGroupPreferredOwnerNodes.Vtbl()
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
     * @type {VARIANT} 
     */
    Modified {
        get => this.get_Modified()
    }

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
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varIndex 
     * @returns {ISClusNode} 
     */
    get_Item(varIndex) {
        result := ComCall(10, this, VARIANT, varIndex, "ptr*", &ppNode := 0, "HRESULT")
        return ISClusNode(ppNode)
    }

    /**
     * 
     * @param {ISClusNode} pNode 
     * @param {Integer} nPosition 
     * @returns {HRESULT} 
     */
    InsertItem(pNode, nPosition) {
        result := ComCall(11, this, "ptr", pNode, "int", nPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varIndex 
     * @returns {HRESULT} 
     */
    RemoveItem(varIndex) {
        result := ComCall(12, this, VARIANT, varIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Modified() {
        pvarModified := VARIANT()
        result := ComCall(13, this, VARIANT.Ptr, pvarModified, "HRESULT")
        return pvarModified
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SaveChanges() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISClusNode} pNode 
     * @returns {HRESULT} 
     */
    AddItem(pNode) {
        result := ComCall(15, this, "ptr", pNode, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISClusResGroupPreferredOwnerNodes.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.Refresh := CallbackCreate(GetMethod(implObj, "Refresh"), flags, 1)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.InsertItem := CallbackCreate(GetMethod(implObj, "InsertItem"), flags, 3)
        this.vtbl.RemoveItem := CallbackCreate(GetMethod(implObj, "RemoveItem"), flags, 2)
        this.vtbl.get_Modified := CallbackCreate(GetMethod(implObj, "get_Modified"), flags, 2)
        this.vtbl.SaveChanges := CallbackCreate(GetMethod(implObj, "SaveChanges"), flags, 1)
        this.vtbl.AddItem := CallbackCreate(GetMethod(implObj, "AddItem"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.Refresh)
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.InsertItem)
        CallbackFree(this.vtbl.RemoveItem)
        CallbackFree(this.vtbl.get_Modified)
        CallbackFree(this.vtbl.SaveChanges)
        CallbackFree(this.vtbl.AddItem)
    }
}

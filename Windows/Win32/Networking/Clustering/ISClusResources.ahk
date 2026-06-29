#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\CLUSTER_RESOURCE_CREATE_FLAGS.ahk" { CLUSTER_RESOURCE_CREATE_FLAGS }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\ISClusResource.ahk" { ISClusResource }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct ISClusResources extends IDispatch {
    /**
     * The interface identifier for ISClusResources
     * @type {Guid}
     */
    static IID := Guid("{f2e6070c-2631-11d1-89f1-00a0c90d061e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISClusResources interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count    : IntPtr
        get__NewEnum : IntPtr
        Refresh      : IntPtr
        get_Item     : IntPtr
        CreateItem   : IntPtr
        DeleteItem   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISClusResources.Vtbl()
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
     * @returns {ISClusResource} 
     */
    get_Item(varIndex) {
        result := ComCall(10, this, VARIANT, varIndex, "ptr*", &ppClusResource := 0, "HRESULT")
        return ISClusResource(ppClusResource)
    }

    /**
     * 
     * @param {BSTR} bstrResourceName 
     * @param {BSTR} bstrResourceType 
     * @param {BSTR} bstrGroupName 
     * @param {CLUSTER_RESOURCE_CREATE_FLAGS} dwFlags 
     * @returns {ISClusResource} 
     */
    CreateItem(bstrResourceName, bstrResourceType, bstrGroupName, dwFlags) {
        bstrResourceName := bstrResourceName is String ? BSTR.Alloc(bstrResourceName).Value : bstrResourceName
        bstrResourceType := bstrResourceType is String ? BSTR.Alloc(bstrResourceType).Value : bstrResourceType
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(11, this, BSTR, bstrResourceName, BSTR, bstrResourceType, BSTR, bstrGroupName, CLUSTER_RESOURCE_CREATE_FLAGS, dwFlags, "ptr*", &ppClusterResource := 0, "HRESULT")
        return ISClusResource(ppClusterResource)
    }

    /**
     * 
     * @param {VARIANT} varIndex 
     * @returns {HRESULT} 
     */
    DeleteItem(varIndex) {
        result := ComCall(12, this, VARIANT, varIndex, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISClusResources.IID.Equals(iid)) {
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
        this.vtbl.CreateItem := CallbackCreate(GetMethod(implObj, "CreateItem"), flags, 6)
        this.vtbl.DeleteItem := CallbackCreate(GetMethod(implObj, "DeleteItem"), flags, 2)
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
        CallbackFree(this.vtbl.CreateItem)
        CallbackFree(this.vtbl.DeleteItem)
    }
}

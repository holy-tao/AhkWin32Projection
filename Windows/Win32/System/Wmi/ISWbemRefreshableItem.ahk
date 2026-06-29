#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISWbemRefresher.ahk" { ISWbemRefresher }
#Import ".\ISWbemObjectSet.ahk" { ISWbemObjectSet }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\ISWbemObjectEx.ahk" { ISWbemObjectEx }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct ISWbemRefreshableItem extends IDispatch {
    /**
     * The interface identifier for ISWbemRefreshableItem
     * @type {Guid}
     */
    static IID := Guid("{5ad4bf92-daab-11d3-b38f-00105a1f473a}")

    /**
     * The class identifier for SWbemRefreshableItem
     * @type {Guid}
     */
    static CLSID := Guid("{8c6854bc-de4b-11d3-b390-00105a1f473a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISWbemRefreshableItem interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Index     : IntPtr
        get_Refresher : IntPtr
        get_IsSet     : IntPtr
        get_Object    : IntPtr
        get_ObjectSet : IntPtr
        Remove        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISWbemRefreshableItem.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Index {
        get => this.get_Index()
    }

    /**
     * @type {ISWbemRefresher} 
     */
    Refresher {
        get => this.get_Refresher()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsSet {
        get => this.get_IsSet()
    }

    /**
     * @type {ISWbemObjectEx} 
     */
    Object {
        get => this.get_Object()
    }

    /**
     * @type {ISWbemObjectSet} 
     */
    ObjectSet {
        get => this.get_ObjectSet()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Index() {
        result := ComCall(7, this, "int*", &iIndex := 0, "HRESULT")
        return iIndex
    }

    /**
     * 
     * @returns {ISWbemRefresher} 
     */
    get_Refresher() {
        result := ComCall(8, this, "ptr*", &objWbemRefresher := 0, "HRESULT")
        return ISWbemRefresher(objWbemRefresher)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsSet() {
        result := ComCall(9, this, VARIANT_BOOL.Ptr, &bIsSet := 0, "HRESULT")
        return bIsSet
    }

    /**
     * 
     * @returns {ISWbemObjectEx} 
     */
    get_Object() {
        result := ComCall(10, this, "ptr*", &objWbemObject := 0, "HRESULT")
        return ISWbemObjectEx(objWbemObject)
    }

    /**
     * 
     * @returns {ISWbemObjectSet} 
     */
    get_ObjectSet() {
        result := ComCall(11, this, "ptr*", &objWbemObjectSet := 0, "HRESULT")
        return ISWbemObjectSet(objWbemObjectSet)
    }

    /**
     * 
     * @param {Integer} iFlags 
     * @returns {HRESULT} 
     */
    Remove(iFlags) {
        result := ComCall(12, this, "int", iFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISWbemRefreshableItem.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Index := CallbackCreate(GetMethod(implObj, "get_Index"), flags, 2)
        this.vtbl.get_Refresher := CallbackCreate(GetMethod(implObj, "get_Refresher"), flags, 2)
        this.vtbl.get_IsSet := CallbackCreate(GetMethod(implObj, "get_IsSet"), flags, 2)
        this.vtbl.get_Object := CallbackCreate(GetMethod(implObj, "get_Object"), flags, 2)
        this.vtbl.get_ObjectSet := CallbackCreate(GetMethod(implObj, "get_ObjectSet"), flags, 2)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Index)
        CallbackFree(this.vtbl.get_Refresher)
        CallbackFree(this.vtbl.get_IsSet)
        CallbackFree(this.vtbl.get_Object)
        CallbackFree(this.vtbl.get_ObjectSet)
        CallbackFree(this.vtbl.Remove)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISClusProperty.ahk" { ISClusProperty }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct ISClusProperties extends IDispatch {
    /**
     * The interface identifier for ISClusProperties
     * @type {Guid}
     */
    static IID := Guid("{f2e60700-2631-11d1-89f1-00a0c90d061e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISClusProperties interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count       : IntPtr
        get__NewEnum    : IntPtr
        Refresh         : IntPtr
        get_Item        : IntPtr
        CreateItem      : IntPtr
        UseDefaultValue : IntPtr
        SaveChanges     : IntPtr
        get_ReadOnly    : IntPtr
        get_Private     : IntPtr
        get_Common      : IntPtr
        get_Modified    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISClusProperties.Vtbl()
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
    ReadOnly {
        get => this.get_ReadOnly()
    }

    /**
     * @type {VARIANT} 
     */
    Private {
        get => this.get_Private()
    }

    /**
     * @type {VARIANT} 
     */
    Common {
        get => this.get_Common()
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
     * @returns {ISClusProperty} 
     */
    get_Item(varIndex) {
        result := ComCall(10, this, VARIANT, varIndex, "ptr*", &ppClusProperty := 0, "HRESULT")
        return ISClusProperty(ppClusProperty)
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {VARIANT} varValue 
     * @returns {ISClusProperty} 
     */
    CreateItem(bstrName, varValue) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(11, this, BSTR, bstrName, VARIANT, varValue, "ptr*", &pProperty := 0, "HRESULT")
        return ISClusProperty(pProperty)
    }

    /**
     * 
     * @param {VARIANT} varIndex 
     * @returns {HRESULT} 
     */
    UseDefaultValue(varIndex) {
        result := ComCall(12, this, VARIANT, varIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    SaveChanges() {
        pvarStatusCode := VARIANT()
        result := ComCall(13, this, VARIANT.Ptr, pvarStatusCode, "HRESULT")
        return pvarStatusCode
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ReadOnly() {
        pvarReadOnly := VARIANT()
        result := ComCall(14, this, VARIANT.Ptr, pvarReadOnly, "HRESULT")
        return pvarReadOnly
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Private() {
        pvarPrivate := VARIANT()
        result := ComCall(15, this, VARIANT.Ptr, pvarPrivate, "HRESULT")
        return pvarPrivate
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Common() {
        pvarCommon := VARIANT()
        result := ComCall(16, this, VARIANT.Ptr, pvarCommon, "HRESULT")
        return pvarCommon
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Modified() {
        pvarModified := VARIANT()
        result := ComCall(17, this, VARIANT.Ptr, pvarModified, "HRESULT")
        return pvarModified
    }

    Query(iid) {
        if (ISClusProperties.IID.Equals(iid)) {
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
        this.vtbl.CreateItem := CallbackCreate(GetMethod(implObj, "CreateItem"), flags, 4)
        this.vtbl.UseDefaultValue := CallbackCreate(GetMethod(implObj, "UseDefaultValue"), flags, 2)
        this.vtbl.SaveChanges := CallbackCreate(GetMethod(implObj, "SaveChanges"), flags, 2)
        this.vtbl.get_ReadOnly := CallbackCreate(GetMethod(implObj, "get_ReadOnly"), flags, 2)
        this.vtbl.get_Private := CallbackCreate(GetMethod(implObj, "get_Private"), flags, 2)
        this.vtbl.get_Common := CallbackCreate(GetMethod(implObj, "get_Common"), flags, 2)
        this.vtbl.get_Modified := CallbackCreate(GetMethod(implObj, "get_Modified"), flags, 2)
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
        CallbackFree(this.vtbl.UseDefaultValue)
        CallbackFree(this.vtbl.SaveChanges)
        CallbackFree(this.vtbl.get_ReadOnly)
        CallbackFree(this.vtbl.get_Private)
        CallbackFree(this.vtbl.get_Common)
        CallbackFree(this.vtbl.get_Modified)
    }
}

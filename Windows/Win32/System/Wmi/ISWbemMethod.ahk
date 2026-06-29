#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISWbemObject.ahk" { ISWbemObject }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISWbemQualifierSet.ahk" { ISWbemQualifierSet }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct ISWbemMethod extends IDispatch {
    /**
     * The interface identifier for ISWbemMethod
     * @type {Guid}
     */
    static IID := Guid("{422e8e90-d955-11d1-8b09-00600806d9b6}")

    /**
     * The class identifier for SWbemMethod
     * @type {Guid}
     */
    static CLSID := Guid("{04b83d5b-21ae-11d2-8b33-00600806d9b6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISWbemMethod interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name          : IntPtr
        get_Origin        : IntPtr
        get_InParameters  : IntPtr
        get_OutParameters : IntPtr
        get_Qualifiers_   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISWbemMethod.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    Origin {
        get => this.get_Origin()
    }

    /**
     * @type {ISWbemObject} 
     */
    InParameters {
        get => this.get_InParameters()
    }

    /**
     * @type {ISWbemObject} 
     */
    OutParameters {
        get => this.get_OutParameters()
    }

    /**
     * @type {ISWbemQualifierSet} 
     */
    Qualifiers_ {
        get => this.get_Qualifiers_()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        strName := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, strName, "HRESULT")
        return strName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Origin() {
        strOrigin := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, strOrigin, "HRESULT")
        return strOrigin
    }

    /**
     * 
     * @returns {ISWbemObject} 
     */
    get_InParameters() {
        result := ComCall(9, this, "ptr*", &objWbemInParameters := 0, "HRESULT")
        return ISWbemObject(objWbemInParameters)
    }

    /**
     * 
     * @returns {ISWbemObject} 
     */
    get_OutParameters() {
        result := ComCall(10, this, "ptr*", &objWbemOutParameters := 0, "HRESULT")
        return ISWbemObject(objWbemOutParameters)
    }

    /**
     * 
     * @returns {ISWbemQualifierSet} 
     */
    get_Qualifiers_() {
        result := ComCall(11, this, "ptr*", &objWbemQualifierSet := 0, "HRESULT")
        return ISWbemQualifierSet(objWbemQualifierSet)
    }

    Query(iid) {
        if (ISWbemMethod.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_Origin := CallbackCreate(GetMethod(implObj, "get_Origin"), flags, 2)
        this.vtbl.get_InParameters := CallbackCreate(GetMethod(implObj, "get_InParameters"), flags, 2)
        this.vtbl.get_OutParameters := CallbackCreate(GetMethod(implObj, "get_OutParameters"), flags, 2)
        this.vtbl.get_Qualifiers_ := CallbackCreate(GetMethod(implObj, "get_Qualifiers_"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_Origin)
        CallbackFree(this.vtbl.get_InParameters)
        CallbackFree(this.vtbl.get_OutParameters)
        CallbackFree(this.vtbl.get_Qualifiers_)
    }
}

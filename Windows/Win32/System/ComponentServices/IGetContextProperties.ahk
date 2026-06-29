#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEnumNames.ahk" { IEnumNames }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Enables the caller to obtain the properties associated with the current object's context.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-igetcontextproperties
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IGetContextProperties extends IUnknown {
    /**
     * The interface identifier for IGetContextProperties
     * @type {Guid}
     */
    static IID := Guid("{51372af4-cae7-11cf-be81-00aa00a2fa25}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGetContextProperties interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Count       : IntPtr
        GetProperty : IntPtr
        EnumNames   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGetContextProperties.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Counts the number of context properties.
     * @param {Pointer<Integer>} plCount The number of current context properties.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-igetcontextproperties-count
     */
    Count(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * Retrieves the value of the specified context property.
     * @param {BSTR} name The name of a current context property.
     * @param {Pointer<VARIANT>} pProperty The value(s) of the property.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-igetcontextproperties-getproperty
     */
    GetProperty(name, pProperty) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(4, this, BSTR, name, VARIANT.Ptr, pProperty, "HRESULT")
        return result
    }

    /**
     * Retrieves a list of the names of the current context properties.
     * @returns {IEnumNames} An <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-ienumnames">IEnumNames</a> interface providing access to a list of the names of the current context properties.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-igetcontextproperties-enumnames
     */
    EnumNames() {
        result := ComCall(5, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumNames(ppenum)
    }

    Query(iid) {
        if (IGetContextProperties.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Count := CallbackCreate(GetMethod(implObj, "Count"), flags, 2)
        this.vtbl.GetProperty := CallbackCreate(GetMethod(implObj, "GetProperty"), flags, 3)
        this.vtbl.EnumNames := CallbackCreate(GetMethod(implObj, "EnumNames"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Count)
        CallbackFree(this.vtbl.GetProperty)
        CallbackFree(this.vtbl.EnumNames)
    }
}

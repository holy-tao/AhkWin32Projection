#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ADS_CLASS_DEF.ahk" { ADS_CLASS_DEF }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ADS_ATTR_DEF.ahk" { ADS_ATTR_DEF }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Not currently implemented and should not be used.
 * @remarks
 * The methods for this interface are not fully implemented at this time.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-idirectoryschemamgmt
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IDirectorySchemaMgmt extends IUnknown {
    /**
     * The interface identifier for IDirectorySchemaMgmt
     * @type {Guid}
     */
    static IID := Guid("{75db3b9c-a4d8-11d0-a79c-00c04fd8d5a8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectorySchemaMgmt interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EnumAttributes            : IntPtr
        CreateAttributeDefinition : IntPtr
        WriteAttributeDefinition  : IntPtr
        DeleteAttributeDefinition : IntPtr
        EnumClasses               : IntPtr
        WriteClassDefinition      : IntPtr
        CreateClassDefinition     : IntPtr
        DeleteClassDefinition     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectorySchemaMgmt.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Not currently implemented and should not be used.
     * @remarks
     * The methods for this interface are not fully implemented at this time.
     * @param {Pointer<PWSTR>} ppszAttrNames 
     * @param {Integer} dwNumAttributes 
     * @param {Pointer<Pointer<ADS_ATTR_DEF>>} ppAttrDefinition 
     * @param {Pointer<Integer>} pdwNumAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-idirectoryschemamgmt
     */
    EnumAttributes(ppszAttrNames, dwNumAttributes, ppAttrDefinition, pdwNumAttributes) {
        ppszAttrNamesMarshal := ppszAttrNames is VarRef ? "ptr*" : "ptr"
        ppAttrDefinitionMarshal := ppAttrDefinition is VarRef ? "ptr*" : "ptr"
        pdwNumAttributesMarshal := pdwNumAttributes is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, ppszAttrNamesMarshal, ppszAttrNames, "uint", dwNumAttributes, ppAttrDefinitionMarshal, ppAttrDefinition, pdwNumAttributesMarshal, pdwNumAttributes, "HRESULT")
        return result
    }

    /**
     * Not currently implemented and should not be used.
     * @remarks
     * The methods for this interface are not fully implemented at this time.
     * @param {PWSTR} pszAttributeName 
     * @param {Pointer<ADS_ATTR_DEF>} pAttributeDefinition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-idirectoryschemamgmt
     */
    CreateAttributeDefinition(pszAttributeName, pAttributeDefinition) {
        pszAttributeName := pszAttributeName is String ? StrPtr(pszAttributeName) : pszAttributeName

        result := ComCall(4, this, "ptr", pszAttributeName, ADS_ATTR_DEF.Ptr, pAttributeDefinition, "HRESULT")
        return result
    }

    /**
     * Not currently implemented and should not be used.
     * @remarks
     * The methods for this interface are not fully implemented at this time.
     * @param {PWSTR} pszAttributeName 
     * @param {Pointer<ADS_ATTR_DEF>} pAttributeDefinition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-idirectoryschemamgmt
     */
    WriteAttributeDefinition(pszAttributeName, pAttributeDefinition) {
        pszAttributeName := pszAttributeName is String ? StrPtr(pszAttributeName) : pszAttributeName

        result := ComCall(5, this, "ptr", pszAttributeName, ADS_ATTR_DEF.Ptr, pAttributeDefinition, "HRESULT")
        return result
    }

    /**
     * Not currently implemented and should not be used.
     * @remarks
     * The methods for this interface are not fully implemented at this time.
     * @param {PWSTR} pszAttributeName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-idirectoryschemamgmt
     */
    DeleteAttributeDefinition(pszAttributeName) {
        pszAttributeName := pszAttributeName is String ? StrPtr(pszAttributeName) : pszAttributeName

        result := ComCall(6, this, "ptr", pszAttributeName, "HRESULT")
        return result
    }

    /**
     * Not currently implemented and should not be used.
     * @remarks
     * The methods for this interface are not fully implemented at this time.
     * @param {Pointer<PWSTR>} ppszClassNames 
     * @param {Integer} dwNumClasses 
     * @param {Pointer<Pointer<ADS_CLASS_DEF>>} ppClassDefinition 
     * @param {Pointer<Integer>} pdwNumClasses 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-idirectoryschemamgmt
     */
    EnumClasses(ppszClassNames, dwNumClasses, ppClassDefinition, pdwNumClasses) {
        ppszClassNamesMarshal := ppszClassNames is VarRef ? "ptr*" : "ptr"
        ppClassDefinitionMarshal := ppClassDefinition is VarRef ? "ptr*" : "ptr"
        pdwNumClassesMarshal := pdwNumClasses is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, ppszClassNamesMarshal, ppszClassNames, "uint", dwNumClasses, ppClassDefinitionMarshal, ppClassDefinition, pdwNumClassesMarshal, pdwNumClasses, "HRESULT")
        return result
    }

    /**
     * Not currently implemented and should not be used.
     * @remarks
     * The methods for this interface are not fully implemented at this time.
     * @param {PWSTR} pszClassName 
     * @param {Pointer<ADS_CLASS_DEF>} pClassDefinition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-idirectoryschemamgmt
     */
    WriteClassDefinition(pszClassName, pClassDefinition) {
        pszClassName := pszClassName is String ? StrPtr(pszClassName) : pszClassName

        result := ComCall(8, this, "ptr", pszClassName, ADS_CLASS_DEF.Ptr, pClassDefinition, "HRESULT")
        return result
    }

    /**
     * Not currently implemented and should not be used.
     * @remarks
     * The methods for this interface are not fully implemented at this time.
     * @param {PWSTR} pszClassName 
     * @param {Pointer<ADS_CLASS_DEF>} pClassDefinition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-idirectoryschemamgmt
     */
    CreateClassDefinition(pszClassName, pClassDefinition) {
        pszClassName := pszClassName is String ? StrPtr(pszClassName) : pszClassName

        result := ComCall(9, this, "ptr", pszClassName, ADS_CLASS_DEF.Ptr, pClassDefinition, "HRESULT")
        return result
    }

    /**
     * Not currently implemented and should not be used.
     * @remarks
     * The methods for this interface are not fully implemented at this time.
     * @param {PWSTR} pszClassName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-idirectoryschemamgmt
     */
    DeleteClassDefinition(pszClassName) {
        pszClassName := pszClassName is String ? StrPtr(pszClassName) : pszClassName

        result := ComCall(10, this, "ptr", pszClassName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectorySchemaMgmt.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumAttributes := CallbackCreate(GetMethod(implObj, "EnumAttributes"), flags, 5)
        this.vtbl.CreateAttributeDefinition := CallbackCreate(GetMethod(implObj, "CreateAttributeDefinition"), flags, 3)
        this.vtbl.WriteAttributeDefinition := CallbackCreate(GetMethod(implObj, "WriteAttributeDefinition"), flags, 3)
        this.vtbl.DeleteAttributeDefinition := CallbackCreate(GetMethod(implObj, "DeleteAttributeDefinition"), flags, 2)
        this.vtbl.EnumClasses := CallbackCreate(GetMethod(implObj, "EnumClasses"), flags, 5)
        this.vtbl.WriteClassDefinition := CallbackCreate(GetMethod(implObj, "WriteClassDefinition"), flags, 3)
        this.vtbl.CreateClassDefinition := CallbackCreate(GetMethod(implObj, "CreateClassDefinition"), flags, 3)
        this.vtbl.DeleteClassDefinition := CallbackCreate(GetMethod(implObj, "DeleteClassDefinition"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumAttributes)
        CallbackFree(this.vtbl.CreateAttributeDefinition)
        CallbackFree(this.vtbl.WriteAttributeDefinition)
        CallbackFree(this.vtbl.DeleteAttributeDefinition)
        CallbackFree(this.vtbl.EnumClasses)
        CallbackFree(this.vtbl.WriteClassDefinition)
        CallbackFree(this.vtbl.CreateClassDefinition)
        CallbackFree(this.vtbl.DeleteClassDefinition)
    }
}

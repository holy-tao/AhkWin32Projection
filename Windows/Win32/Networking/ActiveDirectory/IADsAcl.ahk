#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IADsAcl interface provides methods for an ADSI client to access and manipulate the ACL or Inherited ACL attribute values. This interface manipulates the attributes.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsacl
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsAcl extends IDispatch {
    /**
     * The interface identifier for IADsAcl
     * @type {Guid}
     */
    static IID := Guid("{8452d3ab-0869-11d1-a377-00c04fb950dc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsAcl interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_ProtectedAttrName : IntPtr
        put_ProtectedAttrName : IntPtr
        get_SubjectName       : IntPtr
        put_SubjectName       : IntPtr
        get_Privileges        : IntPtr
        put_Privileges        : IntPtr
        CopyAcl               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsAcl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    ProtectedAttrName {
        get => this.get_ProtectedAttrName()
        set => this.put_ProtectedAttrName(value)
    }

    /**
     * @type {BSTR} 
     */
    SubjectName {
        get => this.get_SubjectName()
        set => this.put_SubjectName(value)
    }

    /**
     * @type {Integer} 
     */
    Privileges {
        get => this.get_Privileges()
        set => this.put_Privileges(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ProtectedAttrName() {
        retval := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrProtectedAttrName 
     * @returns {HRESULT} 
     */
    put_ProtectedAttrName(bstrProtectedAttrName) {
        bstrProtectedAttrName := bstrProtectedAttrName is String ? BSTR.Alloc(bstrProtectedAttrName).Value : bstrProtectedAttrName

        result := ComCall(8, this, BSTR, bstrProtectedAttrName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_SubjectName() {
        retval := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrSubjectName 
     * @returns {HRESULT} 
     */
    put_SubjectName(bstrSubjectName) {
        bstrSubjectName := bstrSubjectName is String ? BSTR.Alloc(bstrSubjectName).Value : bstrSubjectName

        result := ComCall(10, this, BSTR, bstrSubjectName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Privileges() {
        result := ComCall(11, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnPrivileges 
     * @returns {HRESULT} 
     */
    put_Privileges(lnPrivileges) {
        result := ComCall(12, this, "int", lnPrivileges, "HRESULT")
        return result
    }

    /**
     * The IADsAcl::CopyAcl method makes a copy of the existing ACL.
     * @returns {IDispatch} Pointer to the newly created copy of the existing ACL.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsacl-copyacl
     */
    CopyAcl() {
        result := ComCall(13, this, "ptr*", &ppAcl := 0, "HRESULT")
        return IDispatch(ppAcl)
    }

    Query(iid) {
        if (IADsAcl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ProtectedAttrName := CallbackCreate(GetMethod(implObj, "get_ProtectedAttrName"), flags, 2)
        this.vtbl.put_ProtectedAttrName := CallbackCreate(GetMethod(implObj, "put_ProtectedAttrName"), flags, 2)
        this.vtbl.get_SubjectName := CallbackCreate(GetMethod(implObj, "get_SubjectName"), flags, 2)
        this.vtbl.put_SubjectName := CallbackCreate(GetMethod(implObj, "put_SubjectName"), flags, 2)
        this.vtbl.get_Privileges := CallbackCreate(GetMethod(implObj, "get_Privileges"), flags, 2)
        this.vtbl.put_Privileges := CallbackCreate(GetMethod(implObj, "put_Privileges"), flags, 2)
        this.vtbl.CopyAcl := CallbackCreate(GetMethod(implObj, "CopyAcl"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ProtectedAttrName)
        CallbackFree(this.vtbl.put_ProtectedAttrName)
        CallbackFree(this.vtbl.get_SubjectName)
        CallbackFree(this.vtbl.put_SubjectName)
        CallbackFree(this.vtbl.get_Privileges)
        CallbackFree(this.vtbl.put_Privileges)
        CallbackFree(this.vtbl.CopyAcl)
    }
}

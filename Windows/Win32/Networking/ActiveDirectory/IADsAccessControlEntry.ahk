#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IADsAccessControlEntry interface is a dual interface that enables directory clients to access and manipulate individual access-control entries (ACEs) of the owning object.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsaccesscontrolentry
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsAccessControlEntry extends IDispatch {
    /**
     * The interface identifier for IADsAccessControlEntry
     * @type {Guid}
     */
    static IID := Guid("{b4f3a14c-9bdd-11d0-852c-00c04fd8d503}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsAccessControlEntry interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_AccessMask          : IntPtr
        put_AccessMask          : IntPtr
        get_AceType             : IntPtr
        put_AceType             : IntPtr
        get_AceFlags            : IntPtr
        put_AceFlags            : IntPtr
        get_Flags               : IntPtr
        put_Flags               : IntPtr
        get_ObjectType          : IntPtr
        put_ObjectType          : IntPtr
        get_InheritedObjectType : IntPtr
        put_InheritedObjectType : IntPtr
        get_Trustee             : IntPtr
        put_Trustee             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsAccessControlEntry.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    AccessMask {
        get => this.get_AccessMask()
        set => this.put_AccessMask(value)
    }

    /**
     * @type {Integer} 
     */
    AceType {
        get => this.get_AceType()
        set => this.put_AceType(value)
    }

    /**
     * @type {Integer} 
     */
    AceFlags {
        get => this.get_AceFlags()
        set => this.put_AceFlags(value)
    }

    /**
     * @type {Integer} 
     */
    Flags {
        get => this.get_Flags()
        set => this.put_Flags(value)
    }

    /**
     * @type {BSTR} 
     */
    ObjectType {
        get => this.get_ObjectType()
        set => this.put_ObjectType(value)
    }

    /**
     * @type {BSTR} 
     */
    InheritedObjectType {
        get => this.get_InheritedObjectType()
        set => this.put_InheritedObjectType(value)
    }

    /**
     * @type {BSTR} 
     */
    Trustee {
        get => this.get_Trustee()
        set => this.put_Trustee(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AccessMask() {
        result := ComCall(7, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnAccessMask 
     * @returns {HRESULT} 
     */
    put_AccessMask(lnAccessMask) {
        result := ComCall(8, this, "int", lnAccessMask, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AceType() {
        result := ComCall(9, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnAceType 
     * @returns {HRESULT} 
     */
    put_AceType(lnAceType) {
        result := ComCall(10, this, "int", lnAceType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AceFlags() {
        result := ComCall(11, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnAceFlags 
     * @returns {HRESULT} 
     */
    put_AceFlags(lnAceFlags) {
        result := ComCall(12, this, "int", lnAceFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Flags() {
        result := ComCall(13, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnFlags 
     * @returns {HRESULT} 
     */
    put_Flags(lnFlags) {
        result := ComCall(14, this, "int", lnFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ObjectType() {
        retval := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrObjectType 
     * @returns {HRESULT} 
     */
    put_ObjectType(bstrObjectType) {
        bstrObjectType := bstrObjectType is String ? BSTR.Alloc(bstrObjectType).Value : bstrObjectType

        result := ComCall(16, this, BSTR, bstrObjectType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_InheritedObjectType() {
        retval := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrInheritedObjectType 
     * @returns {HRESULT} 
     */
    put_InheritedObjectType(bstrInheritedObjectType) {
        bstrInheritedObjectType := bstrInheritedObjectType is String ? BSTR.Alloc(bstrInheritedObjectType).Value : bstrInheritedObjectType

        result := ComCall(18, this, BSTR, bstrInheritedObjectType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Trustee() {
        retval := BSTR.Owned()
        result := ComCall(19, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrTrustee 
     * @returns {HRESULT} 
     */
    put_Trustee(bstrTrustee) {
        bstrTrustee := bstrTrustee is String ? BSTR.Alloc(bstrTrustee).Value : bstrTrustee

        result := ComCall(20, this, BSTR, bstrTrustee, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsAccessControlEntry.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_AccessMask := CallbackCreate(GetMethod(implObj, "get_AccessMask"), flags, 2)
        this.vtbl.put_AccessMask := CallbackCreate(GetMethod(implObj, "put_AccessMask"), flags, 2)
        this.vtbl.get_AceType := CallbackCreate(GetMethod(implObj, "get_AceType"), flags, 2)
        this.vtbl.put_AceType := CallbackCreate(GetMethod(implObj, "put_AceType"), flags, 2)
        this.vtbl.get_AceFlags := CallbackCreate(GetMethod(implObj, "get_AceFlags"), flags, 2)
        this.vtbl.put_AceFlags := CallbackCreate(GetMethod(implObj, "put_AceFlags"), flags, 2)
        this.vtbl.get_Flags := CallbackCreate(GetMethod(implObj, "get_Flags"), flags, 2)
        this.vtbl.put_Flags := CallbackCreate(GetMethod(implObj, "put_Flags"), flags, 2)
        this.vtbl.get_ObjectType := CallbackCreate(GetMethod(implObj, "get_ObjectType"), flags, 2)
        this.vtbl.put_ObjectType := CallbackCreate(GetMethod(implObj, "put_ObjectType"), flags, 2)
        this.vtbl.get_InheritedObjectType := CallbackCreate(GetMethod(implObj, "get_InheritedObjectType"), flags, 2)
        this.vtbl.put_InheritedObjectType := CallbackCreate(GetMethod(implObj, "put_InheritedObjectType"), flags, 2)
        this.vtbl.get_Trustee := CallbackCreate(GetMethod(implObj, "get_Trustee"), flags, 2)
        this.vtbl.put_Trustee := CallbackCreate(GetMethod(implObj, "put_Trustee"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_AccessMask)
        CallbackFree(this.vtbl.put_AccessMask)
        CallbackFree(this.vtbl.get_AceType)
        CallbackFree(this.vtbl.put_AceType)
        CallbackFree(this.vtbl.get_AceFlags)
        CallbackFree(this.vtbl.put_AceFlags)
        CallbackFree(this.vtbl.get_Flags)
        CallbackFree(this.vtbl.put_Flags)
        CallbackFree(this.vtbl.get_ObjectType)
        CallbackFree(this.vtbl.put_ObjectType)
        CallbackFree(this.vtbl.get_InheritedObjectType)
        CallbackFree(this.vtbl.put_InheritedObjectType)
        CallbackFree(this.vtbl.get_Trustee)
        CallbackFree(this.vtbl.put_Trustee)
    }
}

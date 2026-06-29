#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Provides access to properties on an ADSI security descriptor object.
 * @remarks
 * Use this interface to examine and change the access controls to an Active Directory directory service object. You can also use it to create copies of a security descriptor. To get this interface, use the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-get">IADs.Get</a> method to obtain the <b>ntSecurityDescriptor</b> attribute of the object. For more information about how  to create  a new security descriptor and set it on an object, see <a href="https://docs.microsoft.com/windows/desktop/AD/creating-a-security-descriptor-for-a-new-directory-object">Creating a Security Descriptor for a New Directory Object</a> and <a href="https://docs.microsoft.com/windows/desktop/AD/null-dacls-and-empty-dacls">Null DACLs and Empty DACLs</a>.
 * 
 * Often, it is not possible to modify all portions of the security descriptor. For example, if the current user has full control of an object, but is not an administrator and does not own the object, the user can modify the DACL, but cannot modify the owner. This will cause an error when the <b>ntSecurityDescriptor</b> is updated. To avoid this problem, the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsobjectoptions">IADsObjectOptions</a> interface can be used to specify the specific portions of the security descriptor that should be modified.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadssecuritydescriptor
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsSecurityDescriptor extends IDispatch {
    /**
     * The interface identifier for IADsSecurityDescriptor
     * @type {Guid}
     */
    static IID := Guid("{b8c787ca-9bdd-11d0-852c-00c04fd8d503}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsSecurityDescriptor interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Revision           : IntPtr
        put_Revision           : IntPtr
        get_Control            : IntPtr
        put_Control            : IntPtr
        get_Owner              : IntPtr
        put_Owner              : IntPtr
        get_OwnerDefaulted     : IntPtr
        put_OwnerDefaulted     : IntPtr
        get_Group              : IntPtr
        put_Group              : IntPtr
        get_GroupDefaulted     : IntPtr
        put_GroupDefaulted     : IntPtr
        get_DiscretionaryAcl   : IntPtr
        put_DiscretionaryAcl   : IntPtr
        get_DaclDefaulted      : IntPtr
        put_DaclDefaulted      : IntPtr
        get_SystemAcl          : IntPtr
        put_SystemAcl          : IntPtr
        get_SaclDefaulted      : IntPtr
        put_SaclDefaulted      : IntPtr
        CopySecurityDescriptor : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsSecurityDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Revision {
        get => this.get_Revision()
        set => this.put_Revision(value)
    }

    /**
     * @type {Integer} 
     */
    Control {
        get => this.get_Control()
        set => this.put_Control(value)
    }

    /**
     * @type {BSTR} 
     */
    Owner {
        get => this.get_Owner()
        set => this.put_Owner(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    OwnerDefaulted {
        get => this.get_OwnerDefaulted()
        set => this.put_OwnerDefaulted(value)
    }

    /**
     * @type {BSTR} 
     */
    Group {
        get => this.get_Group()
        set => this.put_Group(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    GroupDefaulted {
        get => this.get_GroupDefaulted()
        set => this.put_GroupDefaulted(value)
    }

    /**
     * @type {IDispatch} 
     */
    DiscretionaryAcl {
        get => this.get_DiscretionaryAcl()
        set => this.put_DiscretionaryAcl(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    DaclDefaulted {
        get => this.get_DaclDefaulted()
        set => this.put_DaclDefaulted(value)
    }

    /**
     * @type {IDispatch} 
     */
    SystemAcl {
        get => this.get_SystemAcl()
        set => this.put_SystemAcl(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    SaclDefaulted {
        get => this.get_SaclDefaulted()
        set => this.put_SaclDefaulted(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Revision() {
        result := ComCall(7, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnRevision 
     * @returns {HRESULT} 
     */
    put_Revision(lnRevision) {
        result := ComCall(8, this, "int", lnRevision, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Control() {
        result := ComCall(9, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnControl 
     * @returns {HRESULT} 
     */
    put_Control(lnControl) {
        result := ComCall(10, this, "int", lnControl, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Owner() {
        retval := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrOwner 
     * @returns {HRESULT} 
     */
    put_Owner(bstrOwner) {
        bstrOwner := bstrOwner is String ? BSTR.Alloc(bstrOwner).Value : bstrOwner

        result := ComCall(12, this, BSTR, bstrOwner, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_OwnerDefaulted() {
        result := ComCall(13, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT_BOOL} fOwnerDefaulted 
     * @returns {HRESULT} 
     */
    put_OwnerDefaulted(fOwnerDefaulted) {
        result := ComCall(14, this, VARIANT_BOOL, fOwnerDefaulted, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Group() {
        retval := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrGroup 
     * @returns {HRESULT} 
     */
    put_Group(bstrGroup) {
        bstrGroup := bstrGroup is String ? BSTR.Alloc(bstrGroup).Value : bstrGroup

        result := ComCall(16, this, BSTR, bstrGroup, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_GroupDefaulted() {
        result := ComCall(17, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT_BOOL} fGroupDefaulted 
     * @returns {HRESULT} 
     */
    put_GroupDefaulted(fGroupDefaulted) {
        result := ComCall(18, this, VARIANT_BOOL, fGroupDefaulted, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_DiscretionaryAcl() {
        result := ComCall(19, this, "ptr*", &retval := 0, "HRESULT")
        return IDispatch(retval)
    }

    /**
     * 
     * @param {IDispatch} pDiscretionaryAcl 
     * @returns {HRESULT} 
     */
    put_DiscretionaryAcl(pDiscretionaryAcl) {
        result := ComCall(20, this, "ptr", pDiscretionaryAcl, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_DaclDefaulted() {
        result := ComCall(21, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT_BOOL} fDaclDefaulted 
     * @returns {HRESULT} 
     */
    put_DaclDefaulted(fDaclDefaulted) {
        result := ComCall(22, this, VARIANT_BOOL, fDaclDefaulted, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_SystemAcl() {
        result := ComCall(23, this, "ptr*", &retval := 0, "HRESULT")
        return IDispatch(retval)
    }

    /**
     * 
     * @param {IDispatch} pSystemAcl 
     * @returns {HRESULT} 
     */
    put_SystemAcl(pSystemAcl) {
        result := ComCall(24, this, "ptr", pSystemAcl, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_SaclDefaulted() {
        result := ComCall(25, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT_BOOL} fSaclDefaulted 
     * @returns {HRESULT} 
     */
    put_SaclDefaulted(fSaclDefaulted) {
        result := ComCall(26, this, VARIANT_BOOL, fSaclDefaulted, "HRESULT")
        return result
    }

    /**
     * The IADsSecurityDescriptor::CopySecurityDescriptor method copies an ADSI security descriptor object that holds security data about an object.
     * @returns {IDispatch} Pointer to a pointer to a security descriptor object.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadssecuritydescriptor-copysecuritydescriptor
     */
    CopySecurityDescriptor() {
        result := ComCall(27, this, "ptr*", &ppSecurityDescriptor := 0, "HRESULT")
        return IDispatch(ppSecurityDescriptor)
    }

    Query(iid) {
        if (IADsSecurityDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Revision := CallbackCreate(GetMethod(implObj, "get_Revision"), flags, 2)
        this.vtbl.put_Revision := CallbackCreate(GetMethod(implObj, "put_Revision"), flags, 2)
        this.vtbl.get_Control := CallbackCreate(GetMethod(implObj, "get_Control"), flags, 2)
        this.vtbl.put_Control := CallbackCreate(GetMethod(implObj, "put_Control"), flags, 2)
        this.vtbl.get_Owner := CallbackCreate(GetMethod(implObj, "get_Owner"), flags, 2)
        this.vtbl.put_Owner := CallbackCreate(GetMethod(implObj, "put_Owner"), flags, 2)
        this.vtbl.get_OwnerDefaulted := CallbackCreate(GetMethod(implObj, "get_OwnerDefaulted"), flags, 2)
        this.vtbl.put_OwnerDefaulted := CallbackCreate(GetMethod(implObj, "put_OwnerDefaulted"), flags, 2)
        this.vtbl.get_Group := CallbackCreate(GetMethod(implObj, "get_Group"), flags, 2)
        this.vtbl.put_Group := CallbackCreate(GetMethod(implObj, "put_Group"), flags, 2)
        this.vtbl.get_GroupDefaulted := CallbackCreate(GetMethod(implObj, "get_GroupDefaulted"), flags, 2)
        this.vtbl.put_GroupDefaulted := CallbackCreate(GetMethod(implObj, "put_GroupDefaulted"), flags, 2)
        this.vtbl.get_DiscretionaryAcl := CallbackCreate(GetMethod(implObj, "get_DiscretionaryAcl"), flags, 2)
        this.vtbl.put_DiscretionaryAcl := CallbackCreate(GetMethod(implObj, "put_DiscretionaryAcl"), flags, 2)
        this.vtbl.get_DaclDefaulted := CallbackCreate(GetMethod(implObj, "get_DaclDefaulted"), flags, 2)
        this.vtbl.put_DaclDefaulted := CallbackCreate(GetMethod(implObj, "put_DaclDefaulted"), flags, 2)
        this.vtbl.get_SystemAcl := CallbackCreate(GetMethod(implObj, "get_SystemAcl"), flags, 2)
        this.vtbl.put_SystemAcl := CallbackCreate(GetMethod(implObj, "put_SystemAcl"), flags, 2)
        this.vtbl.get_SaclDefaulted := CallbackCreate(GetMethod(implObj, "get_SaclDefaulted"), flags, 2)
        this.vtbl.put_SaclDefaulted := CallbackCreate(GetMethod(implObj, "put_SaclDefaulted"), flags, 2)
        this.vtbl.CopySecurityDescriptor := CallbackCreate(GetMethod(implObj, "CopySecurityDescriptor"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Revision)
        CallbackFree(this.vtbl.put_Revision)
        CallbackFree(this.vtbl.get_Control)
        CallbackFree(this.vtbl.put_Control)
        CallbackFree(this.vtbl.get_Owner)
        CallbackFree(this.vtbl.put_Owner)
        CallbackFree(this.vtbl.get_OwnerDefaulted)
        CallbackFree(this.vtbl.put_OwnerDefaulted)
        CallbackFree(this.vtbl.get_Group)
        CallbackFree(this.vtbl.put_Group)
        CallbackFree(this.vtbl.get_GroupDefaulted)
        CallbackFree(this.vtbl.put_GroupDefaulted)
        CallbackFree(this.vtbl.get_DiscretionaryAcl)
        CallbackFree(this.vtbl.put_DiscretionaryAcl)
        CallbackFree(this.vtbl.get_DaclDefaulted)
        CallbackFree(this.vtbl.put_DaclDefaulted)
        CallbackFree(this.vtbl.get_SystemAcl)
        CallbackFree(this.vtbl.put_SystemAcl)
        CallbackFree(this.vtbl.get_SaclDefaulted)
        CallbackFree(this.vtbl.put_SaclDefaulted)
        CallbackFree(this.vtbl.CopySecurityDescriptor)
    }
}

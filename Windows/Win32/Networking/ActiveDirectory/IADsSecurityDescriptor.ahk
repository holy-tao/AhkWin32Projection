#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Provides access to properties on an ADSI security descriptor object.
 * @remarks
 * 
 * Use this interface to examine and change the access controls to an Active Directory directory service object. You can also use it to create copies of a security descriptor. To get this interface, use the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-get">IADs.Get</a> method to obtain the <b>ntSecurityDescriptor</b> attribute of the object. For more information about how  to create  a new security descriptor and set it on an object, see <a href="https://docs.microsoft.com/windows/desktop/AD/creating-a-security-descriptor-for-a-new-directory-object">Creating a Security Descriptor for a New Directory Object</a> and <a href="https://docs.microsoft.com/windows/desktop/AD/null-dacls-and-empty-dacls">Null DACLs and Empty DACLs</a>.
 * 
 * Often, it is not possible to modify all portions of the security descriptor. For example, if the current user has full control of an object, but is not an administrator and does not own the object, the user can modify the DACL, but cannot modify the owner. This will cause an error when the <b>ntSecurityDescriptor</b> is updated. To avoid this problem, the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsobjectoptions">IADsObjectOptions</a> interface can be used to specify the specific portions of the security descriptor that should be modified.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadssecuritydescriptor
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsSecurityDescriptor extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsSecurityDescriptor
     * @type {Guid}
     */
    static IID => Guid("{b8c787ca-9bdd-11d0-852c-00c04fd8d503}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Revision", "put_Revision", "get_Control", "put_Control", "get_Owner", "put_Owner", "get_OwnerDefaulted", "put_OwnerDefaulted", "get_Group", "put_Group", "get_GroupDefaulted", "put_GroupDefaulted", "get_DiscretionaryAcl", "put_DiscretionaryAcl", "get_DaclDefaulted", "put_DaclDefaulted", "get_SystemAcl", "put_SystemAcl", "get_SaclDefaulted", "put_SaclDefaulted", "CopySecurityDescriptor"]

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
        retval := BSTR()
        result := ComCall(11, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrOwner 
     * @returns {HRESULT} 
     */
    put_Owner(bstrOwner) {
        bstrOwner := bstrOwner is String ? BSTR.Alloc(bstrOwner).Value : bstrOwner

        result := ComCall(12, this, "ptr", bstrOwner, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_OwnerDefaulted() {
        result := ComCall(13, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT_BOOL} fOwnerDefaulted 
     * @returns {HRESULT} 
     */
    put_OwnerDefaulted(fOwnerDefaulted) {
        result := ComCall(14, this, "short", fOwnerDefaulted, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Group() {
        retval := BSTR()
        result := ComCall(15, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrGroup 
     * @returns {HRESULT} 
     */
    put_Group(bstrGroup) {
        bstrGroup := bstrGroup is String ? BSTR.Alloc(bstrGroup).Value : bstrGroup

        result := ComCall(16, this, "ptr", bstrGroup, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_GroupDefaulted() {
        result := ComCall(17, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT_BOOL} fGroupDefaulted 
     * @returns {HRESULT} 
     */
    put_GroupDefaulted(fGroupDefaulted) {
        result := ComCall(18, this, "short", fGroupDefaulted, "HRESULT")
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
        result := ComCall(21, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT_BOOL} fDaclDefaulted 
     * @returns {HRESULT} 
     */
    put_DaclDefaulted(fDaclDefaulted) {
        result := ComCall(22, this, "short", fDaclDefaulted, "HRESULT")
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
        result := ComCall(25, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT_BOOL} fSaclDefaulted 
     * @returns {HRESULT} 
     */
    put_SaclDefaulted(fSaclDefaulted) {
        result := ComCall(26, this, "short", fSaclDefaulted, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadssecuritydescriptor-copysecuritydescriptor
     */
    CopySecurityDescriptor() {
        result := ComCall(27, this, "ptr*", &ppSecurityDescriptor := 0, "HRESULT")
        return IDispatch(ppSecurityDescriptor)
    }
}

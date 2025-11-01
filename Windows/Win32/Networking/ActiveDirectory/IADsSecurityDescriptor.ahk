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
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_Revision(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, retvalMarshal, retval, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_Control(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, retvalMarshal, retval, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Owner(retval) {
        result := ComCall(11, this, "ptr", retval, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     */
    get_OwnerDefaulted(retval) {
        result := ComCall(13, this, "ptr", retval, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Group(retval) {
        result := ComCall(15, this, "ptr", retval, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     */
    get_GroupDefaulted(retval) {
        result := ComCall(17, this, "ptr", retval, "HRESULT")
        return result
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
     * @param {Pointer<IDispatch>} retval 
     * @returns {HRESULT} 
     */
    get_DiscretionaryAcl(retval) {
        result := ComCall(19, this, "ptr*", retval, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     */
    get_DaclDefaulted(retval) {
        result := ComCall(21, this, "ptr", retval, "HRESULT")
        return result
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
     * @param {Pointer<IDispatch>} retval 
     * @returns {HRESULT} 
     */
    get_SystemAcl(retval) {
        result := ComCall(23, this, "ptr*", retval, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     */
    get_SaclDefaulted(retval) {
        result := ComCall(25, this, "ptr", retval, "HRESULT")
        return result
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
     * @param {Pointer<IDispatch>} ppSecurityDescriptor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadssecuritydescriptor-copysecuritydescriptor
     */
    CopySecurityDescriptor(ppSecurityDescriptor) {
        result := ComCall(27, this, "ptr*", ppSecurityDescriptor, "HRESULT")
        return result
    }
}

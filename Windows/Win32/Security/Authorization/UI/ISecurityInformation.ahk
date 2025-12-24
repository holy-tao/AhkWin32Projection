#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Enables the access control editor to communicate with the caller of the CreateSecurityPage and EditSecurity functions.
 * @see https://docs.microsoft.com/windows/win32/api//aclui/nn-aclui-isecurityinformation
 * @namespace Windows.Win32.Security.Authorization.UI
 * @version v4.0.30319
 */
class ISecurityInformation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISecurityInformation
     * @type {Guid}
     */
    static IID => Guid("{965fc360-16ff-11d0-91cb-00aa00bbb723}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetObjectInformation", "GetSecurity", "SetSecurity", "GetAccessRights", "MapGeneric", "GetInheritTypes", "PropertySheetPageCallback"]

    /**
     * The GetObjectInformation method requests information that the access control editor uses to initialize its pages and to determine the editing options available to the user.
     * @param {Pointer<SI_OBJECT_INFO>} pObjectInfo A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/ns-aclui-si_object_info">SI_OBJECT_INFO</a> structure. Your implementation must fill this structure to pass information back to the access control editor.
     * @returns {HRESULT} Returns S_OK if successful.
     * 
     * Returns a nonzero error code if an error occurs.
     * @see https://docs.microsoft.com/windows/win32/api//aclui/nf-aclui-isecurityinformation-getobjectinformation
     */
    GetObjectInformation(pObjectInfo) {
        result := ComCall(3, this, "ptr", pObjectInfo, "HRESULT")
        return result
    }

    /**
     * The GetSecurity method requests a security descriptor for the securable object whose security descriptor is being edited. The access control editor calls this method to retrieve the object's current or default security descriptor.
     * @param {Integer} RequestedInformation A set of
     * @param {Pointer<PSECURITY_DESCRIPTOR>} ppSecurityDescriptor A pointer to a variable that your implementation must set to a pointer to the object's security descriptor. The security descriptor must include the components requested by the <i>RequestedInformation</i> parameter. 
     * 
     * 
     * 
     * 
     * The system calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function to free the returned pointer.
     * @param {BOOL} fDefault If this parameter is <b>TRUE</b>, <i>ppSecurityDescriptor</i> should return an application-defined default security descriptor for the object. The access control editor uses this default security descriptor to reinitialize the property page. 
     * 
     * 
     * 
     * 
     * The access control editor sets this parameter to <b>TRUE</b> only if the user clicks the <b>Default</b> button. The <b>Default</b> button is displayed only if you set the SI_RESET flag in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nf-aclui-isecurityinformation-getobjectinformation">ISecurityInformation::GetObjectInformation</a> method. If no default security descriptor is available, do not set the SI_RESET flag.
     * 
     * If this flag is <b>FALSE</b>, <i>ppSecurityDescriptor</i> should return the object's current security descriptor.
     * @returns {HRESULT} Returns S_OK if successful.
     * 
     * Returns a nonzero error code if an error occurs. Returns E_ACCESSDENIED if the user does not have permission to read the requested security information.
     * @see https://docs.microsoft.com/windows/win32/api//aclui/nf-aclui-isecurityinformation-getsecurity
     */
    GetSecurity(RequestedInformation, ppSecurityDescriptor, fDefault) {
        result := ComCall(4, this, "uint", RequestedInformation, "ptr", ppSecurityDescriptor, "int", fDefault, "HRESULT")
        return result
    }

    /**
     * The SetSecurity method provides a security descriptor containing the security information the user wants to apply to the securable object. The access control editor calls this method when the user clicks Okay or Apply.
     * @param {Integer} SecurityInformation A set of
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor A pointer to a security descriptor containing the new security information. Do not assume the security descriptor is in <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">self-relative</a> form; it  can be either 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/absolute-and-self-relative-security-descriptors">absolute or self-relative</a>.
     * @returns {HRESULT} Returns S_OK if successful.
     * 
     * Returns a nonzero error code if an error occurs.
     * @see https://docs.microsoft.com/windows/win32/api//aclui/nf-aclui-isecurityinformation-setsecurity
     */
    SetSecurity(SecurityInformation, pSecurityDescriptor) {
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        result := ComCall(5, this, "uint", SecurityInformation, "ptr", pSecurityDescriptor, "HRESULT")
        return result
    }

    /**
     * The GetAccessRights method requests information about the access rights that can be controlled for a securable object.
     * @param {Pointer<Guid>} pguidObjectType A pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that identifies the type of object for which access rights are being requested. If this parameter is <b>NULL</b> or a pointer to GUID_NULL, return the access rights for the object being edited. Otherwise, the GUID identifies a child object type returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nf-aclui-isecurityinformation-getinherittypes">ISecurityInformation::GetInheritTypes</a> method. The GUID corresponds to the <b>InheritedObjectType</b> member of an object-specific ACE.
     * @param {Integer} dwFlags 
     * @param {Pointer<Pointer<SI_ACCESS>>} ppAccess A pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/ns-aclui-si_access">SI_ACCESS</a> structures. The array must include one entry for each access right. You can specify access rights that apply to the object itself, as well as object-specific access rights that apply only to a property set or property on the object.
     * @param {Pointer<Integer>} pcAccesses A pointer to <b>ULONG</b> that indicates the number of entries in the <i>ppAccess</i> array.
     * @param {Pointer<Integer>} piDefaultAccess A pointer to <b>ULONG</b> that indicates the zero-based index of the array entry that contains the default access rights. The access control editor uses this entry as the initial access rights in a new ACE.
     * @returns {HRESULT} If the function succeeds, the function returns  S_OK.
     * 
     *  If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//aclui/nf-aclui-isecurityinformation-getaccessrights
     */
    GetAccessRights(pguidObjectType, dwFlags, ppAccess, pcAccesses, piDefaultAccess) {
        ppAccessMarshal := ppAccess is VarRef ? "ptr*" : "ptr"
        pcAccessesMarshal := pcAccesses is VarRef ? "uint*" : "ptr"
        piDefaultAccessMarshal := piDefaultAccess is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pguidObjectType, "uint", dwFlags, ppAccessMarshal, ppAccess, pcAccessesMarshal, pcAccesses, piDefaultAccessMarshal, piDefaultAccess, "HRESULT")
        return result
    }

    /**
     * The MapGeneric method requests that the generic access rights in an access mask be mapped to their corresponding standard and specific access rights.
     * @param {Pointer<Guid>} pguidObjectType A pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that identifies the type of object to which the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access mask</a> applies. If this member is <b>NULL</b> or a pointer to GUID_NULL, the access mask applies to the object itself.
     * @param {Pointer<Integer>} pAceFlags A pointer to the <b>AceFlags</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-ace_header">ACE_HEADER</a> structure from the ACE whose access mask is being mapped.
     * @param {Pointer<Integer>} pMask A pointer to an access mask that contains the generic access rights to map. Your implementation must map the generic access rights to the corresponding standard and specific access rights for the specified object type.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     *  If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//aclui/nf-aclui-isecurityinformation-mapgeneric
     */
    MapGeneric(pguidObjectType, pAceFlags, pMask) {
        pAceFlagsMarshal := pAceFlags is VarRef ? "char*" : "ptr"
        pMaskMarshal := pMask is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", pguidObjectType, pAceFlagsMarshal, pAceFlags, pMaskMarshal, pMask, "HRESULT")
        return result
    }

    /**
     * The GetInheritTypes method requests information about how ACEs can be inherited by child objects. For more information, see ACE Inheritance.
     * @param {Pointer<Pointer<SI_INHERIT_TYPE>>} ppInheritTypes A pointer to a variable you should set to a pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/ns-aclui-si_inherit_type">SI_INHERIT_TYPE</a> structures. The array should include one entry for each combination of inheritance flags and child object type that you support.
     * @param {Pointer<Integer>} pcInheritTypes A pointer to a variable that you should set to indicate the number of entries in the <i>ppInheritTypes</i> array.
     * @returns {HRESULT} Returns S_OK if successful.
     * 
     * Returns a nonzero error code if an error occurs.
     * @see https://docs.microsoft.com/windows/win32/api//aclui/nf-aclui-isecurityinformation-getinherittypes
     */
    GetInheritTypes(ppInheritTypes, pcInheritTypes) {
        ppInheritTypesMarshal := ppInheritTypes is VarRef ? "ptr*" : "ptr"
        pcInheritTypesMarshal := pcInheritTypes is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, ppInheritTypesMarshal, ppInheritTypes, pcInheritTypesMarshal, pcInheritTypes, "HRESULT")
        return result
    }

    /**
     * The PropertySheetPageCallback method notifies an EditSecurity or CreateSecurityPage caller that an access control editor property page is being created or destroyed.
     * @param {HWND} hwnd If <i>uMsg</i> is PSPCB_SI_INITDIALOG, <i>hwnd</i> is a handle to the property page dialog box. Otherwise, <i>hwnd</i> is <b>NULL</b>.
     * @param {Integer} uMsg 
     * @param {Integer} uPage A value from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/ne-aclui-si_page_type">SI_PAGE_TYPE</a> enumeration type that indicates the type of access control editor property page being created or destroyed.
     * @returns {HRESULT} Returns S_OK if successful.
     * 
     * Returns a nonzero error code if an error occurs.
     * @see https://docs.microsoft.com/windows/win32/api//aclui/nf-aclui-isecurityinformation-propertysheetpagecallback
     */
    PropertySheetPageCallback(hwnd, uMsg, uPage) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(9, this, "ptr", hwnd, "uint", uMsg, "int", uPage, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Used by a fax client application to configure the security on a fax server; also permits the calling application to set and retrieve a security descriptor for the fax server.
 * @remarks
 * 
 * This interface is supported only on Windows Vista or later. For earlier versions of Windows use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxsecurity">IFaxSecurity</a>.
 * 
 * Only an administrator with permissions can configure the security of the fax server. For more information, see <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a>.
 * 
 * A default implementation is provided as <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsecurity2">FaxSecurity2</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxsecurity2
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxSecurity2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxSecurity2
     * @type {Guid}
     */
    static IID => Guid("{17d851f4-d09b-48fc-99c9-8f24c4db9ab1}")

    /**
     * The class identifier for FaxSecurity2
     * @type {Guid}
     */
    static CLSID => Guid("{735c1248-ec89-4c30-a127-656e92e3c4ea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Descriptor", "put_Descriptor", "get_GrantedRights", "Refresh", "Save", "get_InformationType", "put_InformationType"]

    /**
     * @type {VARIANT} 
     */
    Descriptor {
        get => this.get_Descriptor()
        set => this.put_Descriptor(value)
    }

    /**
     * @type {Integer} 
     */
    GrantedRights {
        get => this.get_GrantedRights()
    }

    /**
     * @type {Integer} 
     */
    InformationType {
        get => this.get_InformationType()
        set => this.put_InformationType(value)
    }

    /**
     * Represents the security descriptor for a IFaxServer2 object.
     * @remarks
     * 
     * The <b>IFaxSecurity2::Descriptor</b> property represents the security descriptor, which contains the rights explicitly granted to a user by the fax administrator. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsecurity2-grantedrights-vb">IFaxSecurity2::GrantedRights</a> property reflects the user rights that the fax server grants based on the descriptor. Specifically, if a user has the access right <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2SUBMIT_HIGH</a>, the user can send high-priority, normal-priority and low-priority faxes. If a user has the access right <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2SUBMIT_NORMAL</a>, the user can send normal-priority and low-priority faxes.
     * 
     * To read and write this property, the user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2MANAGE_CONFIG</a> access right. Users with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2QUERY_CONFIG</a> access right can read this property.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxsecurity2-get_descriptor
     */
    get_Descriptor() {
        pvDescriptor := VARIANT()
        result := ComCall(7, this, "ptr", pvDescriptor, "HRESULT")
        return pvDescriptor
    }

    /**
     * Represents the security descriptor for a IFaxServer2 object.
     * @remarks
     * 
     * The <b>IFaxSecurity2::Descriptor</b> property represents the security descriptor, which contains the rights explicitly granted to a user by the fax administrator. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsecurity2-grantedrights-vb">IFaxSecurity2::GrantedRights</a> property reflects the user rights that the fax server grants based on the descriptor. Specifically, if a user has the access right <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2SUBMIT_HIGH</a>, the user can send high-priority, normal-priority and low-priority faxes. If a user has the access right <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2SUBMIT_NORMAL</a>, the user can send normal-priority and low-priority faxes.
     * 
     * To read and write this property, the user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2MANAGE_CONFIG</a> access right. Users with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2QUERY_CONFIG</a> access right can read this property.
     * 
     * 
     * @param {VARIANT} vDescriptor 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxsecurity2-put_descriptor
     */
    put_Descriptor(vDescriptor) {
        result := ComCall(8, this, "ptr", vDescriptor, "HRESULT")
        return result
    }

    /**
     * Retrieves a combination of the fax server access rights granted to the user referencing this property.
     * @remarks
     * 
     * The <b>IFaxSecurity2::GrantedRights</b> property reflects rights granted by the fax server, while the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsecurity2-descriptor">Descriptor</a> property represents the security descriptor, which contains the rights explicitly granted to a user by the fax administrator.
     * 
     * To read this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2QUERY_CONFIG</a> access right.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxsecurity2-get_grantedrights
     */
    get_GrantedRights() {
        result := ComCall(9, this, "int*", &pGrantedRights := 0, "HRESULT")
        return pGrantedRights
    }

    /**
     * Refreshes FaxSecurity2 object information from the fax server.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxsecurity2-refresh
     */
    Refresh() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Saves the FaxSecurity object data.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxsecurity2-save
     */
    Save() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the security information type.
     * @remarks
     * 
     * The information type is a bitwise combination that indicates what security information will be retrieved from the server when requesting a security descriptor using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsecurity2-descriptor">Descriptor</a> property, or when refreshing the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsecurity2">FaxSecurity2</a> object using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsecurity2-refresh-vb">IFaxSecurity2::Refresh</a> method. The information type property also determines what information is sent to the fax server when you save changes to the <b>FaxSecurity2</b> object using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsecurity2-save-vb">IFaxSecurity2::Save</a> method.
     * 
     * The bits are specified in the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> structure, defined in Winnt.h. Each item of security information is designated by a bit flag. The following values specify the bits applicable to the fax service:
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>DACL_SECURITY_INFORMATION</td>
     * <td>Indicates that the discretionary access control list (ACL) of the object is being referenced.</td>
     * </tr>
     * <tr>
     * <td>GROUP_SECURITY_INFORMATION</td>
     * <td>Indicates that the primary group identifier of the object is being referenced.</td>
     * </tr>
     * <tr>
     * <td>OWNER_SECURITY_INFORMATION</td>
     * <td>Indicates that the owner identifier of the object is being referenced.</td>
     * </tr>
     * <tr>
     * <td>SACL_SECURITY_INFORMATION</td>
     * <td>Indicates that the system ACL of the object is being referenced.</td>
     * </tr>
     * </table>
     *  
     * 
     * Set the <b>IFaxSecurity2::InformationType</b> property before you get the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsecurity2-descriptor">Descriptor</a> property, to ensure that you receive the desired information, and that you request only the information for which you have the appropriate access rights. Also, the <b>IFaxSecurity2::InformationType</b> property will affect what information is sent to the fax server when you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsecurity2-save-vb">IFaxSecurity2::Save</a> method. If you do not set the <b>IFaxSecurity2::InformationType</b> property, it defaults to the flags DACL_SECURITY_INFORMATION, GROUP_SECURITY_INFORMATION, and OWNER_SECURITY_INFORMATION.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxsecurity2-get_informationtype
     */
    get_InformationType() {
        result := ComCall(12, this, "int*", &plInformationType := 0, "HRESULT")
        return plInformationType
    }

    /**
     * Retrieves the security information type.
     * @remarks
     * 
     * The information type is a bitwise combination that indicates what security information will be retrieved from the server when requesting a security descriptor using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsecurity2-descriptor">Descriptor</a> property, or when refreshing the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsecurity2">FaxSecurity2</a> object using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsecurity2-refresh-vb">IFaxSecurity2::Refresh</a> method. The information type property also determines what information is sent to the fax server when you save changes to the <b>FaxSecurity2</b> object using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsecurity2-save-vb">IFaxSecurity2::Save</a> method.
     * 
     * The bits are specified in the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> structure, defined in Winnt.h. Each item of security information is designated by a bit flag. The following values specify the bits applicable to the fax service:
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>DACL_SECURITY_INFORMATION</td>
     * <td>Indicates that the discretionary access control list (ACL) of the object is being referenced.</td>
     * </tr>
     * <tr>
     * <td>GROUP_SECURITY_INFORMATION</td>
     * <td>Indicates that the primary group identifier of the object is being referenced.</td>
     * </tr>
     * <tr>
     * <td>OWNER_SECURITY_INFORMATION</td>
     * <td>Indicates that the owner identifier of the object is being referenced.</td>
     * </tr>
     * <tr>
     * <td>SACL_SECURITY_INFORMATION</td>
     * <td>Indicates that the system ACL of the object is being referenced.</td>
     * </tr>
     * </table>
     *  
     * 
     * Set the <b>IFaxSecurity2::InformationType</b> property before you get the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsecurity2-descriptor">Descriptor</a> property, to ensure that you receive the desired information, and that you request only the information for which you have the appropriate access rights. Also, the <b>IFaxSecurity2::InformationType</b> property will affect what information is sent to the fax server when you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsecurity2-save-vb">IFaxSecurity2::Save</a> method. If you do not set the <b>IFaxSecurity2::InformationType</b> property, it defaults to the flags DACL_SECURITY_INFORMATION, GROUP_SECURITY_INFORMATION, and OWNER_SECURITY_INFORMATION.
     * 
     * 
     * @param {Integer} lInformationType 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxsecurity2-put_informationtype
     */
    put_InformationType(lInformationType) {
        result := ComCall(13, this, "int", lInformationType, "HRESULT")
        return result
    }
}

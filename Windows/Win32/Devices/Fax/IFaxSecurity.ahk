#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxSecurity configuration object is used by a fax client application to configure the security on a fax server, and permits the calling application to set and retrieve a security descriptor for the fax server.
 * @remarks
 * 
 * Only an administrator with permissions can configure the security of the fax server. For more information, see <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a>.
 * 
 * A default implementation of <b>IFaxSecurity</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsecurity">FaxSecurity</a> object.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxsecurity
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxSecurity extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxSecurity
     * @type {Guid}
     */
    static IID => Guid("{77b508c1-09c0-47a2-91eb-fce7fdf2690e}")

    /**
     * The class identifier for FaxSecurity
     * @type {Guid}
     */
    static CLSID => Guid("{10c4ddde-abf0-43df-964f-7f3ac21a4c7b}")

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
     * The Descriptor property represents the security descriptor for a IFaxServer object.
     * @remarks
     * 
     * The <b>IFaxSecurity::Descriptor</b> property represents the security descriptor, which contains the rights explicitly granted to a user by the fax administrator. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsecurity-grantedrights-vb">IFaxSecurity::get_GrantedRights</a> property reflects the user rights that the fax server grants based on the descriptor. Specifically, if a user has the access right <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farSUBMIT_HIGH</a>, the user can send high-priority, normal-priority and low-priority faxes. If a user has the access right <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farSUBMIT_NORMAL</a>, the user can send normal-priority and low-priority faxes.
     * 
     * To read this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxsecurity-get_descriptor
     */
    get_Descriptor() {
        pvDescriptor := VARIANT()
        result := ComCall(7, this, "ptr", pvDescriptor, "HRESULT")
        return pvDescriptor
    }

    /**
     * The Descriptor property represents the security descriptor for a IFaxServer object.
     * @remarks
     * 
     * The <b>IFaxSecurity::Descriptor</b> property represents the security descriptor, which contains the rights explicitly granted to a user by the fax administrator. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsecurity-grantedrights-vb">IFaxSecurity::get_GrantedRights</a> property reflects the user rights that the fax server grants based on the descriptor. Specifically, if a user has the access right <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farSUBMIT_HIGH</a>, the user can send high-priority, normal-priority and low-priority faxes. If a user has the access right <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farSUBMIT_NORMAL</a>, the user can send normal-priority and low-priority faxes.
     * 
     * To read this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @param {VARIANT} vDescriptor 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxsecurity-put_descriptor
     */
    put_Descriptor(vDescriptor) {
        result := ComCall(8, this, "ptr", vDescriptor, "HRESULT")
        return result
    }

    /**
     * The IFaxSecurity::get_GrantedRights property is a combination of the fax server access rights granted to the user referencing this property.
     * @remarks
     * 
     * The <b>IFaxSecurity::get_GrantedRights</b> property reflects rights granted by the fax server, while the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nf-faxcomex-ifaxsecurity-get_descriptor">IFaxSecurity::Descriptor</a> property represents the security descriptor, which contains the rights explicitly granted to a user by the fax administrator.
     * 
     * To read this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxsecurity-get_grantedrights
     */
    get_GrantedRights() {
        result := ComCall(9, this, "int*", &pGrantedRights := 0, "HRESULT")
        return pGrantedRights
    }

    /**
     * The IFaxSecurity::Refresh method refreshes FaxSecurity object information from the fax server.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxsecurity-refresh
     */
    Refresh() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * The IFaxSecurity::Save method saves the FaxSecurity object data.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxsecurity-save
     */
    Save() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * The IFaxSecurity::InformationType property represents the security information type.
     * @remarks
     * 
     * The information type is a bitwise combination that indicates what security information will be retrieved from the server when requesting a security descriptor using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nf-faxcomex-ifaxsecurity-get_descriptor">IFaxSecurity::Descriptor</a> property or when refreshing the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxsecurity">IFaxSecurity</a> object using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsecurity-refresh-vb">IFaxSecurity::Refresh</a> method. The information type also determines what information is sent to the fax server when you save changes to the <b>IFaxSecurity</b> object using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsecurity-save-vb">IFaxSecurity::Save</a> method.
     * 
     * The bits are specified in the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> structure, defined in Winnt.h. Each item of security information is designated by a bit flag. The following values specify the bits applicable to the fax service.
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
     * You should set the <b>IFaxSecurity::InformationType</b> property before you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nf-faxcomex-ifaxsecurity-get_descriptor">IFaxSecurity::get_Descriptor</a> method to ensure that you receive the information that you want and to ensure that you request only the information for which you have the appropriate access rights. Also, the <b>IFaxSecurity::InformationType</b> property will affect what information is sent to the fax server when you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsecurity-save-vb">IFaxSecurity::Save</a> method. If you do not set the <b>IFaxSecurity::InformationType</b> property, it defaults to the flags DACL_SECURITY_INFORMATION, GROUP_SECURITY_INFORMATION, and OWNER_SECURITY_INFORMATION.
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxsecurity-get_informationtype
     */
    get_InformationType() {
        result := ComCall(12, this, "int*", &plInformationType := 0, "HRESULT")
        return plInformationType
    }

    /**
     * The IFaxSecurity::InformationType property represents the security information type.
     * @remarks
     * 
     * The information type is a bitwise combination that indicates what security information will be retrieved from the server when requesting a security descriptor using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nf-faxcomex-ifaxsecurity-get_descriptor">IFaxSecurity::Descriptor</a> property or when refreshing the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxsecurity">IFaxSecurity</a> object using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsecurity-refresh-vb">IFaxSecurity::Refresh</a> method. The information type also determines what information is sent to the fax server when you save changes to the <b>IFaxSecurity</b> object using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsecurity-save-vb">IFaxSecurity::Save</a> method.
     * 
     * The bits are specified in the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> structure, defined in Winnt.h. Each item of security information is designated by a bit flag. The following values specify the bits applicable to the fax service.
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
     * You should set the <b>IFaxSecurity::InformationType</b> property before you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nf-faxcomex-ifaxsecurity-get_descriptor">IFaxSecurity::get_Descriptor</a> method to ensure that you receive the information that you want and to ensure that you request only the information for which you have the appropriate access rights. Also, the <b>IFaxSecurity::InformationType</b> property will affect what information is sent to the fax server when you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxsecurity-save-vb">IFaxSecurity::Save</a> method. If you do not set the <b>IFaxSecurity::InformationType</b> property, it defaults to the flags DACL_SECURITY_INFORMATION, GROUP_SECURITY_INFORMATION, and OWNER_SECURITY_INFORMATION.
     * 
     * @param {Integer} lInformationType 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxsecurity-put_informationtype
     */
    put_InformationType(lInformationType) {
        result := ComCall(13, this, "int", lInformationType, "HRESULT")
        return result
    }
}

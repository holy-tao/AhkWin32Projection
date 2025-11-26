#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface accesses connection parameters and preferences stored in Mobile Broadband profiles.
 * @remarks
 * 
 * <b>IMbnConnectionProfile</b> objects are provided by calls to the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnconnectionprofilemanager-getconnectionprofile">GetConnectionProfile</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnconnectionprofilemanager-getconnectionprofiles">GetConnectionProfiles</a> methods of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectionprofilemanager">IMbnConnectionProfileManager</a> interface.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbnconnectionprofile
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnConnectionProfile extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnConnectionProfile
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-2010-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProfileXmlData", "UpdateProfile", "Delete"]

    /**
     * Gets the XML data of the current profile.
     * @returns {BSTR} A pointer to a string containing the profile in XML format.  If the method returns S_OK, the calling application must free the allocated memory by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnconnectionprofile-getprofilexmldata
     */
    GetProfileXmlData() {
        profileData := BSTR()
        result := ComCall(3, this, "ptr", profileData, "HRESULT")
        return profileData
    }

    /**
     * Updates the contents of the profile.
     * @param {PWSTR} strProfile A string that contains the profile data in XML format compliant with the <a href="https://docs.microsoft.com/windows/desktop/mbn/schema-schema">Mobile Broadband Profile Schema Reference</a>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The profile is invalid and likely has been removed from the system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR _NOT_FOUND)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The profile is invalid and has likely been removed from the system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_FILE_NOT_FOUND)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The profile data specifies an icon file that cannot be found at the indicated location.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_SERVICE_NOT_ACTIVE)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Mobile Broadband service is not running on this system.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnconnectionprofile-updateprofile
     */
    UpdateProfile(strProfile) {
        strProfile := strProfile is String ? StrPtr(strProfile) : strProfile

        result := ComCall(4, this, "ptr", strProfile, "HRESULT")
        return result
    }

    /**
     * Deletes the profile from the system.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The profile is invalid and likely has been removed from the system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR _NOT_FOUND)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The profile is invalid and has likely been removed from the system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_SERVICE_NOT_ACTIVE)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Mobile Broadband service is not running on this system.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnconnectionprofile-delete
     */
    Delete() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}

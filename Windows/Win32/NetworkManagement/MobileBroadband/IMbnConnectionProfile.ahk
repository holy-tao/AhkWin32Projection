#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This interface accesses connection parameters and preferences stored in Mobile Broadband profiles.
 * @remarks
 * <b>IMbnConnectionProfile</b> objects are provided by calls to the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnconnectionprofilemanager-getconnectionprofile">GetConnectionProfile</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnconnectionprofilemanager-getconnectionprofiles">GetConnectionProfiles</a> methods of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectionprofilemanager">IMbnConnectionProfileManager</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbnconnectionprofile
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct IMbnConnectionProfile extends IUnknown {
    /**
     * The interface identifier for IMbnConnectionProfile
     * @type {Guid}
     */
    static IID := Guid("{dcbbbab6-2010-4bbb-aaee-338e368af6fa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMbnConnectionProfile interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetProfileXmlData : IntPtr
        UpdateProfile     : IntPtr
        Delete            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMbnConnectionProfile.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the XML data of the current profile.
     * @remarks
     * The data provided by this method complies with the <a href="https://docs.microsoft.com/windows/desktop/mbn/schema-schema">Mobile Broadband Profile Schema Reference</a>.  The data will not contain the password used in the profile.
     * @returns {BSTR} A pointer to a string containing the profile in XML format.  If the method returns S_OK, the calling application must free the allocated memory by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnconnectionprofile-getprofilexmldata
     */
    GetProfileXmlData() {
        profileData := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, profileData, "HRESULT")
        return profileData
    }

    /**
     * Updates the contents of the profile.
     * @remarks
     * The data provided by this method complies with the <a href="https://docs.microsoft.com/windows/desktop/mbn/schema-schema">Mobile Broadband Profile Schema Reference</a>.
     * 
     * This method should be called when the device for the profile is present in the system.
     * 
     * This is a synchronous operation.  If successful, the Mobile Broadband service will notify the calling application by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnconnectionprofileevents-onprofileupdate">OnProfileUpdate</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectionprofileevents">IMbnConnectionProfileEvents</a> interface.
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
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnconnectionprofile-updateprofile
     */
    UpdateProfile(strProfile) {
        strProfile := strProfile is String ? StrPtr(strProfile) : strProfile

        result := ComCall(4, this, "ptr", strProfile, "HRESULT")
        return result
    }

    /**
     * Deletes the profile from the system.
     * @remarks
     * This is an asynchronous operation.  The Mobile Broadband service will notify the calling application by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnconnectionprofilemanagerevents-onconnectionprofileremoval">OnConnectionProfileRemoval</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectionprofilemanagerevents">IMbnConnectionProfileManagerEvents</a> interface.
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
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnconnectionprofile-delete
     */
    Delete() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMbnConnectionProfile.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProfileXmlData := CallbackCreate(GetMethod(implObj, "GetProfileXmlData"), flags, 2)
        this.vtbl.UpdateProfile := CallbackCreate(GetMethod(implObj, "UpdateProfile"), flags, 2)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProfileXmlData)
        CallbackFree(this.vtbl.UpdateProfile)
        CallbackFree(this.vtbl.Delete)
    }
}

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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnconnectionprofile-getprofilexmldata
     */
    GetProfileXmlData() {
        profileData := BSTR()
        result := ComCall(3, this, "ptr", profileData, "HRESULT")
        return profileData
    }

    /**
     * 
     * @param {PWSTR} strProfile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnconnectionprofile-updateprofile
     */
    UpdateProfile(strProfile) {
        strProfile := strProfile is String ? StrPtr(strProfile) : strProfile

        result := ComCall(4, this, "ptr", strProfile, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnconnectionprofile-delete
     */
    Delete() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}

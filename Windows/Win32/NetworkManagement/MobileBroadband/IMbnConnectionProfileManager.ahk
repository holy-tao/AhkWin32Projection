#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMbnConnectionProfile.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to connection profiles and connection notifications.
 * @remarks
 * 
 * This interface can be used to access the following notification interfaces.<table>
 * <tr>
 * <th>Notification Sink to Register   </th>
 * <th>IID</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectionprofilemanagerevents">IMbnConnectionProfileManagerEvents</a>
 * </td>
 * <td><b>IID_IMbnConnectionProfileManagerEvents</b></td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectionprofileevents">MbnConnectionProfileEvents</a>
 * </td>
 * <td><b>IID_IMbnConnectionProfileEvents</b></td>
 * </tr>
 * </table>
 *  
 * 
 * 
 * 
 * An application can obtain this interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> with a class id of <b>CLSID_IMbnConnectionProfileManager</b>.
 * 
 * The following procedure describes how to register for notifications.
 * 
 * <ol>
 * <li>Get an <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iconnectionpointcontainer">IConnectionPointContainer</a>  interface by calling <b>QueryInterface</b> on an <b>IMbnConnectionProfileManager</b> object.</li>
 * <li>
 * For each notification sink to register, call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpointcontainer-findconnectionpoint">FindConnectionPoint</a> on the returned interface and pass IID corresponding to the notification sink to <i>riid</i>.
 * 
 * </li>
 * <li>For each connection point returned by step 2, call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-advise">Advise</a> on the returned connection point and pass a pointer to an <b>IUnknown</b> interface on an object that implements the matching notification interface to <i>pUnk</i>.</li>
 * </ol>
 * Notifications can be terminated by calling <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-unadvise">Unadvise</a> on the connection point returned in step 2.
 * 
 * To view some code that registers for COM notifications, see the Client section of the <a href="https://docs.microsoft.com/archive/msdn-magazine/2007/september/clr-inside-out-com-connection-points">COM Connection Points</a> article.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbnconnectionprofilemanager
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnConnectionProfileManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnConnectionProfileManager
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-200f-4bbb-aaee-338e368af6fa}")

    /**
     * The class identifier for MbnConnectionProfileManager
     * @type {Guid}
     */
    static CLSID => Guid("{bdfee05a-4418-11dd-90ed-001c257ccff1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetConnectionProfiles", "GetConnectionProfile", "CreateConnectionProfile"]

    /**
     * Gets a list of connection profiles associated with the device.
     * @param {IMbnInterface} mbnInterface An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a> that represents the device for which the profile request applies.  If this is <b>NULL</b>, the function will return all of the profiles that are present in the system.
     * @returns {Pointer<SAFEARRAY>} An array of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectionprofile">IMbnConnectionProfile</a> interfaces that represent all the available connection profiles for the device.  If this method returns anything other than <b>S_OK</b>, the array pointer is <b>NULL</b>, otherwise the calling application must eventually free the allocated memory by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-safearraydestroy">SafeArrayDestroy</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnconnectionprofilemanager-getconnectionprofiles
     */
    GetConnectionProfiles(mbnInterface) {
        result := ComCall(3, this, "ptr", mbnInterface, "ptr*", &connectionProfiles := 0, "HRESULT")
        return connectionProfiles
    }

    /**
     * Gets a specific connection profile associated with the given Mobile Broadband device.
     * @param {IMbnInterface} mbnInterface An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a> that represents the device for which the profile request applies.  If <i>mbnInterface</i> is <b>NULL</b>, then this function will return the profile of the given name associated with any device in the system.
     * @param {PWSTR} profileName A null-terminated string that contains the name of the connection profile.
     * @returns {IMbnConnectionProfile} An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectionprofile">IMbnConnectionProfile</a> interface that represents the desired connection profile.  If this method returns anything other than <b>S_OK</b>, this is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnconnectionprofilemanager-getconnectionprofile
     */
    GetConnectionProfile(mbnInterface, profileName) {
        profileName := profileName is String ? StrPtr(profileName) : profileName

        result := ComCall(4, this, "ptr", mbnInterface, "ptr", profileName, "ptr*", &connectionProfile := 0, "HRESULT")
        return IMbnConnectionProfile(connectionProfile)
    }

    /**
     * Creates a new connection profile for the device.
     * @param {PWSTR} xmlProfile A null-terminated string that contains the profile data in XML format compliant with the <a href="https://docs.microsoft.com/windows/desktop/mbn/schema-schema">Mobile Broadband Profile Schema Reference</a>.
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
     * <dt><b>HRESULT_FROM_WIN32(ERROR_ALREADY_EXISTS)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A profile with the given name already exists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_MBN_INVALID_PROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The profile does not conform to the Mobile Broadband profile schema.
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
     * The icon file location passed in the profile is not valid or not accessible.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_MBN_DEFAULT_PROFILE_EXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application specified the default profile flag in the XML data, however the default profile already exists for the Mobile Broadband device.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnconnectionprofilemanager-createconnectionprofile
     */
    CreateConnectionProfile(xmlProfile) {
        xmlProfile := xmlProfile is String ? StrPtr(xmlProfile) : xmlProfile

        result := ComCall(5, this, "ptr", xmlProfile, "HRESULT")
        return result
    }
}

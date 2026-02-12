#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDRMReader interface provides methods to configure the DRM component and to manage DRM license acquisition and individualization of client applications.
 * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nn-wmsdkidl-iwmdrmreader
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMDRMReader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDRMReader
     * @type {Guid}
     */
    static IID => Guid("{d2827540-3ee7-432c-b14c-dc17f085d3b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AcquireLicense", "CancelLicenseAcquisition", "Individualize", "CancelIndividualization", "MonitorLicenseAcquisition", "CancelMonitorLicenseAcquisition", "SetDRMProperty", "GetDRMProperty"]

    /**
     * The AcquireLicense method begins the license acquisition process.
     * @remarks
     * This is an asynchronous call that returns immediately.
     * 
     * <b>For silent acquisition: </b>When the license acquisition is complete, <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmstatuscallback-onstatus">IWMStatusCallback::OnStatus</a> is called with the <i>status</i> parameter set to <b>WMT_ACQUIRE_LICENSE</b>. If the license acquisition was successful, the <i>pvalue</i> parameter is set to a byte pointer to a <a href="https://docs.microsoft.com/windows/desktop/wmformat/wm-get-license-data">WM_GET_LICENSE_DATA</a> structure. If there was an error during the license acquisition, the <b>HRESULT</b> from the <b>OnStatus</b> call holds the appropriate error code.
     * 
     * <b>For nonsilent acquisition:
     *           </b><b>OnStatus</b> will return immediately and send a <b>WMT_ACQUIRE_LICENSE</b> event to the application. In that case, the <b>WM_GET_LICENSE_DATA</b> structure contains information about the URL to be used to acquire the license.
     * @param {Integer} dwFlags <b>DWORD</b> containing the relevant flags.
     * 
     * <table>
     * <tr>
     * <th>Flag
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>0x1</td>
     * <td>Indicates that the method will attempt to acquire the license silently.</td>
     * </tr>
     * <tr>
     * <td>0x0</td>
     * <td>Indicates that the <b>OnStatus</b> callback will return a URL to use on the Web to acquire a license.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory to complete the task.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmdrmreader-acquirelicense
     */
    AcquireLicense(dwFlags) {
        result := ComCall(3, this, "uint", dwFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The CancelLicenseAcquisition method cancels a current call to the AcquireLicense method.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmdrmreader-cancellicenseacquisition
     */
    CancelLicenseAcquisition() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Individualize method individualizes the client by updating their DRM system components.
     * @remarks
     * This is an asynchronous call that returns immediately. To abandon the attempt, call <b>CancelIndividualization</b>.
     * 
     * <div class="alert"><b>Important</b>  Because this operation will cause the user's system to be modified, you should display a message that explains what this operation will do and let the user choose whether or not to individualize. For more information and suggested message text, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/drm-individualization">DRM Individualization</a>.</div>
     * <div> </div>
     * Individualization is the process of making the DRM client unique by downloading and installing an individualized component from the Microsoft Individualization Service. The entire process is performed automatically after an application calls the <b>Individualize</b> method. The application is informed of the progress of the individualization process through repeated <b>WMT_INDIVIDUALIZE</b> events, each of which has an associated <a href="https://docs.microsoft.com/windows/desktop/wmformat/wm-individualize-status">WM_INDIVIDUALIZE_STATUS</a> structure which is sent to the application's <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmstatuscallback-onstatus">IWMStatusCallback::OnStatus</a> callback method.
     * 
     * There are two times to initiate the individualization process: the first is when a piece of content requires it, and the second is when a player individualizes the client as part of the setup. In the latter case, there is no reason to individualize the client again.
     * @param {Integer} dwFlags <b>DWORD</b> containing the relevant flags.
     * 
     * <table>
     * <tr>
     * <th>Flag
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>0x0</td>
     * <td>Indicates that the client can be individualized again.</td>
     * </tr>
     * <tr>
     * <td>0x1</td>
     * <td>Indicates that the client will not be individualized again.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A null or invalid argument has been passed in.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmdrmreader-individualize
     */
    Individualize(dwFlags) {
        result := ComCall(5, this, "uint", dwFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The CancelIndividualization method cancels a current call to the Individualize method.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmdrmreader-cancelindividualization
     */
    CancelIndividualization() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The MonitorLicenseAcquisition method, in nonsilent license acquisition, informs the application when a license has been successfully acquired.
     * @remarks
     * This method should be used whenever nonsilent license acquisition has been initiated for DRM version 7 content. It is an asynchronous call that returns immediately. This method creates a thread that periodically checks the local license store to determine when the requested license has been received. To cancel the attempt, call <b>CancelMonitorLicenseAcquisition</b>.
     * 
     * When the license acquisition is completed (whether successful or otherwise), the application is notified through a <b>WMT_LICENSE_ACQUIRE</b> event that is sent to the application's <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmstatuscallback-onstatus">IWMStatusCallback::OnStatus</a> method.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmdrmreader-monitorlicenseacquisition
     */
    MonitorLicenseAcquisition() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The CancelMonitorLicenseAcquisition method cancels a current call to the MonitorLicenseAcquisition method.
     * @remarks
     * This method terminates the thread that periodically checks the license store to determine when the most recently requested license has been obtained.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmdrmreader-cancelmonitorlicenseacquisition
     */
    CancelMonitorLicenseAcquisition() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetDRMProperty method on the reader object is used to set a DRM property, such as the DRM_Rights property.
     * @param {PWSTR} pwstrName Specifies the name of the property to set.
     * @param {Integer} dwType One member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_attr_datatype">WMT_ATTR_DATATYPE</a> enumeration type. The only supported value for this method is <b>WMT_TYPE_STRING</b>.
     * @param {Pointer<Integer>} pValue Pointer to a byte array containing the attribute value.
     * @param {Integer} cbLength Size of <i>pValue</i>, in bytes.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmdrmreader-setdrmproperty
     */
    SetDRMProperty(pwstrName, dwType, pValue, cbLength) {
        pwstrName := pwstrName is String ? StrPtr(pwstrName) : pwstrName

        pValueMarshal := pValue is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, "ptr", pwstrName, "int", dwType, pValueMarshal, pValue, "ushort", cbLength, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetDRMProperty method retrieves DRM-specific file attributes and run-time properties.
     * @remarks
     * This method can be used to retrieve both DRM header attributes and DRM license information for the current file. DRM-related constants are defined in drmexternals.idl and wmsdkidl.idl.
     * 
     * If you specify a "license state" constant, the returned data is a pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd757942(v=vs.85)">WM_LICENSE_STATE_DATA</a> structure that fully describes the terms of the license for the particular right. The supported license state constants are described in the following table.
     * 
     * <table>
     * <tr>
     * <th>Constant
     *             </th>
     * <th>Literal string value
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>g_wszWMDRM_LicenseState_CollaborativePlay</td>
     * <td>"LicenseStateData.CollaborativePlay"</td>
     * <td>License restrictions on playing the file as part of a collaborative peer-to-peer networking scenario.</td>
     * </tr>
     * <tr>
     * <td>g_wszWMDRM_LicenseState_Copy</td>
     * <td>"LicenseStateData.Copy"</td>
     * <td>License restrictions on copying the file to a device.</td>
     * </tr>
     * <tr>
     * <td>g_wszWMDRM_LicenseState_CopyToCD</td>
     * <td>"LicenseStateData.Print.redbook"</td>
     * <td>License restrictions on copying the file to CD.For DRM version 10 licenses, use g_wszWMDRM_LicenseState_Copy for all copy actions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>g_wszWMDRM_LicenseState_CopyToNonSDMIDevice</td>
     * <td>"LicenseStateData.Transfer.NONSDMI"</td>
     * <td>License restrictions on copying the file to a non-SMDI device.For DRM version 10 licenses, use g_wszWMDRM_LicenseState_Copy for all copy actions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>g_wszWMDRM_LicenseState_CopyToSDMIDevice</td>
     * <td>"LicenseStateData.Transfer.SDMI"</td>
     * <td>License restrictions on copying the file to an <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmformat-glossary">SDMI</a> device.For DRM version 10 licenses, use g_wszWMDRM_LicenseState_Copy for all copy actions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>g_wszWMDRM_LicenseState_Playback</td>
     * <td>"LicenseStateData.Play"</td>
     * <td>License restrictions on playing the file.</td>
     * </tr>
     * <tr>
     * <td>g_wszWMDRM_LicenseState_PlaylistBurn</td>
     * <td>"LicenseStateData.PlaylistBurn"</td>
     * <td>License restrictions on copying the file to Red Book audio CD as part of a playlist.</td>
     * </tr>
     * </table>
     *  
     * 
     * If you specify an "action allowed" constant, the returned data is a Boolean that indicates whether a specified action is allowed at this time. The supported constants are:
     * 
     * <table>
     * <tr>
     * <th>Constant
     *             </th>
     * <th>Literal string value
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>g_wszWMDRM_ActionAllowed_Backup</td>
     * <td>"ActionAllowed.Backup"</td>
     * <td>Right to back up the file now.</td>
     * </tr>
     * <tr>
     * <td>g_wszWMDRM_ActionAllowed_CollaborativePlay</td>
     * <td>"ActionAllowed.CollaborativePlay"</td>
     * <td>Right to play the file as part of a collaborative peer-to-peer networking scenario.</td>
     * </tr>
     * <tr>
     * <td>g_wszWMDRM_ActionAllowed_Copy</td>
     * <td>"ActionAllowed.Copy"</td>
     * <td>Right to copy the file to a device.</td>
     * </tr>
     * <tr>
     * <td>g_wszWMDRM_ActionAllowed_CopyToCD</td>
     * <td>"ActionAllowed.Print.redbook"</td>
     * <td>Right to copy file to CD.For DRM version 10 licenses, check g_wszWMDRM_ActionAllowed_Copy for all copy actions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>g_wszWMDRM_ActionAllowed_CopyToSDMIDevice</td>
     * <td>"ActionAllowed.Transfer.SDMI"</td>
     * <td>Right to copy file to an SDMI device.For DRM version 10 licenses, check g_wszWMDRM_ActionAllowed_Copy for all copy actions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>g_wszWMDRM_ActionAllowed_CopyToNonSDMIDevice</td>
     * <td>"ActionAllowed.Transfer.NONSDMI"</td>
     * <td>Right to copy file to a non-SMDI device.For DRM version 10 licenses, check g_wszWMDRM_ActionAllowed_Copy for all copy actions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>g_wszWMDRM_ActionAllowed_Playback</td>
     * <td>"ActionAllowed.Play"</td>
     * <td>Right to play file.</td>
     * </tr>
     * <tr>
     * <td>g_wszWMDRM_ActionAllowed_PlaylistBurn</td>
     * <td>"ActionAllowed.PlaylistBurn"</td>
     * <td>Right to copy the file to Red Book audio CD as part of a playlist.</td>
     * </tr>
     * </table>
     *  
     * 
     * If you specify a "DRM Header" constant, the returned value is the string literal for the specified property. The supported DRM Header constants are:
     * 
     * <table>
     * <tr>
     * <th>Constant
     *             </th>
     * <th>Literal string value
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>g_wszWMDRM_DRMHeader_KeyID</td>
     * <td>"DRMHeader.KID"</td>
     * <td>DRM key value.</td>
     * </tr>
     * <tr>
     * <td>g_wszWMDRM_DRMHeader_LicenseAcqURL</td>
     * <td>"DRMHeader.LAINFO"</td>
     * <td>DRM license acquisition URL.</td>
     * </tr>
     * <tr>
     * <td>g_wszWMDRM_DRMHeader_ContentID</td>
     * <td>"DRMHeader.CID"</td>
     * <td>DRM content ID.</td>
     * </tr>
     * <tr>
     * <td>g_wszWMDRM_DRMHeader_IndividualizedVersion</td>
     * <td>"DRMHeader.SECURITYVERSION"</td>
     * <td>Individualized version.</td>
     * </tr>
     * <tr>
     * <td>g_wszWMDRM_DRMHeader_ContentDistributor</td>
     * <td>"DRMHeader.ContentDistributor"</td>
     * <td>Content distributor.</td>
     * </tr>
     * <tr>
     * <td>g_wszWMDRM_DRMHeader_SubscriptionContentID</td>
     * <td>"DRMHeader.SubscriptionContentID"</td>
     * <td>Subscription content ID.</td>
     * </tr>
     * </table>
     *  
     * 
     * Before calling this method on a new file, always call the helper function <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-wmiscontentprotected">WMIsContentProtected</a> to ensure that the file is protected with DRM. It is important to do this because in some cases this method might succeed when called on unprotected content.
     * @param {PWSTR} pwstrName Specifies the property or file attribute to retrieve.
     * @param {Pointer<Integer>} pdwType Pointer that receives the data type of the returned value.
     * @param {Pointer<Integer>} pValue Pointer to the value requested in <i>pwstrName</i>.
     * @param {Pointer<Integer>} pcbLength Size of <i>pValue</i>, in bytes.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmdrmreader-getdrmproperty
     */
    GetDRMProperty(pwstrName, pdwType, pValue, pcbLength) {
        pwstrName := pwstrName is String ? StrPtr(pwstrName) : pwstrName

        pdwTypeMarshal := pdwType is VarRef ? "int*" : "ptr"
        pValueMarshal := pValue is VarRef ? "char*" : "ptr"
        pcbLengthMarshal := pcbLength is VarRef ? "ushort*" : "ptr"

        result := ComCall(10, this, "ptr", pwstrName, pdwTypeMarshal, pdwType, pValueMarshal, pValue, pcbLengthMarshal, pcbLength, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

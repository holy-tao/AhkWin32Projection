#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\WindowsMediaFormat\IWMProfile.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IConfigAsfWriter interface configures the WM ASF Writer filter.
 * @see https://learn.microsoft.com/windows/win32/api//content/dshowasf/nn-dshowasf-iconfigasfwriter
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IConfigAsfWriter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConfigAsfWriter
     * @type {Guid}
     */
    static IID => Guid("{45086030-f7e4-486a-b504-826bb5792a3b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConfigureFilterUsingProfileId", "GetCurrentProfileId", "ConfigureFilterUsingProfileGuid", "GetCurrentProfileGuid", "ConfigureFilterUsingProfile", "GetCurrentProfile", "SetIndexMode", "GetIndexMode"]

    /**
     * The ConfigureFilterUsingProfileId method sets a Windows Media Format 4.0 profile on the WM ASF Writer filter. This method is deprecated. Applications should use the IConfigAsfWriter::ConfigureFilterUsingProfile method to set the profile.
     * @remarks
     * This method is now obsolete because it assumes version 4.0 Windows Media Format SDK profiles.
     * @param {Integer} dwProfileId Profile ID as defined in version 4.0 of the Windows Media Format SDK.
     * @returns {HRESULT} Returns one of the following <b>HRESULT</b> values.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The profile is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_WRONG_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The filter graph is stopped.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/dshowasf/nf-dshowasf-iconfigasfwriter-configurefilterusingprofileid
     */
    ConfigureFilterUsingProfileId(dwProfileId) {
        result := ComCall(3, this, "uint", dwProfileId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetCurrentProfileId method retrieves the identifier of the WM ASF Writer filter's profile, only when the filter is using a Windows Media Format 4.0 profile. (Deprecated.).
     * @remarks
     * This method is obsolete because it applies only to version 4.0 Windows Media Format SDK profiles. Applications should call <a href="https://docs.microsoft.com/windows/desktop/api/dshowasf/nf-dshowasf-iconfigasfwriter-getcurrentprofile">IConfigAsfWriter::GetCurrentProfile</a> to get the current profile.
     * @returns {Integer} Receives the current profile ID.
     * @see https://learn.microsoft.com/windows/win32/api//content/dshowasf/nf-dshowasf-iconfigasfwriter-getcurrentprofileid
     */
    GetCurrentProfileId() {
        result := ComCall(4, this, "uint*", &pdwProfileId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwProfileId
    }

    /**
     * The ConfigureFilterUsingProfileGuid method sets a predefined system profile on the WM ASF Writer filter. This method is deprecated. Applications should use the IConfigAsfWriter::ConfigureFilterUsingProfile method to set the profile.
     * @remarks
     * Beginning with the Windows Media Format 9 Series SDK, no new system profiles have been defined. Only version 8 (or earlier) system profile GUIDs can be used with this method.
     * @param {Pointer<Guid>} guidProfile Profile <b>GUID</b> as defined in the header file Wmsysprf.h.
     * @returns {HRESULT} Returns one of the following <b>HRESULT</b> values.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The profile is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_WRONG_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The filter graph is stopped.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/dshowasf/nf-dshowasf-iconfigasfwriter-configurefilterusingprofileguid
     */
    ConfigureFilterUsingProfileGuid(guidProfile) {
        result := ComCall(5, this, "ptr", guidProfile, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetCurrentProfileGuid method retrieves the GUID of the WM ASF Writer filter's current system profile, if any. (Deprecated.).
     * @remarks
     * This method applies only when the WM ASF Writer filter is configured with a system profile. If the application provided its own ASF profile instead of a system profile (as is recommended), the profile GUID is GUID_NULL. Applications should call <a href="https://docs.microsoft.com/windows/desktop/api/dshowasf/nf-dshowasf-iconfigasfwriter-getcurrentprofile">IConfigAsfWriter::GetCurrentProfile</a> to get the current profile.
     * @returns {Guid} Receives the <b>GUID</b> of the system profile.
     * @see https://learn.microsoft.com/windows/win32/api//content/dshowasf/nf-dshowasf-iconfigasfwriter-getcurrentprofileguid
     */
    GetCurrentProfileGuid() {
        pProfileGuid := Guid()
        result := ComCall(6, this, "ptr", pProfileGuid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pProfileGuid
    }

    /**
     * The ConfigureFilterUsingProfile method sets an ASF profile on the WM ASF Writer filter. This method is the recommended way to set a profile on the WM ASF Writer filter.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/wmformat/iwmprofile">IWMProfile</a> interface is documented in the Windows Media Format SDK.
     * 
     * If successful, this method will cause an <a href="https://docs.microsoft.com/windows/desktop/DirectShow/ec-graph-changed">EC_GRAPH_CHANGED</a> event to be sent to the application.
     * @param {IWMProfile} pProfile Pointer to the <a href="https://docs.microsoft.com/windows/desktop/wmformat/iwmprofile">IWMProfile</a> interface of the profile.
     * @returns {HRESULT} Returns one of the following <b>HRESULT</b> values.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_WRONG_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The graph is stopped.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/windows/desktop/wmformat/iwmprofile">IWMProfile</a> interface pointer is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/dshowasf/nf-dshowasf-iconfigasfwriter-configurefilterusingprofile
     */
    ConfigureFilterUsingProfile(pProfile) {
        result := ComCall(7, this, "ptr", pProfile, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetCurrentProfile method retrieves the current ASF profile from the WM ASF Writer filter.
     * @returns {IWMProfile} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/wmformat/iwmprofile">IWMProfile</a> interface of the profile. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/dshowasf/nf-dshowasf-iconfigasfwriter-getcurrentprofile
     */
    GetCurrentProfile() {
        result := ComCall(8, this, "ptr*", &ppProfile := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMProfile(ppProfile)
    }

    /**
     * The SetIndexMode method controls whether the WM ASF Writer filter creates a file with a temporal index.
     * @remarks
     * By default, the WM ASF Writer filter creates temporally indexed ASF files. It performs the indexing when the graph stops. You can disable this behavior if you want to do your own frame-based indexing as a post-processing step. To create a frame-indexed file, call <c>SetIndexMode</c> with the value <b>FALSE</b>, create the file, and then use the Windows Media Format SDK methods to create a frame-based index for the file.
     * @param {BOOL} bIndexFile Specifies the index mode. If <b>TRUE</b>, the file will be indexed.
     * @returns {HRESULT} Returns S_OK if successful, or an <b>HRESULT</b> error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/dshowasf/nf-dshowasf-iconfigasfwriter-setindexmode
     */
    SetIndexMode(bIndexFile) {
        result := ComCall(9, this, "int", bIndexFile, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetIndexMode method retrieves the current index mode.
     * @remarks
     * Use this method to determine whether the WM ASF Writer is currently configured to write indexed ASF files. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/dshowasf/nf-dshowasf-iconfigasfwriter-setindexmode">IConfigAsfWriter::SetIndexMode</a>.
     * @returns {BOOL} Receives the index mode setting. A value of <b>TRUE</b> indicates that the WM ASF Writer is configured to write indexed files.
     * @see https://learn.microsoft.com/windows/win32/api//content/dshowasf/nf-dshowasf-iconfigasfwriter-getindexmode
     */
    GetIndexMode() {
        result := ComCall(10, this, "int*", &pbIndexFile := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbIndexFile
    }
}

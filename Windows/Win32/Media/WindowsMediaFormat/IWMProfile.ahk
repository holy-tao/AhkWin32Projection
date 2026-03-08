#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMStreamConfig.ahk
#Include .\IWMMutualExclusion.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMProfile interface is the primary interface for a profile object.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmprofile
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMProfile extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMProfile
     * @type {Guid}
     */
    static IID => Guid("{96406bdb-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetVersion", "GetName", "SetName", "GetDescription", "SetDescription", "GetStreamCount", "GetStream", "GetStreamByNumber", "RemoveStream", "RemoveStreamByNumber", "AddStream", "ReconfigStream", "CreateNewStream", "GetMutualExclusionCount", "GetMutualExclusion", "RemoveMutualExclusion", "AddMutualExclusion", "CreateNewMutualExclusion"]

    /**
     * The GetVersion method retrieves the version number of the Windows Media Format SDK used to create the profile.
     * @remarks
     * The version number indicates the version of the Windows Media codecs used to encode content in the file. You should always use the latest codecs unless you have a specific need for backward compatibility.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing one member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_version">WMT_VERSION</a> enumeration type. This value specifies the version of the Windows Media Format SDK that was used to create the profile.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-getversion
     */
    GetVersion() {
        result := ComCall(3, this, "int*", &pdwVersion := 0, "HRESULT")
        return pdwVersion
    }

    /**
     * The GetName method retrieves the name of a profile.
     * @remarks
     * You should make two calls to <b>GetName</b>. On the first call, pass <b>NULL</b> as <i>pwszName</i>. On return, the value pointed to by <i>pcchName</i> is set to the number of wide characters, including the terminating <b>null</b> character, required to hold the profile name. Then you can allocate the required amount of memory for the string and pass a pointer to it as <i>pwszName</i> on the second call.
     * 
     * Profiles have names and descriptions that are used when displaying lists of profiles.
     * @param {PWSTR} pwszName Pointer to a wide-character <b>null</b>-terminated string containing the name. Pass <b>NULL</b> to retrieve the length of the name.
     * @param {Pointer<Integer>} pcchName On input, specifies the length of the <i>pwszName</i> buffer. On output, if the method succeeds, specifies a pointer to the length of the name, including the terminating <b>null</b> character.
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
     * The <i>pcchName</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ASF_E_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pwszName</i> parameter is not large enough.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed for an unspecified reason.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-getname
     */
    GetName(pwszName, pcchName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        pcchNameMarshal := pcchName is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pwszName, pcchNameMarshal, pcchName, "HRESULT")
        return result
    }

    /**
     * The SetName method specifies the name of a profile.
     * @remarks
     * Profiles have names and descriptions, for use when displaying lists of profiles.
     * @param {PWSTR} pwszName Pointer to a wide-character <b>null</b>-terminated string containing the name. Profile names are limited to 256 wide characters.
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
     * The <i>pwszName</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-setname
     */
    SetName(pwszName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(5, this, "ptr", pwszName, "HRESULT")
        return result
    }

    /**
     * The GetDescription method retrieves the profile description. The description is a string that contains an explanation of what the profile should be used for.
     * @remarks
     * You should make two calls to <b>GetDescription</b>. On the first call, pass <b>NULL</b> as <i>pwszDescription</i>. On return, the value pointed to by <i>pcchDescription</i> is set to the number of wide characters, including the terminating <b>null</b> character, required to hold the profile description. Then you can allocate the required amount of memory for the string and pass a pointer to it as <i>pwszDescription</i> on the second call.
     * @param {PWSTR} pwszDescription Pointer to a wide-character <b>null</b>-terminated string containing the description. Pass <b>NULL</b> to retrieve the required length for the description.
     * @param {Pointer<Integer>} pcchDescription On input, specifies the length of the <i>pwszDescription</i> string. On output, if the method succeeds, specifies a pointer to a count of the number of characters in the name, including the terminating <b>null</b> character.
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
     * The <i>pcchName</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ASF_E_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by the <i>pwszDescription</i> parameter is not large enough.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed for an unspecified reason.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-getdescription
     */
    GetDescription(pwszDescription, pcchDescription) {
        pwszDescription := pwszDescription is String ? StrPtr(pwszDescription) : pwszDescription

        pcchDescriptionMarshal := pcchDescription is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pwszDescription, pcchDescriptionMarshal, pcchDescription, "HRESULT")
        return result
    }

    /**
     * The SetDescription method specifies the description of a profile. The description is a string that contains an explanation of what the profile should be used for.
     * @param {PWSTR} pwszDescription Pointer to a wide-character <b>null</b>-terminated string containing the description. Profile descriptions are limited to 1024 wide characters.
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
     * The <i>pwszDescription</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-setdescription
     */
    SetDescription(pwszDescription) {
        pwszDescription := pwszDescription is String ? StrPtr(pwszDescription) : pwszDescription

        result := ComCall(7, this, "ptr", pwszDescription, "HRESULT")
        return result
    }

    /**
     * The GetStreamCount method retrieves the number of streams in a profile.
     * @returns {Integer} Pointer to a count of streams.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-getstreamcount
     */
    GetStreamCount() {
        result := ComCall(8, this, "uint*", &pcStreams := 0, "HRESULT")
        return pcStreams
    }

    /**
     * The GetStream method retrieves a stream from the profile.
     * @remarks
     * You can use this method in conjunction with <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmprofile-getstreamcount">GetStreamCount</a> to step through all of the streams in the profile.
     * @param {Integer} dwStreamIndex <b>DWORD</b> containing the stream index.
     * @returns {IWMStreamConfig} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmstreamconfig">IWMStreamConfig</a> interface of the stream configuration object that describes the specified stream.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-getstream
     */
    GetStream(dwStreamIndex) {
        result := ComCall(9, this, "uint", dwStreamIndex, "ptr*", &ppConfig := 0, "HRESULT")
        return IWMStreamConfig(ppConfig)
    }

    /**
     * The GetStreamByNumber method retrieves a stream from the profile.
     * @remarks
     * Stream numbers are in the range of 1 through 63.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number.
     * @returns {IWMStreamConfig} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmstreamconfig">IWMStreamConfig</a> interface of the stream configuration object that describes the specified stream.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-getstreambynumber
     */
    GetStreamByNumber(wStreamNum) {
        result := ComCall(10, this, "ushort", wStreamNum, "ptr*", &ppConfig := 0, "HRESULT")
        return IWMStreamConfig(ppConfig)
    }

    /**
     * The RemoveStream method removes a stream from the profile.
     * @param {IWMStreamConfig} pConfig Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmstreamconfig">IWMStreamConfig</a> interface of the stream configuration object that describes the stream you want to remove.
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed for an unspecified reason.
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
     * The <i>pConfig</i> parameter is <b>NULL</b> or not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-removestream
     */
    RemoveStream(pConfig) {
        result := ComCall(11, this, "ptr", pConfig, "HRESULT")
        return result
    }

    /**
     * The RemoveStreamByNumber method removes a stream from the profile.
     * @remarks
     * A stream may be included in other objects within the profile, such as mutual exclusion objects. This method will remove all references to the specified stream from all objects within the profile.
     * 
     * Stream numbers are in the range of 1 through 63.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed for an unspecified reason.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_NO_STREAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No stream was found to match <i>wStreamNum</i> value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-removestreambynumber
     */
    RemoveStreamByNumber(wStreamNum) {
        result := ComCall(12, this, "ushort", wStreamNum, "HRESULT")
        return result
    }

    /**
     * The AddStream method adds a stream to the profile by copying the stream configuration details into the profile.
     * @remarks
     * When a stream is added, its configuration is copied into the profile. A maximum of 63 streams can exist in a profile.
     * @param {IWMStreamConfig} pConfig Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmstreamconfig">IWMStreamConfig</a> interface of the stream configuration object to be added to the profile. The stream must be configured by using the methods of the <b>IWMStreamConfig</b> interface before this method is used to add the stream to the profile.
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
     * The <i>pConfig</i> parameter is <b>NULL</b>.
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
     * There is not enough available memory.
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
     * The method failed for an unspecified reason.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_STREAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream is not valid, possibly because it does not have a valid stream number.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-addstream
     */
    AddStream(pConfig) {
        result := ComCall(13, this, "ptr", pConfig, "HRESULT")
        return result
    }

    /**
     * The ReconfigStream method enables changes made to a stream configuration to be included in the profile. Use this method when you have made changes to a stream that has already been included in the profile.
     * @remarks
     * You can call either <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmprofile-getstream">IWMProfile::GetStream</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmprofile-getstreambynumber">IWMProfile::GetStreamByNumber</a> to retrieve a stream already added to a profile.
     * 
     * If you create a new stream by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmprofile-createnewstream">IWMProfile::CreateNewStream</a>, you must call <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmprofile-addstream">IWMProfile::AddStream</a> to include it in the profile. Calling <b>ReconfigStream</b> on a new stream will result in an error.
     * 
     * Updating a stream configuration object has no effect on the profile until the application calls <b>ReconfigStream</b>.
     * @param {IWMStreamConfig} pConfig Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmstreamconfig">IWMStreamConfig</a> interface of the stream configuration object for the stream you want to reconfigure.
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed for an unspecified reason.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_STREAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method is working on a stream that is <b>NULL</b> or not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-reconfigstream
     */
    ReconfigStream(pConfig) {
        result := ComCall(14, this, "ptr", pConfig, "HRESULT")
        return result
    }

    /**
     * The CreateNewStream method creates a stream configuration object. You can use a stream configuration object to define the characteristics of a media stream.
     * @remarks
     * It is not possible to have a stream configuration object other than as an element of a profile. After the stream has been configured, this object must be added to the profile by using the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmprofile-addstream">AddStream</a> method.
     * 
     * When <b>CreateNewStream</b> is called, a valid stream number is specified for the new stream. Stream numbers are in the range of 1 through 63.
     * @param {Pointer<Guid>} guidStreamType GUID object specifying the major media type for the stream to be created (for example, WMMEDIATYPE_Video). The supported major types are listed in <a href="https://docs.microsoft.com/windows/desktop/wmformat/media-types">Media Types</a>.
     * @returns {IWMStreamConfig} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmstreamconfig">IWMStreamConfig</a> interface of the created stream configuration object.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-createnewstream
     */
    CreateNewStream(guidStreamType) {
        result := ComCall(15, this, "ptr", guidStreamType, "ptr*", &ppConfig := 0, "HRESULT")
        return IWMStreamConfig(ppConfig)
    }

    /**
     * The GetMutualExclusionCount method retrieves the number of mutual exclusion objects in the profile.
     * @returns {Integer} Pointer to a count of mutual exclusions.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-getmutualexclusioncount
     */
    GetMutualExclusionCount() {
        result := ComCall(16, this, "uint*", &pcME := 0, "HRESULT")
        return pcME
    }

    /**
     * The GetMutualExclusion method retrieves a mutual exclusion object from the profile.
     * @remarks
     * You can use this method in conjunction with <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmprofile-getmutualexclusioncount">GetMutualExclusionCount</a> to step through all of the mutual exclusion objects in the profile.
     * @param {Integer} dwMEIndex <b>DWORD</b> containing the index of the mutual exclusion object.
     * @returns {IWMMutualExclusion} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmmutualexclusion">IWMMutualExclusion</a> interface of the mutual exclusion object specified by the index passed as <i>dwMEIndex</i>.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-getmutualexclusion
     */
    GetMutualExclusion(dwMEIndex) {
        result := ComCall(17, this, "uint", dwMEIndex, "ptr*", &ppME := 0, "HRESULT")
        return IWMMutualExclusion(ppME)
    }

    /**
     * The RemoveMutualExclusion method removes a mutual exclusion object from the profile.
     * @param {IWMMutualExclusion} pME Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmmutualexclusion">IWMMutualExclusion</a> interface of the mutual exclusion object you want to remove.
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
     * The <i>pcME</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-removemutualexclusion
     */
    RemoveMutualExclusion(pME) {
        result := ComCall(18, this, "ptr", pME, "HRESULT")
        return result
    }

    /**
     * The AddMutualExclusion method adds a mutual exclusion object to the profile. Mutual exclusion objects are used to specify a set of streams, only one of which can be output at a time.
     * @param {IWMMutualExclusion} pME Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmmutualexclusion">IWMMutualExclusion</a> interface of the mutual exclusion object to include in the profile. You must configure the mutual exclusion object by using the methods of the <b>IWMMutualExclusion</b> interface prior to using this method to add the mutual exclusion object to the profile.
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
     * The parameter <i>pME</i> is <b>NULL</b>, or the mutual exclusion type is not CLSID_WMMUTEX_Bitrate.
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
     * There is not enough available memory to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_STREAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A stream number in the mutual exclusion object being added is not part of the profile.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-addmutualexclusion
     */
    AddMutualExclusion(pME) {
        result := ComCall(19, this, "ptr", pME, "HRESULT")
        return result
    }

    /**
     * The CreateNewMutualExclusion method creates a mutual exclusion object. Mutual exclusion objects are used to specify a set of streams, only one of which can be output at a time.
     * @remarks
     * This creation method is included as a method to this interface, rather than as an independent function. For clarity, it is not possible to have a mutual exclusion object other than as an element of a profile.
     * 
     * After the application has created the mutual exclusion object, it must be configured and then <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmprofile-addmutualexclusion">AddMutualExclusion</a> must be called to add the mutual exclusion to the profile.
     * @returns {IWMMutualExclusion} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmmutualexclusion">IWMMutualExclusion</a> interface of the new mutual exclusion object.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-createnewmutualexclusion
     */
    CreateNewMutualExclusion() {
        result := ComCall(20, this, "ptr*", &ppME := 0, "HRESULT")
        return IWMMutualExclusion(ppME)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMReaderAdvanced.ahk

/**
 * The IWMReaderAdvanced2 interface provides additional advanced methods for a reader object.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmreaderadvanced2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMReaderAdvanced2 extends IWMReaderAdvanced{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMReaderAdvanced2
     * @type {Guid}
     */
    static IID => Guid("{ae14a945-b90c-4d0d-9127-80d665f7d73e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 23

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPlayMode", "GetPlayMode", "GetBufferProgress", "GetDownloadProgress", "GetSaveAsProgress", "SaveFileAs", "GetProtocolName", "StartAtMarker", "GetOutputSetting", "SetOutputSetting", "Preroll", "SetLogClientID", "GetLogClientID", "StopBuffering", "OpenStream"]

    /**
     * The SetPlayMode method specifies the play mode.
     * @remarks
     * The default play mode is WMT_PLAY_MODE_AUTOSELECT, which enables the reader to pick the mode. If the application selects a play mode that is incompatible with the requested URL, an error is returned when the URL is opened. After the asynchronous reply to the <b>Open</b> request is completed, the mode is changed from WMT_PLAY_MODE_AUTOSELECT to the appropriately selected play mode. The play mode cannot be changed after the content has been opened, and returns an error if this is attempted.
     * @param {Integer} _Mode 
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-setplaymode
     */
    SetPlayMode(_Mode) {
        result := ComCall(23, this, "int", _Mode, "HRESULT")
        return result
    }

    /**
     * The GetPlayMode method retrieves the current play mode.
     * @remarks
     * Before a file is opened, this method returns the play mode the reader will use to open a file. The default setting is auto-select (the reader picks the mode). After a file is opened, this method returns the actual mode used to play the file. For an asynchronous <b>Open</b> request, the actual mode can be obtained after receiving the WMT_OPENED status message.
     * 
     * For more information, see the Remarks section of <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-setplaymode">IWMReaderAdvanced2::SetPlayMode</a>.
     * @returns {Integer} Pointer to a variable that receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_play_mode">WMT_PLAY_MODE</a> enumeration type.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-getplaymode
     */
    GetPlayMode() {
        result := ComCall(24, this, "int*", &pMode := 0, "HRESULT")
        return pMode
    }

    /**
     * The GetBufferProgress method retrieves the percentage of data that has been buffered, and the time remaining to completion.
     * @remarks
     * To produce meaningful results, this method must be called between the events WMT_BUFFERING_START and WMT_BUFFERING_STOP. If it is called before a WMT_BUFFERING_START event, then both parameters return zero. If it is called after WMT_BUFFERING_STOP but before a subsequent WMT_BUFFERING_START event, this method returns 100 for the percentage and zero for the buffering time, in seconds. WMT_BUFFERING_START events reset the percentage and seconds remaining to zero.
     * @param {Pointer<Integer>} pdwPercent Pointer to a <b>DWORD</b> containing the percentage of data that has been buffered.
     * @param {Pointer<Integer>} pcnsBuffering Pointer to variable specifying the time remaining, in 100-nanosecond units, until all the buffering is completed.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-getbufferprogress
     */
    GetBufferProgress(pdwPercent, pcnsBuffering) {
        pdwPercentMarshal := pdwPercent is VarRef ? "uint*" : "ptr"
        pcnsBufferingMarshal := pcnsBuffering is VarRef ? "uint*" : "ptr"

        result := ComCall(25, this, pdwPercentMarshal, pdwPercent, pcnsBufferingMarshal, pcnsBuffering, "HRESULT")
        return result
    }

    /**
     * The GetDownloadProgress method retrieves the percentage and amount of data that has been downloaded, and the time remaining to completion.
     * @remarks
     * This method can be called to monitor progress while content is being downloaded from a Web server.
     * 
     * Content can be downloaded from a Web server when either the play mode is WMT_PLAY_MODE_AUDTOSELECT (in which case the reader automatically adjusts its play mode to DOWNLOAD) or the play mode is explicitly set to WMT_PLAY_MODE_DOWNLOAD.
     * 
     * If one of these two play modes is not current, and this method is called, all parameters return zero.
     * 
     * Before the first WMT_BUFFERING_START event, all the parameters return zero. Between WMT_BUFFERING_START and WMT_END_OF_STREAMING, the values for the percentage of downloading completed and number of bytes downloaded always increase. The value for the number of seconds of downloading remaining can go up or down depending on changing download rates. After WMT_END_OF_STREAMING has been sent, the percentage returns 100, bytes downloaded remains at the size of the download, and seconds remaining is zero.
     * @param {Pointer<Integer>} pdwPercent Pointer to a <b>DWORD</b> containing the percentage of data that has been downloaded.
     * @param {Pointer<Integer>} pqwBytesDownloaded Pointer to a <b>QWORD</b> containing the number of bytes of data downloaded.
     * @param {Pointer<Integer>} pcnsDownload Pointer to variable specifying the time remaining, in 100-nanosecond units, for data to be downloaded.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-getdownloadprogress
     */
    GetDownloadProgress(pdwPercent, pqwBytesDownloaded, pcnsDownload) {
        pdwPercentMarshal := pdwPercent is VarRef ? "uint*" : "ptr"
        pqwBytesDownloadedMarshal := pqwBytesDownloaded is VarRef ? "uint*" : "ptr"
        pcnsDownloadMarshal := pcnsDownload is VarRef ? "uint*" : "ptr"

        result := ComCall(26, this, pdwPercentMarshal, pdwPercent, pqwBytesDownloadedMarshal, pqwBytesDownloaded, pcnsDownloadMarshal, pcnsDownload, "HRESULT")
        return result
    }

    /**
     * The GetSaveAsProgress method retrieves the percentage of data that has been saved.
     * @remarks
     * This method must only be called after <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-savefileas">IWMReaderAdvanced2::SaveFileAs</a> has been called.
     * 
     * When saving a file, the operation can take some time. This call must be made between the events WMT_SAVEAS_START and WMT_SAVEAS_STOP. If it is called before WMT_SAVEAS_START, or there is an error, this method returns zero. It returns 100 following a successful WMT_SAVEAS_STOP event.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the percentage of data that has been saved.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-getsaveasprogress
     */
    GetSaveAsProgress() {
        result := ComCall(27, this, "uint*", &pdwPercent := 0, "HRESULT")
        return pdwPercent
    }

    /**
     * The SaveFileAs method saves the current file.
     * @remarks
     * This method can be used to save the content downloaded from a Web server to the local hard disk. Files can be saved when the reader is downloading from a Web server.
     * 
     * You can use this method to save a server-side playlist. When you do so, you specify the name to use for the playlist, and each file in the playlist will be saved automatically.
     * 
     * This operation is asynchronous; WMT_SAVEAS_STOP indicates that all the data has been saved. Closing the reader ends a save operation that has not been completed.
     * 
     * This method can take some time to complete, and a call can be made to <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-getsaveasprogress">GetSaveAsProgress</a> to determine progress.
     * 
     * <div class="alert"><b>Note</b>  It is possible to get the out of disk space error (STG_E_MEDIUMFULL) if the file being saved is greater than 1 MB. This is because Microsoft Internet Explorer has a maximum cache size of 1MB, and in this case the error does not refer to the amount of free disk space. This effectively limits the sizes of files that can be saved this way to those under 1 MB.</div>
     * <div> </div>
     * @param {PWSTR} pwszFilename Pointer to a wide-character null-terminated string containing the file name.
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
     * <dt><b>ERROR_OPERATION_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file was closed before the operation completed. A WMT_SAVEAS_STOP event is also generated in this case.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ASF_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call to this method has been made before an <b>Open</b> call.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A previous <b>SaveFileAs</b> operation has not yet been completed. Saving files is sequential.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_REQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The play mode is not WMT_PLAY_MODE_DOWNLOAD.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_MEDIUMFULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough free disk space. See the note in the Remarks below.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-savefileas
     */
    SaveFileAs(pwszFilename) {
        pwszFilename := pwszFilename is String ? StrPtr(pwszFilename) : pwszFilename

        result := ComCall(28, this, "ptr", pwszFilename, "HRESULT")
        return result
    }

    /**
     * The GetProtocolName method retrieves the name of the protocol that is being used.
     * @remarks
     * You should make two calls to <b>GetProtocolName</b>. On the first call, pass <b>NULL</b> for <i>pwszProtocol</i>. On return, the value pointed to by <i>pcchProtocol</i> is set to the number of wide characters, including the terminating <b>null</b>, required to hold the protocol name. Then you can allocate the required amount of memory for the string and pass a pointer to it as <i>pwszProtocol</i> on the second call.
     * 
     * The protocol name is a URL scheme, such as <i>mmsu</i>, <i>http</i>, or <i>file</i>. However, the protocol name can differ from the URL scheme specified in <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreader-open">IWMReader::Open</a>, because the reader object might use protocol rollover to find the best protocol. Also, the returned string might be "File" for local file content, or "Cache" for content saved in the cache.
     * 
     * This method can return an empty string if the protocol name cannot be determined.
     * @param {PWSTR} pwszProtocol Pointer to a buffer that receives a string containing the protocol name. Pass <b>NULL</b> to retrieve the length of the name.
     * @param {Pointer<Integer>} pcchProtocol On input, pointer to a variable containing the length of <i>pwszProtocol</i>, in characters. On output, the variable contains the length of the name, including the terminating <b>null</b> character.
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
     * <dt><b>ASF_E_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ASF_E_INVALIDSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocol has not been determined, or no file is open.
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
     * The <i>pcchProtocol</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-getprotocolname
     */
    GetProtocolName(pwszProtocol, pcchProtocol) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol

        pcchProtocolMarshal := pcchProtocol is VarRef ? "uint*" : "ptr"

        result := ComCall(29, this, "ptr", pwszProtocol, pcchProtocolMarshal, pcchProtocol, "HRESULT")
        return result
    }

    /**
     * The StartAtMarker method starts the reader from a specified marker.
     * @remarks
     * This method is very similar to <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreader-start">IWMReader::Start</a>. The difference is that this method uses a marker index but <b>IWMReader::Start</b> uses a start time.
     * @param {Integer} wMarkerIndex <b>WORD</b> containing the marker index.
     * @param {Integer} cnsDuration Specifies the duration, in 100-nanosecond units.
     * @param {Float} fRate Floating point number indicating rate. Normal-speed playback is 1.0; higher numbers cause faster playback. Numbers less than zero indicate reverse rate (rewinding). The valid range is 1.0 through 10.0, and -1.0 through -10.0.
     * @param {Pointer<Void>} pvContext Generic pointer, for use by the application.
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
     * There is not enough available memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_REQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value for <i>fRate</i> is not within the valid ranges.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-startatmarker
     */
    StartAtMarker(wMarkerIndex, cnsDuration, fRate, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(30, this, "ushort", wMarkerIndex, "uint", cnsDuration, "float", fRate, pvContextMarshal, pvContext, "HRESULT")
        return result
    }

    /**
     * The GetOutputSetting method retrieves a setting for a particular output by name.
     * @remarks
     * You should make two calls to <b>GetOutputSetting</b>. On the first call, pass <b>NULL</b> for <i>pValue</i>. On return, the value pointed to by <i>pcbLength</i> is set to the buffer size required to hold the setting value. Then you can allocate the required amount of memory for the buffer and pass a pointer to it as <i>pValue</i> on the second call.
     * @param {Integer} dwOutputNum <b>DWORD</b> containing the output number.
     * @param {PWSTR} pszName Pointer to a wide-character <b>null</b>-terminated string containing the setting name. For a list of global constants representing setting names, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/output-settings">Output Settings</a>.
     * @param {Pointer<Integer>} pType Pointer to a member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_attr_datatype">WMT_ATTR_DATATYPE</a> enumeration type that specifies the type of the value.
     * @param {Pointer<Integer>} pValue Pointer to a byte buffer containing the value. Pass <b>NULL</b> to retrieve the length of the buffer required.
     * @param {Pointer<Integer>} pcbLength On input, pointer to a variable containing the length of <i>pValue</i>. On output, the variable contains the number of bytes in <i>pValue</i>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-getoutputsetting
     */
    GetOutputSetting(dwOutputNum, pszName, pType, pValue, pcbLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        pValueMarshal := pValue is VarRef ? "char*" : "ptr"
        pcbLengthMarshal := pcbLength is VarRef ? "ushort*" : "ptr"

        result := ComCall(31, this, "uint", dwOutputNum, "ptr", pszName, pTypeMarshal, pType, pValueMarshal, pValue, pcbLengthMarshal, pcbLength, "HRESULT")
        return result
    }

    /**
     * The SetOutputSetting method specifies a named setting for a particular output.
     * @param {Integer} dwOutputNum <b>DWORD</b> containing the output number.
     * @param {PWSTR} pszName Pointer to a wide-character null-terminated string containing the name. For a list of global constants that represent setting names, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/output-settings">Output Settings</a>.
     * @param {Integer} Type Member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_attr_datatype">WMT_ATTR_DATATYPE</a> enumeration type that specifies the type of the value.
     * @param {Pointer<Integer>} pValue Pointer to a byte array containing the value.
     * @param {Integer} cbLength Size of <i>pValue</i>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-setoutputsetting
     */
    SetOutputSetting(dwOutputNum, pszName, Type, pValue, cbLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pValueMarshal := pValue is VarRef ? "char*" : "ptr"

        result := ComCall(32, this, "uint", dwOutputNum, "ptr", pszName, "int", Type, pValueMarshal, pValue, "ushort", cbLength, "HRESULT")
        return result
    }

    /**
     * The Preroll method is used to begin prerolling (buffering data) for the reader.
     * @remarks
     * This method can be called before the application calls <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreader-start">Start</a> to begin buffering data in advance. The parameters here must be set to the same values as those that are passed to <b>Start</b> when it is called. If the parameters are different, <b>Start</b> will do rebuffering.
     * 
     * It is important to allow sufficient time for the prerolling (buffering data) for the reader to be completed before calling <b>Start</b>. When prerolling local files, 6 seconds normally is sufficient. When prerolling files over the Internet, allow more time before calling <b>Start</b>. If insufficient time is allowed, the effect will be a longer <b>Start</b> time when <b>Start</b> is called.
     * @param {Integer} cnsStart Specifies the start time in 100-nanosecond units.
     * @param {Integer} cnsDuration Specifies the duration in 100-nanosecond units.
     * @param {Float} fRate Specifies the data rate.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-preroll
     */
    Preroll(cnsStart, cnsDuration, fRate) {
        result := ComCall(33, this, "uint", cnsStart, "uint", cnsDuration, "float", fRate, "HRESULT")
        return result
    }

    /**
     * The SetLogClientID method specifies whether the reader logs the client's unique ID or an anonymous session ID.
     * @remarks
     * When the reader object streams content over the network, it sends logging data to the originating server. This logging information includes a GUID that identifies the session. By default, the reader generates an anonymous session ID. If the value of <i>fLogClientID</i> is <b>TRUE</b>, the reader sends an ID that uniquely identifies the current user. The unique ID is stored in the registry under HKEY_CURRENT_USER. If the key does not exist, the reader creates it dynamically.
     * 
     * Anonymous session IDs always have the following form:
     * 
     * <pre class="syntax" xml:space="preserve"><code>
     * 3300AD50-2C39-46c0-AE0A-XXXXXXXXXXXX
     * </code></pre>
     * where the last six bytes are randomly generated.
     * @param {BOOL} fLogClientID 
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-setlogclientid
     */
    SetLogClientID(fLogClientID) {
        result := ComCall(34, this, "int", fLogClientID, "HRESULT")
        return result
    }

    /**
     * The GetLogClientID method queries whether the reader logs the client's unique ID or an anonymous session ID.
     * @remarks
     * See the remarks for <b>SetLogClientID</b>.
     * @returns {BOOL} Pointer Boolean value that is set to True if the client's log ID must be sent to the server.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-getlogclientid
     */
    GetLogClientID() {
        result := ComCall(35, this, "int*", &pfLogClientID := 0, "HRESULT")
        return pfLogClientID
    }

    /**
     * The StopBuffering method requests that the reader send the WMT_BUFFERING_STOP message as soon as possible.
     * @remarks
     * The reader responds to the request to stop buffering only if it is currently buffering data. This means it has sent a WMT_BUFFERING_START message, but not sent the corresponding WMT_BUFFERING_STOP. There is, however, no guarantee of how quickly the reader responds to the request. This feature is particularly useful when the play mode is set to WMT_PLAY_MODE_DOWNLOAD.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-stopbuffering
     */
    StopBuffering() {
        result := ComCall(36, this, "HRESULT")
        return result
    }

    /**
     * The OpenStream method opens a Windows Media stream for reading.
     * @remarks
     * This method is identical to <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreader-open">IWMReader::Open</a>, except that it takes an <b>IStream</b> interface pointer instead of a URL. An <b>IStream</b> is a standard COM interface for providing data. This allows the application to provide its own data, rather than just getting data from a file or a network. For example, if you have an <b>IStream</b> interface pointer that represents the contents of a supported media file (Windows Media Audio, Windows Media Video, MP3, for example) and, for performance reasons, you do not want to write a temporary file , this is a way you can use the SDK to parse and decompress your content.
     * 
     * This method sends a WMT_OPENED status notification to the application's <b>IWMReaderCallback::OnStatus</b> function. (<a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmstatuscallback-onstatus">OnStatus</a> is inherited by <b>IWMReaderCallback</b> from <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmstatuscallback">IWMStatusCallback</a>.)
     * @param {IStream} pStream Pointer to an <b>IStream</b> interface (see the Remarks section below).
     * @param {IWMReaderCallback} pCallback Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmreadercallback">IWMReaderCallback</a> interface.
     * @param {Pointer<Void>} pvContext Generic pointer, for use by the application. This is passed to the application in calls to <b>IWMReaderCallback::OnStatus</b>.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pCallback</i> parameter is <b>NULL</b>.
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed for an unspecified reason.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-openstream
     */
    OpenStream(pStream, pCallback, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(37, this, "ptr", pStream, "ptr", pCallback, pvContextMarshal, pvContext, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMReaderAdvanced.ahk

/**
 * The IWMReaderAdvanced2 interface provides additional advanced methods for a reader object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmreaderadvanced2
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
     * @param {Integer} Mode Variable containing one member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_play_mode">WMT_PLAY_MODE</a> enumeration type.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-setplaymode
     */
    SetPlayMode(Mode) {
        result := ComCall(23, this, "int", Mode, "HRESULT")
        return result
    }

    /**
     * The GetPlayMode method retrieves the current play mode.
     * @returns {Integer} Pointer to a variable that receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_play_mode">WMT_PLAY_MODE</a> enumeration type.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-getplaymode
     */
    GetPlayMode() {
        result := ComCall(24, this, "int*", &pMode := 0, "HRESULT")
        return pMode
    }

    /**
     * The GetBufferProgress method retrieves the percentage of data that has been buffered, and the time remaining to completion.
     * @param {Pointer<Integer>} pdwPercent Pointer to a <b>DWORD</b> containing the percentage of data that has been buffered.
     * @param {Pointer<Integer>} pcnsBuffering Pointer to variable specifying the time remaining, in 100-nanosecond units, until all the buffering is completed.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-getbufferprogress
     */
    GetBufferProgress(pdwPercent, pcnsBuffering) {
        pdwPercentMarshal := pdwPercent is VarRef ? "uint*" : "ptr"
        pcnsBufferingMarshal := pcnsBuffering is VarRef ? "uint*" : "ptr"

        result := ComCall(25, this, pdwPercentMarshal, pdwPercent, pcnsBufferingMarshal, pcnsBuffering, "HRESULT")
        return result
    }

    /**
     * The GetDownloadProgress method retrieves the percentage and amount of data that has been downloaded, and the time remaining to completion.
     * @param {Pointer<Integer>} pdwPercent Pointer to a <b>DWORD</b> containing the percentage of data that has been downloaded.
     * @param {Pointer<Integer>} pqwBytesDownloaded Pointer to a <b>QWORD</b> containing the number of bytes of data downloaded.
     * @param {Pointer<Integer>} pcnsDownload Pointer to variable specifying the time remaining, in 100-nanosecond units, for data to be downloaded.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-getdownloadprogress
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
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the percentage of data that has been saved.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-getsaveasprogress
     */
    GetSaveAsProgress() {
        result := ComCall(27, this, "uint*", &pdwPercent := 0, "HRESULT")
        return pdwPercent
    }

    /**
     * The SaveFileAs method saves the current file.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-savefileas
     */
    SaveFileAs(pwszFilename) {
        pwszFilename := pwszFilename is String ? StrPtr(pwszFilename) : pwszFilename

        result := ComCall(28, this, "ptr", pwszFilename, "HRESULT")
        return result
    }

    /**
     * The GetProtocolName method retrieves the name of the protocol that is being used.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-getprotocolname
     */
    GetProtocolName(pwszProtocol, pcchProtocol) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol

        pcchProtocolMarshal := pcchProtocol is VarRef ? "uint*" : "ptr"

        result := ComCall(29, this, "ptr", pwszProtocol, pcchProtocolMarshal, pcchProtocol, "HRESULT")
        return result
    }

    /**
     * The StartAtMarker method starts the reader from a specified marker.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-startatmarker
     */
    StartAtMarker(wMarkerIndex, cnsDuration, fRate, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(30, this, "ushort", wMarkerIndex, "uint", cnsDuration, "float", fRate, pvContextMarshal, pvContext, "HRESULT")
        return result
    }

    /**
     * The GetOutputSetting method retrieves a setting for a particular output by name.
     * @param {Integer} dwOutputNum <b>DWORD</b> containing the output number.
     * @param {PWSTR} pszName Pointer to a wide-character <b>null</b>-terminated string containing the setting name. For a list of global constants representing setting names, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/output-settings">Output Settings</a>.
     * @param {Pointer<Integer>} pType Pointer to a member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_attr_datatype">WMT_ATTR_DATATYPE</a> enumeration type that specifies the type of the value.
     * @param {Pointer<Integer>} pValue Pointer to a byte buffer containing the value. Pass <b>NULL</b> to retrieve the length of the buffer required.
     * @param {Pointer<Integer>} pcbLength On input, pointer to a variable containing the length of <i>pValue</i>. On output, the variable contains the number of bytes in <i>pValue</i>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-getoutputsetting
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
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-setoutputsetting
     */
    SetOutputSetting(dwOutputNum, pszName, Type, pValue, cbLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pValueMarshal := pValue is VarRef ? "char*" : "ptr"

        result := ComCall(32, this, "uint", dwOutputNum, "ptr", pszName, "int", Type, pValueMarshal, pValue, "ushort", cbLength, "HRESULT")
        return result
    }

    /**
     * The Preroll method is used to begin prerolling (buffering data) for the reader.
     * @param {Integer} cnsStart Specifies the start time in 100-nanosecond units.
     * @param {Integer} cnsDuration Specifies the duration in 100-nanosecond units.
     * @param {Float} fRate Specifies the data rate.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-preroll
     */
    Preroll(cnsStart, cnsDuration, fRate) {
        result := ComCall(33, this, "uint", cnsStart, "uint", cnsDuration, "float", fRate, "HRESULT")
        return result
    }

    /**
     * The SetLogClientID method specifies whether the reader logs the client's unique ID or an anonymous session ID.
     * @param {BOOL} fLogClientID 
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-setlogclientid
     */
    SetLogClientID(fLogClientID) {
        result := ComCall(34, this, "int", fLogClientID, "HRESULT")
        return result
    }

    /**
     * The GetLogClientID method queries whether the reader logs the client's unique ID or an anonymous session ID.
     * @returns {BOOL} Pointer Boolean value that is set to True if the client's log ID must be sent to the server.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-getlogclientid
     */
    GetLogClientID() {
        result := ComCall(35, this, "int*", &pfLogClientID := 0, "HRESULT")
        return pfLogClientID
    }

    /**
     * The StopBuffering method requests that the reader send the WMT_BUFFERING_STOP message as soon as possible.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-stopbuffering
     */
    StopBuffering() {
        result := ComCall(36, this, "HRESULT")
        return result
    }

    /**
     * The OpenStream method opens a Windows Media stream for reading.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-openstream
     */
    OpenStream(pStream, pCallback, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(37, this, "ptr", pStream, "ptr", pCallback, pvContextMarshal, pvContext, "HRESULT")
        return result
    }
}

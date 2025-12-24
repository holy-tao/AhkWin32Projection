#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMOutputMediaProps.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMSyncReader interface provides the ability to read ASF files using synchronous calls.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmsyncreader
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMSyncReader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMSyncReader
     * @type {Guid}
     */
    static IID => Guid("{9397f121-7705-4dc9-b049-98b698188414}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "Close", "SetRange", "SetRangeByFrame", "GetNextSample", "SetStreamsSelected", "GetStreamSelected", "SetReadStreamSamples", "GetReadStreamSamples", "GetOutputSetting", "SetOutputSetting", "GetOutputCount", "GetOutputProps", "SetOutputProps", "GetOutputFormatCount", "GetOutputFormat", "GetOutputNumberForStream", "GetStreamNumberForOutput", "GetMaxOutputSampleSize", "GetMaxStreamSampleSize", "OpenStream"]

    /**
     * The Open method opens a file for reading. Unlike IWMReader::Open, this method is a synchronous call.
     * @param {PWSTR} pwszFilename Pointer to a wide-character null-terminated string containing the file name to open. This must be a valid file name with an ASF file extension or an MP3 file name.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmsyncreader-open
     */
    Open(pwszFilename) {
        pwszFilename := pwszFilename is String ? StrPtr(pwszFilename) : pwszFilename

        result := ComCall(3, this, "ptr", pwszFilename, "HRESULT")
        return result
    }

    /**
     * The Close method removes a file from the synchronous reader.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmsyncreader-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * The SetRange method enables you to specify a start time and duration for playback by the synchronous reader.
     * @param {Integer} cnsStartTime Offset into the file at which to start playback. This value is measured in 100-nanosecond units.
     * @param {Integer} cnsDuration Duration in 100-nanosecond units, or zero to continue playback to the end of the file.
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
     * The <i>cnsDuration</i> parameter is negative.
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
     * The method is unable to allocate memory for an internal object.
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
     * No file is loaded in the synchronous reader.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmsyncreader-setrange
     */
    SetRange(cnsStartTime, cnsDuration) {
        result := ComCall(5, this, "uint", cnsStartTime, "int64", cnsDuration, "HRESULT")
        return result
    }

    /**
     * The SetRangeByFrame method configures the synchronous reader to read a portion of the file specified by a starting video frame number and a number of frames to read.
     * @param {Integer} wStreamNum Stream number.
     * @param {Integer} qwFrameNumber Frame number at which to begin playback. The first frame in a file is number 1.
     * @param {Integer} cFramesToRead Count of frames to read. Pass 0 to continue playback to the end of the file.
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
     * <i>cFramesToRead</i> contains a negative number.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmsyncreader-setrangebyframe
     */
    SetRangeByFrame(wStreamNum, qwFrameNumber, cFramesToRead) {
        result := ComCall(6, this, "ushort", wStreamNum, "uint", qwFrameNumber, "int64", cFramesToRead, "HRESULT")
        return result
    }

    /**
     * The GetNextSample method retrieves the next sample from the file.
     * @param {Integer} wStreamNum <b>WORD </b>containing the stream number for which you would like a sample. If you pass zero, the next sample in the file is returned, regardless of stream number.
     * @param {Pointer<INSSBuffer>} ppSample Pointer to a buffer that receives the sample. Set to <b>NULL</b> to retrieve the sample time without getting the sample. If set to <b>NULL</b>, <i>pcnsDuration</i> and <i>pdwFlags</i> must both be set to <b>NULL</b> as well.
     * @param {Pointer<Integer>} pcnsSampleTime Pointer to a <b>QWORD</b> variable that receives the sample time in 100-nanosecond units.
     * @param {Pointer<Integer>} pcnsDuration Pointer to <b>QWORD</b> variable that receives the duration of the sample in 100-nanosecond units.
     * @param {Pointer<Integer>} pdwFlags Pointer to a <b>DWORD</b> containing one or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Flag
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>No flag set</td>
     * <td>None of the conditions for the other flags applies. For example, a <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmformat-glossary">delta frame</a> in most cases would not have any flags set for it.</td>
     * </tr>
     * <tr>
     * <td>WM_SF_CLEANPOINT</td>
     * <td>Indicates that the sample does not require any other samples to be decompressed. All audio samples and all video samples that are key frames are cleanpoints.</td>
     * </tr>
     * <tr>
     * <td>WM_SF_DISCONTINUITY</td>
     * <td>The data stream has a gap in it, which could be due to a seek, a network loss, or other reason. This can be useful extra information for an application such as a codec or renderer. The flag is set on the first piece of data following the gap.</td>
     * </tr>
     * <tr>
     * <td>WM_SF_DATALOSS</td>
     * <td>Some data has been lost between the previous sample and the sample with this flag set.</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pdwOutputNum Pointer to a <b>DWORD</b> that receives the output number.
     * @param {Pointer<Integer>} pwStreamNum Pointer to a <b>WORD</b> that receives the stream number.
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
     * <dt><b>NS_E_NO_MORE_SAMPLES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All the samples in the file have been read.
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
     * A problem occurred with a call within the method.
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
     * <i>wStreamNum</i> specifies a stream number that is not valid.
     * 
     * OR
     * 
     * <i>pcnsSampleTime</i> is <b>NULL</b>
     * 
     * OR
     * 
     * <i>ppSample</i>, <i>pcnsDuration</i>, or <i>pdwFlags</i> is <b>NULL</b>, but one or both of the others are not.
     * 
     * OR
     * 
     * <i>wStreamNum</i> is 0 and both <i>pdwOutputNum</i> and <i>pwStreamNum</i> are <b>NULL</b>.
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
     * No file is open and ready for reading by the synchronous reader.
     * 
     * OR
     * 
     * <i>wStreamNum</i> specifies a stream number that is turned off (not selected for reading).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmsyncreader-getnextsample
     */
    GetNextSample(wStreamNum, ppSample, pcnsSampleTime, pcnsDuration, pdwFlags, pdwOutputNum, pwStreamNum) {
        pcnsSampleTimeMarshal := pcnsSampleTime is VarRef ? "uint*" : "ptr"
        pcnsDurationMarshal := pcnsDuration is VarRef ? "uint*" : "ptr"
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"
        pdwOutputNumMarshal := pdwOutputNum is VarRef ? "uint*" : "ptr"
        pwStreamNumMarshal := pwStreamNum is VarRef ? "ushort*" : "ptr"

        result := ComCall(7, this, "ushort", wStreamNum, "ptr*", ppSample, pcnsSampleTimeMarshal, pcnsSampleTime, pcnsDurationMarshal, pcnsDuration, pdwFlagsMarshal, pdwFlags, pdwOutputNumMarshal, pdwOutputNum, pwStreamNumMarshal, pwStreamNum, "HRESULT")
        return result
    }

    /**
     * The SetStreamsSelected method configures the samples to be delivered from a list of streams. Each stream can be set to deliver all samples, no samples, or only cleanpoint samples.
     * @param {Integer} cStreamCount Count of streams listed at <i>pwStreamNumbers</i>.
     * @param {Pointer<Integer>} pwStreamNumbers Pointer to an array of <b>WORD</b> values containing the stream numbers.
     * @param {Pointer<Integer>} pSelections Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_stream_selection">WMT_STREAM_SELECTION</a> enumeration values. These values correspond with the stream numbers listed at <i>pwStreamNumbers</i>. Each value specifies the samples to deliver for the appropriate stream.
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
     * <i>pwStreamNumbers</i> or <i>pSelections</i> is <b>NULL</b>.
     * 
     * OR
     * 
     * <i>cStreamCount</i> is zero.
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
     * No file is loaded in the synchronous reader.
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
     * The method is unable to allocate memory for an internal object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmsyncreader-setstreamsselected
     */
    SetStreamsSelected(cStreamCount, pwStreamNumbers, pSelections) {
        pwStreamNumbersMarshal := pwStreamNumbers is VarRef ? "ushort*" : "ptr"
        pSelectionsMarshal := pSelections is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, "ushort", cStreamCount, pwStreamNumbersMarshal, pwStreamNumbers, pSelectionsMarshal, pSelections, "HRESULT")
        return result
    }

    /**
     * The GetStreamSelected method retrieves a flag indicating whether a particular stream is currently selected.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number.
     * @returns {Integer} Pointer to a variable that receives one member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_stream_selection">WMT_STREAM_SELECTION</a> enumeration type on output. This value specifies the selection status for the specified stream.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmsyncreader-getstreamselected
     */
    GetStreamSelected(wStreamNum) {
        result := ComCall(9, this, "ushort", wStreamNum, "int*", &pSelection := 0, "HRESULT")
        return pSelection
    }

    /**
     * The SetReadStreamSamples method specifies whether samples from a stream will be delivered compressed or uncompressed.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number.
     * @param {BOOL} fCompressed Boolean value that is True if samples will be compressed.
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
     * No file is open in the synchronous reader.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_PROTECTED_CONTENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream is protected and not configured to deliver compressed samples.
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
     * <i>wStreamNum</i> specifies an invalid stream number.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmsyncreader-setreadstreamsamples
     */
    SetReadStreamSamples(wStreamNum, fCompressed) {
        result := ComCall(10, this, "ushort", wStreamNum, "int", fCompressed, "HRESULT")
        return result
    }

    /**
     * The GetReadStreamSamples method ascertains whether a stream is configured to deliver compressed samples.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number.
     * @returns {BOOL} Pointer to a flag that receives the status of compressed delivery for the stream specified.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmsyncreader-getreadstreamsamples
     */
    GetReadStreamSamples(wStreamNum) {
        result := ComCall(11, this, "ushort", wStreamNum, "int*", &pfCompressed := 0, "HRESULT")
        return pfCompressed
    }

    /**
     * The GetOutputSetting method retrieves a setting for a particular output by name.
     * @param {Integer} dwOutputNum <b>DWORD</b> containing the output number.
     * @param {PWSTR} pszName Pointer to a wide-character <b>null</b>-terminated string containing the name of the setting for which you want the value. For a list of global constants representing setting names, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/output-settings">Output Settings</a>.
     * @param {Pointer<Integer>} pType Pointer to a variable that receives one value from the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_attr_datatype">WMT_ATTR_DATATYPE</a> enumeration type. The value received specifies the type of data in <i>pValue</i>.
     * @param {Pointer<Integer>} pValue Pointer to a byte buffer containing the value. Pass <b>NULL</b> to retrieve the length of the buffer required.
     * @param {Pointer<Integer>} pcbLength On input, pointer to a variable containing the length of <i>pValue</i>. On output, the variable contains the number of bytes in <i>pValue</i> used.
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
     * <i>dwOutputNum</i> specifies an invalid output number.
     * 
     * OR
     * 
     * <i>pszName</i> or <i>pType</i> or <i>pcbLength</i> is <b>NULL</b>.
     * 
     * OR
     * 
     * <i>pszName</i> specifies an invalid setting name.
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
     * No file is open in the synchronous reader.
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
     * The buffer size passed as <i>pcbLength</i> is not large enough to contain the setting value.
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
     * <i>pszName</i> specifies an unsupported setting.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmsyncreader-getoutputsetting
     */
    GetOutputSetting(dwOutputNum, pszName, pType, pValue, pcbLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        pValueMarshal := pValue is VarRef ? "char*" : "ptr"
        pcbLengthMarshal := pcbLength is VarRef ? "ushort*" : "ptr"

        result := ComCall(12, this, "uint", dwOutputNum, "ptr", pszName, pTypeMarshal, pType, pValueMarshal, pValue, pcbLengthMarshal, pcbLength, "HRESULT")
        return result
    }

    /**
     * The SetOutputSetting method specifies a named setting for a particular output.
     * @param {Integer} dwOutputNum <b>DWORD</b> containing the output number.
     * @param {PWSTR} pszName Pointer to a <b>null</b>-terminated string containing the name of the setting. For a list of global constants representing setting names, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/output-settings">Output Settings</a>.
     * @param {Integer} Type Member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_attr_datatype">WMT_ATTR_DATATYPE</a> enumeration type. This value specifies the type of data in the buffer at <i>pValue</i>.
     * @param {Pointer<Integer>} pValue Pointer to a byte array containing the value of the setting. The type of data stored in this buffer is specified by <i>Type</i>.
     * @param {Integer} cbLength Size of <i>pValue</i> in bytes.
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
     * <i>pszName</i> or <i>pValue</i> is <b>NULL</b>.
     * 
     * OR
     * 
     * <i>dwOutputNum</i> specifies an invalid output number.
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
     * No file is open in the synchronous reader.
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
     * <i>pszName</i> specifies an unsupported setting.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmsyncreader-setoutputsetting
     */
    SetOutputSetting(dwOutputNum, pszName, Type, pValue, cbLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pValueMarshal := pValue is VarRef ? "char*" : "ptr"

        result := ComCall(13, this, "uint", dwOutputNum, "ptr", pszName, "int", Type, pValueMarshal, pValue, "ushort", cbLength, "HRESULT")
        return result
    }

    /**
     * The GetOutputCount method retrieves the number of outputs that exist for the file open in the synchronous reader.
     * @returns {Integer} Pointer to a <b>DWORD</b> that receives the number of outputs in the file.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmsyncreader-getoutputcount
     */
    GetOutputCount() {
        result := ComCall(14, this, "uint*", &pcOutputs := 0, "HRESULT")
        return pcOutputs
    }

    /**
     * The GetOutputProps method retrieves the current properties of an uncompressed output stream.
     * @param {Integer} dwOutputNum <b>DWORD</b> containing the output number.
     * @returns {IWMOutputMediaProps} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmoutputmediaprops">IWMOutputMediaProps</a> interface, which is created by a successful call to this method.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmsyncreader-getoutputprops
     */
    GetOutputProps(dwOutputNum) {
        result := ComCall(15, this, "uint", dwOutputNum, "ptr*", &ppOutput := 0, "HRESULT")
        return IWMOutputMediaProps(ppOutput)
    }

    /**
     * The SetOutputProps method specifies the media properties of an uncompressed output stream.
     * @param {Integer} dwOutputNum <b>DWORD</b> containing the output number.
     * @param {IWMOutputMediaProps} pOutput Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmoutputmediaprops">IWMOutputMediaProps</a> interface.
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
     * The <i>dwOutputNum</i> parameter is greater than or equal to the number of outputs. Output numbers begin with zero.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmsyncreader-setoutputprops
     */
    SetOutputProps(dwOutputNum, pOutput) {
        result := ComCall(16, this, "uint", dwOutputNum, "ptr", pOutput, "HRESULT")
        return result
    }

    /**
     * The GetOutputFormatCount method is used to determine all possible format types supported by this output on the synchronous reader.
     * @param {Integer} dwOutputNum <b>DWORD</b> containing the output number for which you want to determine the number of supported formats.
     * @returns {Integer} Pointer to a <b>DWORD</b> that receives the number of supported formats.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmsyncreader-getoutputformatcount
     */
    GetOutputFormatCount(dwOutputNum) {
        result := ComCall(17, this, "uint", dwOutputNum, "uint*", &pcFormats := 0, "HRESULT")
        return pcFormats
    }

    /**
     * The GetOutputFormat method retrieves the supported formats for a specified output media stream.
     * @param {Integer} dwOutputNum <b>DWORD</b> containing the output number.
     * @param {Integer} dwFormatNum <b>DWORD</b> containing the format number.
     * @returns {IWMOutputMediaProps} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmoutputmediaprops">IWMOutputMediaProps</a> interface. This object is created by a successful call to this method.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmsyncreader-getoutputformat
     */
    GetOutputFormat(dwOutputNum, dwFormatNum) {
        result := ComCall(18, this, "uint", dwOutputNum, "uint", dwFormatNum, "ptr*", &ppProps := 0, "HRESULT")
        return IWMOutputMediaProps(ppProps)
    }

    /**
     * The GetOutputNumberForStream method retrieves the output number that corresponds with the specified stream.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number for which you want to retrieve the corresponding output number.
     * @returns {Integer} Pointer to a <b>DWORD</b> that will receive the output number that corresponds to the stream number specified in <i>wStreamNum</i>.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmsyncreader-getoutputnumberforstream
     */
    GetOutputNumberForStream(wStreamNum) {
        result := ComCall(19, this, "ushort", wStreamNum, "uint*", &pdwOutputNum := 0, "HRESULT")
        return pdwOutputNum
    }

    /**
     * The GetStreamNumberForOutput method retrieves the stream number that corresponds with the specified output.
     * @param {Integer} dwOutputNum <b>DWORD</b> value specifying the output number for which you want to retrieve a stream number.
     * @returns {Integer} Pointer to a <b>WORD</b> value that receives the stream number that corresponds to the output specified by <i>dwOutput</i>.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmsyncreader-getstreamnumberforoutput
     */
    GetStreamNumberForOutput(dwOutputNum) {
        result := ComCall(20, this, "uint", dwOutputNum, "ushort*", &pwStreamNum := 0, "HRESULT")
        return pwStreamNum
    }

    /**
     * The GetMaxOutputSampleSize method retrieves the maximum sample size for a specified output of the file open in the synchronous reader.
     * @param {Integer} dwOutput <b>DWORD</b> containing the output number for which you want to retrieve the maximum sample size.
     * @returns {Integer} Pointer to a <b>DWORD</b> value that receives the maximum sample size, in bytes, for the output specified in <i>dwOutput</i>.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmsyncreader-getmaxoutputsamplesize
     */
    GetMaxOutputSampleSize(dwOutput) {
        result := ComCall(21, this, "uint", dwOutput, "uint*", &pcbMax := 0, "HRESULT")
        return pcbMax
    }

    /**
     * The GetMaxStreamSampleSize method retrieves the maximum sample size for a specified stream in the file that is open in the synchronous reader.
     * @param {Integer} wStream <b>WORD</b> containing the stream number for which you want to retrieve the maximum sample size.
     * @returns {Integer} Pointer to a <b>DWORD</b> value that receives the maximum sample size, in bytes, for the stream specified in <i>wStream</i>.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmsyncreader-getmaxstreamsamplesize
     */
    GetMaxStreamSampleSize(wStream) {
        result := ComCall(22, this, "ushort", wStream, "uint*", &pcbMax := 0, "HRESULT")
        return pcbMax
    }

    /**
     * The OpenStream method opens a stream for reading.
     * @param {IStream} pStream Pointer to an <b>IStream</b> interface.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmsyncreader-openstream
     */
    OpenStream(pStream) {
        result := ComCall(23, this, "ptr", pStream, "HRESULT")
        return result
    }
}

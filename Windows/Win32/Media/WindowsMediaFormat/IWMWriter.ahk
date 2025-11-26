#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMInputMediaProps.ahk
#Include .\INSSBuffer.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMWriter interface is used to write ASF files.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmwriter
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMWriter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMWriter
     * @type {Guid}
     */
    static IID => Guid("{96406bd4-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetProfileByID", "SetProfile", "SetOutputFilename", "GetInputCount", "GetInputProps", "SetInputProps", "GetInputFormatCount", "GetInputFormat", "BeginWriting", "EndWriting", "AllocateSample", "WriteSample", "Flush"]

    /**
     * The SetProfileByID method specifies the profile to use for the current writing task, identifying the profile by its GUID.
     * @param {Pointer<Guid>} guidProfile GUID of the profile.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriter-setprofilebyid
     */
    SetProfileByID(guidProfile) {
        result := ComCall(3, this, "ptr", guidProfile, "HRESULT")
        return result
    }

    /**
     * The SetProfile method specifies the profile to use for the current writing task.
     * @param {IWMProfile} pProfile Pointer to an <a href="https://docs.microsoft.com/windows/desktop/wmformat/iwmprofile">IWMProfile</a> interface.
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
     * <dt><b>ASF_E_STREAMNUMBERINUSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More than one stream in the profile has the same stream number.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALIDPROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The profile has zero streams.
     * 
     * The bit rate was specified as zero for a CBR-encoding mode.
     * 
     * More than one script stream was specified.
     * 
     * The bandwidth-sharing information is incorrect or inconsistent.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer is not in a configurable state.
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
     * For any stream:
     * 
     * <ul>
     * <li>A buffer window greater than 100,000 was specified.</li>
     * <li>A stream number was specified as less than one or greater than 63.</li>
     * </ul>
     * For audio streams:
     * 
     * <ul>
     * <li>The <b>formattype</b> is not <b>WMFORMAT_WaveFormatEx</b>.</li>
     * <li>The <b>wformatTag</b> is not WAVE_FORMAT_PCM and <b>nAvgBytesPerSec</b> is zero.</li>
     * <li>The FOURCC derived from the subtype <b>GUID</b> does not match the <b>dwFormatTag</b>.</li>
     * <li>For PCM audio, <b>nAvgBytesPerSec</b> is not equal to (<b>nSamplesPerSec</b> * <b>nBlockAlign</b>).</li>
     * <li>For PCM audio, <b>nBlockAlign</b> is not equal to (<b>nChannels</b> * <b>wBitsPerSample</b> / 8).</li>
     * </ul>
     * For video streams:
     * 
     * <ul>
     * <li>The <b>formattype</b> is not <b>WMFORMAT_VideoInfo</b>.</li>
     * <li><b>cbFormat</b> is not equal to sizeof(<b>WMVIDEOINFOHEADER</b>).</li>
     * <li>The bit rate specified through <b>IWMStreamConfig</b> is not equal to the value of <b>dwBitrate</b> in the <b>VIDEOINFOHEADER</b>. (Does not apply if <a href="/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmstreamconfig-setbitrate">IWMStreamConfig::SetBitrate</a> was used to set a bit rate of zero.)</li>
     * <li>On uncompressed video streams, <b>bmiHeader.biSizeImage</b> has been specified incorrectly.</li>
     * <li>The rectangle width or height specified in the <b>bmiHeader</b> is not valid for the compression type. (Some types require two- or four-byte alignment.)</li>
     * <li>Any member of the <b>rcSource</b> or <b>rcTarget</b> rectangles is negative.</li>
     * <li>The FOURCC derived from the subtype <b>GUID</b> does not match <b>bmiHeader.biCompression</b>.</li>
     * <li>The <b>bmiHeader.biCompression</b> member is BI_BITFIELDS, but <b>cbFormat</b> is incorrect.</li>
     * <li>When <b>bmiHeader.biCompression</b> = BI_RGB or BI_BITFIELDS, the <b>biBitCount</b>, <b>biClrUsed</b>, or <b>cbFormat</b> values are inconsistent or invalid. (Remember that the size of the format block is larger if the <b>BITMAPINFOHEADER</b> contains an index of palette values.)</li>
     * </ul>
     * For script streams:
     * 
     * <ul>
     * <li>The <b>formattype</b> is not specified as <b>WMFORMAT_Script</b>.</li>
     * <li>The subtype is not specified as <b>GUID_NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_SDK_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size specified for a language string in an audio stream is too small.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriter-setprofile
     */
    SetProfile(pProfile) {
        result := ComCall(4, this, "ptr", pProfile, "HRESULT")
        return result
    }

    /**
     * The SetOutputFilename method specifies the name of the file to be written.
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
     * <dt><b>NS_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer is not in a configurable state.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriter-setoutputfilename
     */
    SetOutputFilename(pwszFilename) {
        pwszFilename := pwszFilename is String ? StrPtr(pwszFilename) : pwszFilename

        result := ComCall(5, this, "ptr", pwszFilename, "HRESULT")
        return result
    }

    /**
     * The GetInputCount method retrieves the number of uncompressed input streams.
     * @returns {Integer} Pointer to a count of inputs.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriter-getinputcount
     */
    GetInputCount() {
        result := ComCall(6, this, "uint*", &pcInputs := 0, "HRESULT")
        return pcInputs
    }

    /**
     * The GetInputProps method retrieves the current media properties of a specified input stream.
     * @param {Integer} dwInputNum <b>DWORD</b> containing the input index number.
     * @returns {IWMInputMediaProps} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwminputmediaprops">IWMInputMediaProps</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriter-getinputprops
     */
    GetInputProps(dwInputNum) {
        result := ComCall(7, this, "uint", dwInputNum, "ptr*", &ppInput := 0, "HRESULT")
        return IWMInputMediaProps(ppInput)
    }

    /**
     * The SetInputProps method specifies the media properties of an input stream.
     * @param {Integer} dwInputNum <b>DWORD</b> containing the input number.
     * @param {IWMInputMediaProps} pInput Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwminputmediaprops">IWMInputMediaProps</a> interface. See Remarks.
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
     * <i>dwInputNum</i> is greater than the highest index number.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriter-setinputprops
     */
    SetInputProps(dwInputNum, pInput) {
        result := ComCall(8, this, "uint", dwInputNum, "ptr", pInput, "HRESULT")
        return result
    }

    /**
     * The GetInputFormatCount method retrieves the number of media format types supported by this input on the writer.
     * @param {Integer} dwInputNumber <b>DWORD</b> containing the input number.
     * @returns {Integer} Pointer to a count of formats.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriter-getinputformatcount
     */
    GetInputFormatCount(dwInputNumber) {
        result := ComCall(9, this, "uint", dwInputNumber, "uint*", &pcFormats := 0, "HRESULT")
        return pcFormats
    }

    /**
     * The GetInputFormat method retrieves possible media formats for the specified input.
     * @param {Integer} dwInputNumber <b>DWORD</b> containing the input number.
     * @param {Integer} dwFormatNumber <b>DWORD</b> containing the format number.
     * @returns {IWMInputMediaProps} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwminputmediaprops">IWMInputMediaProps</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriter-getinputformat
     */
    GetInputFormat(dwInputNumber, dwFormatNumber) {
        result := ComCall(10, this, "uint", dwInputNumber, "uint", dwFormatNumber, "ptr*", &pProps := 0, "HRESULT")
        return IWMInputMediaProps(pProps)
    }

    /**
     * The BeginWriting method initializes the writing process.
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
     * <dt><b>NS_E_AUDIO_CODEC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred in the audio codec.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_AUDIO_CODEC_NOT_INSTALLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The required audio codec is not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_DRM_RIV_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A more recent content revocation list is needed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_OUTPUT_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The output format is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_VIDEO_CODEC_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred in the video codec.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_VIDEO_CODEC_NOT_INSTALLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The required video codec is not available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriter-beginwriting
     */
    BeginWriting() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * The EndWriting method performs tasks required at the end of a writing session.
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
     * <dt><b>NS_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer cannot currently be run.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriter-endwriting
     */
    EndWriting() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * The AllocateSample method allocates a buffer that can be used to provide samples to the writer.
     * @param {Integer} dwSampleSize <b>DWORD</b> containing the sample size, in bytes.
     * @returns {INSSBuffer} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer">INSSBuffer</a> interface to an object containing the sample.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriter-allocatesample
     */
    AllocateSample(dwSampleSize) {
        result := ComCall(13, this, "uint", dwSampleSize, "ptr*", &ppSample := 0, "HRESULT")
        return INSSBuffer(ppSample)
    }

    /**
     * The WriteSample method passes in uncompressed data to be compressed and appended to the file that is being created.
     * @param {Integer} dwInputNum <b>DWORD</b> containing the input number.
     * @param {Integer} cnsSampleTime <b>QWORD</b> containing the sample time, in 100-nanosecond units.
     * @param {Integer} dwFlags <b>DWORD</b> containing one or more of the following flags.
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
     * <td>Forces the sample to be written as a key frame. Setting this flag for audio inputs will have no effect, as all audio samples are cleanpoints.</td>
     * </tr>
     * <tr>
     * <td>WM_SF_DISCONTINUITY</td>
     * <td>For audio inputs, this flag helps to deal with gaps that may appear between samples. You should set this flag for the first sample after a gap.</td>
     * </tr>
     * <tr>
     * <td>WM_SF_DATALOSS</td>
     * <td>This flag is not used by the writer object.</td>
     * </tr>
     * </table>
     * @param {INSSBuffer} pSample Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer">INSSBuffer</a> interface representing a sample.
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
     * The <i>dwInputNum</i> value is greater than the highest index number.
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
     * <dt><b>NS_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sample is not valid. This can occur when an input script stream contains a script sample that is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_NUM_PASSES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The wrong number of preprocessing passes was used for the stream's output type.
     * 
     * Typically, this error will be returned if the stream configuration requires a preprocessing pass and a sample is passed without first configuring preprocessing. You can check for this error to determine whether a stream requires a preprocessing pass. Preprocessing passes are required only for bit-rate-based VBR.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_LATE_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer has received samples whose presentation times differ by an amount greater than the maximum synchronization tolerance. You can set the synchronization tolerance by calling <a href="/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-setsynctolerance">IWMWriterAdvanced::SetSyncTolerance</a>.
     * 
     * This error can occur when there is more than one stream, and the application sends samples for one stream at a faster rate than the other stream. At some point, the second stream will lag too far behind the first, and the writer will return this error code.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_TOO_MUCH_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Samples from a real-time source are arriving faster than expected. This error is returned only if <a href="/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-setlivesource">IWMWriterAdvanced::SetLiveSource</a> has been called to indicate a live source.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriter-writesample
     */
    WriteSample(dwInputNum, cnsSampleTime, dwFlags, pSample) {
        result := ComCall(14, this, "uint", dwInputNum, "uint", cnsSampleTime, "uint", dwFlags, "ptr", pSample, "HRESULT")
        return result
    }

    /**
     * The functionality of the Flush method has been removed, because IWMWriter::EndWriting performs the needed checks internally. For compatibility with older applications, calls to flush will always return S_OK even though the call does nothing.
     * @returns {HRESULT} This method always returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriter-flush
     */
    Flush() {
        result := ComCall(15, this, "HRESULT")
        return result
    }
}

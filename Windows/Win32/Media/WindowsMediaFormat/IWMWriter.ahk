#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMInputMediaProps.ahk
#Include .\INSSBuffer.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMWriter interface is used to write ASF files.
 * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nn-wmsdkidl-iwmwriter
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
     * @remarks
     * Only system profiles have IDs. Use the methods of the <b>IWMProfileManager</b> interface to examine system profiles. The header file Wmsysprf.h has a list of system profiles and their IDs.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriter-setprofilebyid
     */
    SetProfileByID(guidProfile) {
        result := ComCall(3, this, "ptr", guidProfile, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetProfile method specifies the profile to use for the current writing task.
     * @remarks
     * Calling this method removes any previously set header attribute information.
     * 
     * Changes to the profile object made after this method is called do not take effect until <b>SetProfile</b> is called again.
     * 
     * The maximum number of streams in a profile is 63, as defined by the constant WM_MAX_STREAMS. Another constant, WM_MAX_VIDEO_STREAMS, defines the maximum number of video streams, which is also 63.
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
     * <li>The bit rate specified through <b>IWMStreamConfig</b> is not equal to the value of <b>dwBitrate</b> in the <b>VIDEOINFOHEADER</b>. (Does not apply if <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmstreamconfig-setbitrate">IWMStreamConfig::SetBitrate</a> was used to set a bit rate of zero.)</li>
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriter-setprofile
     */
    SetProfile(pProfile) {
        result := ComCall(4, this, "ptr", pProfile, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetOutputFilename method specifies the name of the file to be written.
     * @remarks
     * This method is equivalent to creating a file sink with an index of 0 and adding it through a call to <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-addsink">IWMWriterAdvanced::AddSink</a>, and is provided for convenience.
     * 
     * You can obtain a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmwritersink">IWMWriterSink</a> interface of the file sink created by this method by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-getsink">IWMWriterAdvanced::GetSink</a>. This is important because the writer does not deliver status messages for the sinks associated with it. You can call <b>QueryInterface</b> on <b>IWMWriterSink</b> to obtain a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmregistercallback">IWMRegisterCallback</a>, which is used to set an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmstatuscallback-onstatus">IWMStatusCallback::OnStatus</a> callback method to which the sink will deliver status messages.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriter-setoutputfilename
     */
    SetOutputFilename(pwszFilename) {
        pwszFilename := pwszFilename is String ? StrPtr(pwszFilename) : pwszFilename

        result := ComCall(5, this, "ptr", pwszFilename, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetInputCount method retrieves the number of uncompressed input streams.
     * @remarks
     * This method along with <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriter-getinputprops">GetInputProps</a> can be used to enumerate through the various inputs, and get the input format of each. These are not the output Windows Media streams specified in the profile; in a multiple bit rate scenario, one input stream can map to multiple Windows Media streams.
     * @returns {Integer} Pointer to a count of inputs.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriter-getinputcount
     */
    GetInputCount() {
        result := ComCall(6, this, "uint*", &pcInputs := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcInputs
    }

    /**
     * The GetInputProps method retrieves the current media properties of a specified input stream.
     * @remarks
     * The range of indexes to use for the <i>dwInputNum</i> parameter can be found by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriter-getinputcount">GetInputCount</a>.
     * 
     * Manipulating the <b>IWMInputMediaProps</b> object has no effect on the writer, unless the application calls the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriter-setinputprops">SetInputProps</a> method to configure the input.
     * @param {Integer} dwInputNum <b>DWORD</b> containing the input index number.
     * @returns {IWMInputMediaProps} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwminputmediaprops">IWMInputMediaProps</a> object.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriter-getinputprops
     */
    GetInputProps(dwInputNum) {
        result := ComCall(7, this, "uint", dwInputNum, "ptr*", &ppInput := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMInputMediaProps(ppInput)
    }

    /**
     * The SetInputProps method specifies the media properties of an input stream.
     * @remarks
     * Manipulating the <b>IWMInputMediaProps</b> object has no effect on the writer until the application calls this method to configure the input.
     * 
     * Specify <b>NULL</b> for <i>pInput</i> if the input contains compressed samples that will be written directly to the new stream (using <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-writestreamsample">IWMWriterAdvanced::WriteStreamSample</a>) without being recompressed.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriter-setinputprops
     */
    SetInputProps(dwInputNum, pInput) {
        result := ComCall(8, this, "uint", dwInputNum, "ptr", pInput, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetInputFormatCount method retrieves the number of media format types supported by this input on the writer.
     * @param {Integer} dwInputNumber <b>DWORD</b> containing the input number.
     * @returns {Integer} Pointer to a count of formats.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriter-getinputformatcount
     */
    GetInputFormatCount(dwInputNumber) {
        result := ComCall(9, this, "uint", dwInputNumber, "uint*", &pcFormats := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcFormats
    }

    /**
     * The GetInputFormat method retrieves possible media formats for the specified input.
     * @param {Integer} dwInputNumber <b>DWORD</b> containing the input number.
     * @param {Integer} dwFormatNumber <b>DWORD</b> containing the format number.
     * @returns {IWMInputMediaProps} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwminputmediaprops">IWMInputMediaProps</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriter-getinputformat
     */
    GetInputFormat(dwInputNumber, dwFormatNumber) {
        result := ComCall(10, this, "uint", dwInputNumber, "uint", dwFormatNumber, "ptr*", &pProps := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMInputMediaProps(pProps)
    }

    /**
     * The BeginWriting method initializes the writing process.
     * @remarks
     * The <b>BeginWriting</b> method must be called before any samples are written. This method does not actually start writing, but initializes the process. Between this call and the call to <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriter-endwriting">EndWriting</a> there can be no configuration changes to the writer. The <b>EndWriting</b> method must be called to cleanly end the writing of the samples.
     * 
     * The following operations can be performed only before calling <b>BeginWriting</b>:
     * 
     * <ul>
     * <li>Setting the profile with <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriter-setprofile">SetProfile</a>
     * </li>
     * <li>Setting the output filename (if using <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriter-setoutputfilename">IWMWriter::SetOutputFilename</a>)</li>
     * <li>Setting an attribute with <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo-setattribute">IWMHeaderInfo::SetAttribute</a>
     * </li>
     * <li><a href="https://docs.microsoft.com/windows/desktop/wmformat/wmformat-glossary">Marker</a> operations (<a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo-getmarkercount">IWMHeaderInfo::GetMarkerCount</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo-getmarker">GetMarker</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo-addmarker">AddMarker</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo-removemarker">RemoveMarker</a>, although <b>AddMarker</b> is not implemented on the writer and the rest aren't useful if there are no markers)</li>
     * <li>Calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriter-setinputprops">IWMWriter::SetInputProps</a> with a <b>NULL</b><a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwminputmediaprops">IWMInputMediaProps</a> parameter to indicate that the input stream will be written using <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-writestreamsample">WriteStreamSample</a>.</li>
     * <li>Header Script operations (<a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo-getscriptcount">IWMHeaderInfo::GetScriptCount</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo-getscript">GetScript</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo-addscript">AddScript</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo-removescript">RemoveScript</a>)</li>
     * <li>Codec info operations (<a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo2-getcodecinfocount">IWMHeaderInfo2::GetCodecInfoCount</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo2-getcodecinfo">GetCodecInfo</a>)</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-setpostviewprops">IWMWriterPostView::SetPostViewProps</a>
     * </li>
     * </ul>
     * The following methods can be called only after a profile has been set and before calling <b>BeginWriting</b>:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo-getattributecount">IWMHeaderInfo::GetAttributeCount</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo-getattributebyindex">IWMHeaderInfo::GetAttributeByIndex</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmheaderinfo-getattributebyname">IWMHeaderInfo::GetAttributeByName</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced2-setinputsetting">IWMWriterAdvanced2::SetInputSetting</a>
     * </li>
     * </ul>
     * 
     * 
     * Note: <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced2-setinputsetting">SetInputSetting</a> can be called after <b>BeginWriting</b> for g_wszDeinterlaceMode, g_wszInitialPatternForInverseTelecine, g_wszInterlacedCoding, and g_wszJPEGCompressionQuality.
     * 
     * The following operations can be performed any time after a profile has been set:
     * 
     * <ul>
     * <li>Any postview operations except for <b>SetPostViewProps</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriter-setinputprops">IWMWriter::SetInputProps</a> except when passing in a <b>NULL</b><a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwminputmediaprops">IWMInputMediaProps</a> parameter.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriter-getinputprops">IWMWriter::GetInputProps</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriter-getinputformatcount">IWMWriter::GetInputFormatCount</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriter-getinputformat">IWMWriter::GetInputFormat</a>
     * </li>
     * </ul>
     * The following operations can be performed only after calling <b>BeginWriting</b>:
     * 
     * <ul>
     * <li>Allocating samples with <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriter-allocatesample">IWMWriter::AllocateSample</a>
     * </li>
     * <li>Writing samples with <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriter-writesample">IWMWriter::WriteSample</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-writestreamsample">IWMWriterAdvanced::WriteStreamSample</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriter-endwriting">IWMWriter::EndWriting</a>
     * </li>
     * </ul>
     * The following operations can be performed at any time:
     * 
     * <ul>
     * <li>Adding and removing a sink with <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-addsink">IWMWriterAdvanced::AddSink</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-removesink">IWMWriterAdvanced::RemoveSink</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-setlivesource">IWMWriterAdvanced::SetLiveSource</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-isrealtime">IWMWriterAdvanced::IsRealTime</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-getwritertime">IWMWriterAdvanced::GetWriterTime</a> (although it won't return meaningful values)</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-getstatistics">IWMWriterAdvanced::GetStatistics</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-setsynctolerance">IWMWriterAdvanced::SetSyncTolerance</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-getsynctolerance">IWMWriterAdvanced::GetSyncTolerance</a>
     * </li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriter-beginwriting
     */
    BeginWriting() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The EndWriting method performs tasks required at the end of a writing session.
     * @remarks
     * This method will not return a failure code if the disk space was used up before the encoding was completed. In order to be notified of a file writing error, an application should implement the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmstatuscallback">IWMStatusCallback</a> method and listen for the NS_E_FILE_WRITE event.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriter-endwriting
     */
    EndWriting() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The AllocateSample method allocates a buffer that can be used to provide samples to the writer.
     * @remarks
     * You must use a new buffer for each sample passed to the writer object; reusing a buffer after passing it to call <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriter-writesample">IWMWriter::WriteSample</a> will cause errors because the writer object does not immediately release its references to the buffer object. You can release the interfaces of the buffer object safely any time after the <b>WriteSample</b> call returns.
     * @param {Integer} dwSampleSize <b>DWORD</b> containing the sample size, in bytes.
     * @returns {INSSBuffer} Pointer to a pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer">INSSBuffer</a> interface to an object containing the sample.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriter-allocatesample
     */
    AllocateSample(dwSampleSize) {
        result := ComCall(13, this, "uint", dwSampleSize, "ptr*", &ppSample := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return INSSBuffer(ppSample)
    }

    /**
     * The WriteSample method passes in uncompressed data to be compressed and appended to the file that is being created.
     * @remarks
     * If the output stream has a time code data unit extension and there is no time code extension on the sample, this method will fail in order not to cause problems later when the file is indexed. All other data unit extensions are optional on the sample. That means that this method will succeed if a data unit extension has been specified for the stream but no actual data extension is present in the sample. <b>WriteSample</b> will write zeros into the file for samples that do not have extensions specified on the sample.
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
     * @param {INSSBuffer} pSample Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer">INSSBuffer</a> interface representing a sample.
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
     * The writer has received samples whose presentation times differ by an amount greater than the maximum synchronization tolerance. You can set the synchronization tolerance by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-setsynctolerance">IWMWriterAdvanced::SetSyncTolerance</a>.
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
     * Samples from a real-time source are arriving faster than expected. This error is returned only if <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-setlivesource">IWMWriterAdvanced::SetLiveSource</a> has been called to indicate a live source.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriter-writesample
     */
    WriteSample(dwInputNum, cnsSampleTime, dwFlags, pSample) {
        result := ComCall(14, this, "uint", dwInputNum, "uint", cnsSampleTime, "uint", dwFlags, "ptr", pSample, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The functionality of the Flush method has been removed, because IWMWriter::EndWriting performs the needed checks internally. For compatibility with older applications, calls to flush will always return S_OK even though the call does nothing.
     * @returns {HRESULT} This method always returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriter-flush
     */
    Flush() {
        result := ComCall(15, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DMO_MEDIA_TYPE.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMediaObject interface provides methods for manipulating a Microsoft DirectX Media Object (DMO).
 * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nn-mediaobj-imediaobject
 * @namespace Windows.Win32.Media.DxMediaObjects
 * @version v4.0.30319
 */
class IMediaObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaObject
     * @type {Guid}
     */
    static IID => Guid("{d8ad0f58-5494-4102-97c5-ec798e59bcf4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStreamCount", "GetInputStreamInfo", "GetOutputStreamInfo", "GetInputType", "GetOutputType", "SetInputType", "SetOutputType", "GetInputCurrentType", "GetOutputCurrentType", "GetInputSizeInfo", "GetOutputSizeInfo", "GetInputMaxLatency", "SetInputMaxLatency", "Flush", "Discontinuity", "AllocateStreamingResources", "FreeStreamingResources", "GetInputStatus", "ProcessInput", "ProcessOutput", "Lock"]

    /**
     * The GetStreamCount method retrieves the number of input and output streams.
     * @param {Pointer<Integer>} pcInputStreams Pointer to a variable that receives the number of input streams. Cannot be <b>NULL</b>.
     * @param {Pointer<Integer>} pcOutputStreams Pointer to a variable that receives the number of output streams. Cannot be <b>NULL</b>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-imediaobject-getstreamcount
     */
    GetStreamCount(pcInputStreams, pcOutputStreams) {
        pcInputStreamsMarshal := pcInputStreams is VarRef ? "uint*" : "ptr"
        pcOutputStreamsMarshal := pcOutputStreams is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pcInputStreamsMarshal, pcInputStreams, pcOutputStreamsMarshal, pcOutputStreams, "HRESULT")
        return result
    }

    /**
     * The GetInputStreamInfo method retrieves information about an input stream, such as any restrictions on the number of samples per buffer, and whether the stream performs lookahead on the input data. This information never changes.
     * @param {Integer} dwInputStreamIndex Zero-based index of an input stream on the DMO.
     * @returns {Integer} Pointer to a variable that receives a bitwise combination of zero or more <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/ne-mediaobj-_dmo_input_stream_info_flags">DMO_INPUT_STREAM_INFO_FLAGS</a> flags.
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-imediaobject-getinputstreaminfo
     */
    GetInputStreamInfo(dwInputStreamIndex) {
        result := ComCall(4, this, "uint", dwInputStreamIndex, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * The GetOutputStreamInfo method retrieves information about an output stream; for example, whether the stream is discardable, and whether it uses a fixed sample size. This information never changes.
     * @param {Integer} dwOutputStreamIndex Zero-based index of an output stream on the DMO.
     * @returns {Integer} Pointer to a variable that receives a bitwise combination of zero or more <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/ne-mediaobj-_dmo_output_stream_info_flags">DMO_OUTPUT_STREAM_INFO_FLAGS</a> flags.
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-imediaobject-getoutputstreaminfo
     */
    GetOutputStreamInfo(dwOutputStreamIndex) {
        result := ComCall(5, this, "uint", dwOutputStreamIndex, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * The GetInputType method retrieves a preferred media type for a specified input stream.
     * @param {Integer} dwInputStreamIndex Zero-based index of an input stream on the DMO.
     * @param {Integer} dwTypeIndex Zero-based index on the set of acceptable media types.
     * @returns {DMO_MEDIA_TYPE} Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mediaobj/ns-mediaobj-dmo_media_type">DMO_MEDIA_TYPE</a> structure allocated by the caller, or <b>NULL</b>. If this parameter is non-<b>NULL</b>, the method fills the structure with the media type. You can use the value <b>NULL</b> to test whether the type index is in range, by checking the return code.
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-imediaobject-getinputtype
     */
    GetInputType(dwInputStreamIndex, dwTypeIndex) {
        pmt := DMO_MEDIA_TYPE()
        result := ComCall(6, this, "uint", dwInputStreamIndex, "uint", dwTypeIndex, "ptr", pmt, "HRESULT")
        return pmt
    }

    /**
     * The GetOutputType method retrieves a preferred media type for a specified output stream.
     * @param {Integer} dwOutputStreamIndex Zero-based index of an output stream on the DMO.
     * @param {Integer} dwTypeIndex Zero-based index on the set of acceptable media types.
     * @returns {DMO_MEDIA_TYPE} Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mediaobj/ns-mediaobj-dmo_media_type">DMO_MEDIA_TYPE</a> structure allocated by the caller, or <b>NULL</b>. If this parameter is non-<b>NULL</b>, the method fills the structure with the media type. You can use the value <b>NULL</b> to test whether the type index is in range, by checking the return code.
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-imediaobject-getoutputtype
     */
    GetOutputType(dwOutputStreamIndex, dwTypeIndex) {
        pmt := DMO_MEDIA_TYPE()
        result := ComCall(7, this, "uint", dwOutputStreamIndex, "uint", dwTypeIndex, "ptr", pmt, "HRESULT")
        return pmt
    }

    /**
     * The SetInputType method sets the media type on an input stream, or tests whether a media type is acceptable.
     * @param {Integer} dwInputStreamIndex Zero-based index of an input stream on the DMO.
     * @param {Pointer<DMO_MEDIA_TYPE>} pmt Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mediaobj/ns-mediaobj-dmo_media_type">DMO_MEDIA_TYPE</a> structure that specifies the media type.
     * @param {Integer} dwFlags Bitwise combination of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/ne-mediaobj-_dmo_set_type_flags">DMO_SET_TYPE_FLAGS</a> enumeration.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMO_E_INVALIDSTREAMINDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid stream index
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMO_E_TYPE_NOT_ACCEPTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Media type was not accepted
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Media type is not acceptable
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Media type was set successfully, or is acceptable
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-imediaobject-setinputtype
     */
    SetInputType(dwInputStreamIndex, pmt, dwFlags) {
        result := ComCall(8, this, "uint", dwInputStreamIndex, "ptr", pmt, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The SetOutputType method sets the media type on an output stream, or tests whether a media type is acceptable.
     * @param {Integer} dwOutputStreamIndex Zero-based index of an output stream on the DMO.
     * @param {Pointer<DMO_MEDIA_TYPE>} pmt Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mediaobj/ns-mediaobj-dmo_media_type">DMO_MEDIA_TYPE</a> structure that specifies the media type.
     * @param {Integer} dwFlags Bitwise combination of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/ne-mediaobj-_dmo_set_type_flags">DMO_SET_TYPE_FLAGS</a> enumeration.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMO_E_INVALIDSTREAMINDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid stream index
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMO_E_TYPE_NOT_ACCEPTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Media type was not accepted
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Media type is not acceptable
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Media type was set successfully, or is acceptable
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-imediaobject-setoutputtype
     */
    SetOutputType(dwOutputStreamIndex, pmt, dwFlags) {
        result := ComCall(9, this, "uint", dwOutputStreamIndex, "ptr", pmt, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The GetInputCurrentType method retrieves the media type that was set for an input stream, if any.
     * @param {Integer} dwInputStreamIndex Zero-based index of an input stream on the DMO.
     * @returns {DMO_MEDIA_TYPE} Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mediaobj/ns-mediaobj-dmo_media_type">DMO_MEDIA_TYPE</a> structure allocated by the caller. The method fills the structure with the media type.
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-imediaobject-getinputcurrenttype
     */
    GetInputCurrentType(dwInputStreamIndex) {
        pmt := DMO_MEDIA_TYPE()
        result := ComCall(10, this, "uint", dwInputStreamIndex, "ptr", pmt, "HRESULT")
        return pmt
    }

    /**
     * The GetOutputCurrentType method retrieves the media type that was set for an output stream, if any.
     * @param {Integer} dwOutputStreamIndex Zero-based index of an output stream on the DMO.
     * @returns {DMO_MEDIA_TYPE} Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mediaobj/ns-mediaobj-dmo_media_type">DMO_MEDIA_TYPE</a> structure allocated by the caller. The method fills the structure with the media type.
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-imediaobject-getoutputcurrenttype
     */
    GetOutputCurrentType(dwOutputStreamIndex) {
        pmt := DMO_MEDIA_TYPE()
        result := ComCall(11, this, "uint", dwOutputStreamIndex, "ptr", pmt, "HRESULT")
        return pmt
    }

    /**
     * The GetInputSizeInfo method retrieves the buffer requirements for a specified input stream.
     * @param {Integer} dwInputStreamIndex Zero-based index of an input stream on the DMO.
     * @param {Pointer<Integer>} pcbSize Pointer to a variable that receives the minimum size of an input buffer for this stream, in bytes.
     * @param {Pointer<Integer>} pcbMaxLookahead Pointer to a variable that receives the maximum amount of data that the DMO will hold for lookahead, in bytes. If the DMO does not perform lookahead on the stream, the value is zero.
     * @param {Pointer<Integer>} pcbAlignment Pointer to a variable that receives the required buffer alignment, in bytes. If the input stream has no alignment requirement, the value is 1.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMO_E_INVALIDSTREAMINDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid stream index.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMO_E_TYPE_NOT_SET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Media type was not set.
     * 
     * </td>
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-imediaobject-getinputsizeinfo
     */
    GetInputSizeInfo(dwInputStreamIndex, pcbSize, pcbMaxLookahead, pcbAlignment) {
        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"
        pcbMaxLookaheadMarshal := pcbMaxLookahead is VarRef ? "uint*" : "ptr"
        pcbAlignmentMarshal := pcbAlignment is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "uint", dwInputStreamIndex, pcbSizeMarshal, pcbSize, pcbMaxLookaheadMarshal, pcbMaxLookahead, pcbAlignmentMarshal, pcbAlignment, "HRESULT")
        return result
    }

    /**
     * The GetOutputSizeInfo method retrieves the buffer requirements for a specified output stream.
     * @param {Integer} dwOutputStreamIndex Zero-based index of an output stream on the DMO.
     * @param {Pointer<Integer>} pcbSize Pointer to a variable that receives the minimum size of an output buffer for this stream, in bytes.
     * @param {Pointer<Integer>} pcbAlignment Pointer to a variable that receives the required buffer alignment, in bytes. If the output stream has no alignment requirement, the value is 1.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMO_E_INVALIDSTREAMINDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid stream index.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMO_E_TYPE_NOT_SET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Media type was not set.
     * 
     * </td>
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-imediaobject-getoutputsizeinfo
     */
    GetOutputSizeInfo(dwOutputStreamIndex, pcbSize, pcbAlignment) {
        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"
        pcbAlignmentMarshal := pcbAlignment is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "uint", dwOutputStreamIndex, pcbSizeMarshal, pcbSize, pcbAlignmentMarshal, pcbAlignment, "HRESULT")
        return result
    }

    /**
     * The GetInputMaxLatency method retrieves the maximum latency on a specified input stream.
     * @param {Integer} dwInputStreamIndex Zero-based index of an input stream on the DMO.
     * @returns {Integer} Pointer to a variable that receives the maximum latency.
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-imediaobject-getinputmaxlatency
     */
    GetInputMaxLatency(dwInputStreamIndex) {
        result := ComCall(14, this, "uint", dwInputStreamIndex, "int64*", &prtMaxLatency := 0, "HRESULT")
        return prtMaxLatency
    }

    /**
     * The SetInputMaxLatency method sets the maximum latency on a specified input stream. For the definition of maximum latency, see IMediaObject::GetInputMaxLatency.
     * @param {Integer} dwInputStreamIndex Zero-based index of an input stream on the DMO.
     * @param {Integer} rtMaxLatency Maximum latency.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMO_E_INVALIDSTREAMINDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid stream index
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
     * Failure
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-imediaobject-setinputmaxlatency
     */
    SetInputMaxLatency(dwInputStreamIndex, rtMaxLatency) {
        result := ComCall(15, this, "uint", dwInputStreamIndex, "int64", rtMaxLatency, "HRESULT")
        return result
    }

    /**
     * The Flush method flushes all internally buffered data.
     * @returns {HRESULT} Returns S_OK if successful. Otherwise, returns an <b>HRESULT</b> value indicating the cause of the error.
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-imediaobject-flush
     */
    Flush() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * The Discontinuity method signals a discontinuity on the specified input stream.
     * @param {Integer} dwInputStreamIndex Zero-based index of an input stream on the DMO.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMO_E_INVALIDSTREAMINDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid stream index
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMO_E_NOTACCEPTING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DMO is not accepting input.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMO_E_TYPE_NOT_SET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input and output types have not been set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-imediaobject-discontinuity
     */
    Discontinuity(dwInputStreamIndex) {
        result := ComCall(17, this, "uint", dwInputStreamIndex, "HRESULT")
        return result
    }

    /**
     * The AllocateStreamingResources method allocates any resources needed by the DMO. Calling this method is always optional.
     * @returns {HRESULT} Returns S_OK if successful. Otherwise, returns an <b>HRESULT</b> value indicating the cause of the error.
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-imediaobject-allocatestreamingresources
     */
    AllocateStreamingResources() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * The FreeStreamingResources method frees resources allocated by the DMO. Calling this method is always optional.
     * @returns {HRESULT} Returns S_OK if successful. Otherwise, returns an <b>HRESULT</b> value indicating the cause of the error.
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-imediaobject-freestreamingresources
     */
    FreeStreamingResources() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * The GetInputStatus method queries whether an input stream can accept more input data.
     * @param {Integer} dwInputStreamIndex Zero-based index of an input stream on the DMO.
     * @returns {Integer} Pointer to a variable that receives either zero or DMO_INPUT_STATUSF_ACCEPT_DATA.
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-imediaobject-getinputstatus
     */
    GetInputStatus(dwInputStreamIndex) {
        result := ComCall(20, this, "uint", dwInputStreamIndex, "uint*", &dwFlags := 0, "HRESULT")
        return dwFlags
    }

    /**
     * The ProcessInput method delivers a buffer to the specified input stream.
     * @param {Integer} dwInputStreamIndex Zero-based index of an input stream on the DMO.
     * @param {IMediaBuffer} pBuffer Pointer to the buffer's <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nn-mediaobj-imediabuffer">IMediaBuffer</a> interface.
     * @param {Integer} dwFlags Bitwise combination of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/ne-mediaobj-_dmo_input_data_buffer_flags">DMO_INPUT_DATA_BUFFER_FLAGS</a> enumeration.
     * @param {Integer} rtTimestamp Time stamp that specifies the start time of the data in the buffer. If the buffer has a valid time stamp, set the DMO_INPUT_DATA_BUFFERF_TIME flag in the <i>dwFlags</i> parameter. Otherwise, the DMO ignores this value.
     * @param {Integer} rtTimelength Reference time specifying the duration of the data in the buffer. If this value is valid, set the DMO_INPUT_DATA_BUFFERF_TIMELENGTH flag in the <i>dwFlags</i> parameter. Otherwise, the DMO ignores this value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMO_E_INVALIDSTREAMINDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid stream index.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMO_E_NOTACCEPTING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data cannot be accepted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No output to process.
     * 
     * </td>
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-imediaobject-processinput
     */
    ProcessInput(dwInputStreamIndex, pBuffer, dwFlags, rtTimestamp, rtTimelength) {
        result := ComCall(21, this, "uint", dwInputStreamIndex, "ptr", pBuffer, "uint", dwFlags, "int64", rtTimestamp, "int64", rtTimelength, "HRESULT")
        return result
    }

    /**
     * The ProcessOutput method generates output from the current input data.
     * @param {Integer} dwFlags Bitwise combination of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/ne-mediaobj-_dmo_process_output_flags">DMO_PROCESS_OUTPUT_FLAGS</a> enumeration.
     * @param {Integer} cOutputBufferCount Number of output buffers.
     * @param {Pointer<DMO_OUTPUT_DATA_BUFFER>} pOutputBuffers Pointer to an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mediaobj/ns-mediaobj-dmo_output_data_buffer">DMO_OUTPUT_DATA_BUFFER</a> structures containing the output buffers. Specify the size of the array in the <i>cOutputBufferCount</i> parameter.
     * @param {Pointer<Integer>} pdwStatus Pointer to a variable that receives a reserved value (zero). The application should ignore this value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure
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
     * Invalid argument
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
     * <b>NULL</b> pointer argument
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No output was generated
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-imediaobject-processoutput
     */
    ProcessOutput(dwFlags, cOutputBufferCount, pOutputBuffers, pdwStatus) {
        pdwStatusMarshal := pdwStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(22, this, "uint", dwFlags, "uint", cOutputBufferCount, "ptr", pOutputBuffers, pdwStatusMarshal, pdwStatus, "HRESULT")
        return result
    }

    /**
     * The Lock method acquires or releases a lock on the DMO. Call this method to keep the DMO serialized when performing multiple operations.
     * @param {Integer} bLock Value that specifies whether to acquire or release the lock. If the value is non-zero, a lock is acquired. If the value is zero, the lock is released.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-imediaobject-lock
     */
    Lock(bLock) {
        result := ComCall(23, this, "int", bLock, "HRESULT")
        return result
    }
}

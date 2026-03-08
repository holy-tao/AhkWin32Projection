#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DMO_MEDIA_TYPE.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMediaObject interface provides methods for manipulating a Microsoft DirectX Media Object (DMO).
 * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nn-mediaobj-imediaobject
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
     * @remarks
     * The DMO might have zero input streams or zero output streams. The number of streams does not change; a DMO cannot dynamically add or remove streams.
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
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-getstreamcount
     */
    GetStreamCount(pcInputStreams, pcOutputStreams) {
        pcInputStreamsMarshal := pcInputStreams is VarRef ? "uint*" : "ptr"
        pcOutputStreamsMarshal := pcOutputStreams is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pcInputStreamsMarshal, pcInputStreams, pcOutputStreamsMarshal, pcOutputStreams, "HRESULT")
        return result
    }

    /**
     * The GetInputStreamInfo method retrieves information about an input stream, such as any restrictions on the number of samples per buffer, and whether the stream performs lookahead on the input data. This information never changes.
     * @remarks
     * The DMO_INPUT_STREAMF_HOLDS_BUFFERS flag indicates that the DMO performs lookahead on the incoming data.
     * 
     * The application must be sure to allocate sufficient buffers for the DMO to process the input. Call the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-getinputsizeinfo">IMediaObject::GetInputSizeInfo</a> method to determine the buffer requirements.
     * @param {Integer} dwInputStreamIndex Zero-based index of an input stream on the DMO.
     * @returns {Integer} Pointer to a variable that receives a bitwise combination of zero or more <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/ne-mediaobj-_dmo_input_stream_info_flags">DMO_INPUT_STREAM_INFO_FLAGS</a> flags.
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-getinputstreaminfo
     */
    GetInputStreamInfo(dwInputStreamIndex) {
        result := ComCall(4, this, "uint", dwInputStreamIndex, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * The GetOutputStreamInfo method retrieves information about an output stream; for example, whether the stream is discardable, and whether it uses a fixed sample size. This information never changes.
     * @param {Integer} dwOutputStreamIndex Zero-based index of an output stream on the DMO.
     * @returns {Integer} Pointer to a variable that receives a bitwise combination of zero or more <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/ne-mediaobj-_dmo_output_stream_info_flags">DMO_OUTPUT_STREAM_INFO_FLAGS</a> flags.
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-getoutputstreaminfo
     */
    GetOutputStreamInfo(dwOutputStreamIndex) {
        result := ComCall(5, this, "uint", dwOutputStreamIndex, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * The GetInputType method retrieves a preferred media type for a specified input stream.
     * @remarks
     * Call this method to enumerate an input stream's preferred media types. The DMO assigns each media type an index value in order of preference. The most preferred type has an index of zero. To enumerate all the types, make successive calls while incrementing the type index until the method returns DMO_E_NO_MORE_ITEMS. The DMO is not guaranteed to enumerate every media type that it supports.
     * 
     * The format block in the returned type might be <b>NULL</b>. If so, the format type is GUID_NULL. Check the format type before dereferencing the format block.
     * 
     * If the method succeeds, call <a href="https://docs.microsoft.com/windows/desktop/api/dmort/nf-dmort-mofreemediatype">MoFreeMediaType</a> to free the format block. (This function is also safe to call when the format block is <b>NULL</b>.)
     * 
     * To set the media type, call the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-setinputtype">IMediaObject::SetInputType</a> method. Setting the media type on one stream can change another stream's preferred types. In fact, a stream might not have a preferred type until the type is set on another stream. For example, a decoder might not have a preferred output type until the input type is set. However, the DMO is not required to update its preferred types dynamically in this fashion. Thus, the types returned by this method are not guaranteed to be valid; they might fail when used in the <b>SetInputType</b> method.
     * 
     * To test whether a particular media type is acceptable, call <b>SetInputType</b> with the DMO_SET_TYPEF_TEST_ONLY flag.
     * 
     * To test whether the <i>dwTypeIndex</i> parameter is in range, set <i>pmt</i> to <b>NULL</b>. The method returns S_OK if the index is in range, or DMO_E_NO_MORE_ITEMS if the index is out of range.
     * @param {Integer} dwInputStreamIndex Zero-based index of an input stream on the DMO.
     * @param {Integer} dwTypeIndex Zero-based index on the set of acceptable media types.
     * @returns {DMO_MEDIA_TYPE} Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mediaobj/ns-mediaobj-dmo_media_type">DMO_MEDIA_TYPE</a> structure allocated by the caller, or <b>NULL</b>. If this parameter is non-<b>NULL</b>, the method fills the structure with the media type. You can use the value <b>NULL</b> to test whether the type index is in range, by checking the return code.
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-getinputtype
     */
    GetInputType(dwInputStreamIndex, dwTypeIndex) {
        pmt := DMO_MEDIA_TYPE()
        result := ComCall(6, this, "uint", dwInputStreamIndex, "uint", dwTypeIndex, "ptr", pmt, "HRESULT")
        return pmt
    }

    /**
     * The GetOutputType method retrieves a preferred media type for a specified output stream.
     * @remarks
     * Call this method to enumerate an output stream's preferred media types. The DMO assigns each media type an index value, in order of preference. The most preferred type has an index of zero. To enumerate all the types, make successive calls while incrementing the type index, until the method returns DMO_E_NO_MORE_ITEMS. The DMO is not guaranteed to enumerate every media type that it supports.
     * 
     * The format block in the returned type might be <b>NULL</b>. If so, the format type is GUID_NULL. You should check the format type before dereferencing the format block.
     * 
     * If the method succeeds, call <a href="https://docs.microsoft.com/windows/desktop/api/dmort/nf-dmort-mofreemediatype">MoFreeMediaType</a> to free the format block. (This function is also safe to call when the format block is <b>NULL</b>.)
     * 
     * To set the media type, call the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-setoutputtype">IMediaObject::SetOutputType</a> method. Setting the media type on one stream can change another stream's preferred types. In fact, a stream might not have a preferred type until the type is set on another stream. For example, a decoder might not have a preferred output type until the input type is set. However, the DMO is not required to update its preferred types dynamically in this fashion. Thus, the types returned by this method are not guaranteed to be valid; they might fail when used in the <b>SetOutputType</b> method.
     * 
     * To test whether a particular media type is acceptable, call <b>SetOutputType</b> with the DMO_SET_TYPEF_TEST_ONLY flag.
     * 
     * To test whether the <i>dwTypeIndex</i> parameter is in range, set <i>pmt</i> to <b>NULL</b>. The method returns S_OK if the index is in range, or DMO_E_NO_MORE_ITEMS if the index is out of range.
     * @param {Integer} dwOutputStreamIndex Zero-based index of an output stream on the DMO.
     * @param {Integer} dwTypeIndex Zero-based index on the set of acceptable media types.
     * @returns {DMO_MEDIA_TYPE} Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mediaobj/ns-mediaobj-dmo_media_type">DMO_MEDIA_TYPE</a> structure allocated by the caller, or <b>NULL</b>. If this parameter is non-<b>NULL</b>, the method fills the structure with the media type. You can use the value <b>NULL</b> to test whether the type index is in range, by checking the return code.
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-getoutputtype
     */
    GetOutputType(dwOutputStreamIndex, dwTypeIndex) {
        pmt := DMO_MEDIA_TYPE()
        result := ComCall(7, this, "uint", dwOutputStreamIndex, "uint", dwTypeIndex, "ptr", pmt, "HRESULT")
        return pmt
    }

    /**
     * The SetInputType method sets the media type on an input stream, or tests whether a media type is acceptable.
     * @remarks
     * Call this method to test, set, or clear the media type on an input stream:
     * 
     * <ul>
     * <li>To test the media type without setting it, use the DMO_SET_TYPEF_TEST_ONLY flag. If the media type is not acceptable, the method returns S_FALSE.</li>
     * <li>To set the media type, set <i>dwFlags</i> to zero. If the media type is not acceptable, the method returns DMO_E_TYPE_NOT_ACCEPTED.</li>
     * <li>To clear the current media type (if any), use the DMO_SET_TYPEF_CLEAR flag and set <i>pmt</i> to <b>NULL</b>. When the method returns, the stream no longer has a media type. The DMO cannot process samples until the application sets a new media type.</li>
     * </ul>
     * The media types that are currently set on other streams can affect whether the media type is acceptable.
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
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-setinputtype
     */
    SetInputType(dwInputStreamIndex, pmt, dwFlags) {
        result := ComCall(8, this, "uint", dwInputStreamIndex, "ptr", pmt, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The SetOutputType method sets the media type on an output stream, or tests whether a media type is acceptable.
     * @remarks
     * Call this method to test, set, or clear the media type on an output stream:
     * 
     * <ul>
     * <li>To test the media type without setting it, use the DMO_SET_TYPEF_TEST_ONLY flag. If the media type is not acceptable, the method returns S_FALSE.</li>
     * <li>To set the media type, set <i>dwFlags</i> to zero. If the media type is not acceptable, the method returns DMO_E_TYPE_NOT_ACCEPTED.</li>
     * <li>To clear the current media type (if any), use the DMO_SET_TYPEF_CLEAR flag and set <i>pmt</i> to <b>NULL</b>. When the method returns, the stream no longer has a media type. The DMO cannot process samples until the application sets a new media type, unless the stream is optional.</li>
     * </ul>
     * The media types that are currently set on other streams can affect whether the media type is acceptable.
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
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-setoutputtype
     */
    SetOutputType(dwOutputStreamIndex, pmt, dwFlags) {
        result := ComCall(9, this, "uint", dwOutputStreamIndex, "ptr", pmt, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The GetInputCurrentType method retrieves the media type that was set for an input stream, if any.
     * @remarks
     * The caller must set the media type for the stream before calling this method. To set the media type, call the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-setinputtype">IMediaObject::SetInputType</a> method.
     * 
     * If the method succeeds, call <a href="https://docs.microsoft.com/windows/desktop/api/dmort/nf-dmort-mofreemediatype">MoFreeMediaType</a> to free the format block.
     * @param {Integer} dwInputStreamIndex Zero-based index of an input stream on the DMO.
     * @returns {DMO_MEDIA_TYPE} Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mediaobj/ns-mediaobj-dmo_media_type">DMO_MEDIA_TYPE</a> structure allocated by the caller. The method fills the structure with the media type.
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-getinputcurrenttype
     */
    GetInputCurrentType(dwInputStreamIndex) {
        pmt := DMO_MEDIA_TYPE()
        result := ComCall(10, this, "uint", dwInputStreamIndex, "ptr", pmt, "HRESULT")
        return pmt
    }

    /**
     * The GetOutputCurrentType method retrieves the media type that was set for an output stream, if any.
     * @remarks
     * The caller must set the media type for the stream before calling this method. To set the media type, call the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-setoutputtype">IMediaObject::SetOutputType</a> method.
     * 
     * If the method succeeds, call <a href="https://docs.microsoft.com/windows/desktop/api/dmort/nf-dmort-mofreemediatype">MoFreeMediaType</a> to free the format block.
     * @param {Integer} dwOutputStreamIndex Zero-based index of an output stream on the DMO.
     * @returns {DMO_MEDIA_TYPE} Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mediaobj/ns-mediaobj-dmo_media_type">DMO_MEDIA_TYPE</a> structure allocated by the caller. The method fills the structure with the media type.
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-getoutputcurrenttype
     */
    GetOutputCurrentType(dwOutputStreamIndex) {
        pmt := DMO_MEDIA_TYPE()
        result := ComCall(11, this, "uint", dwOutputStreamIndex, "ptr", pmt, "HRESULT")
        return pmt
    }

    /**
     * The GetInputSizeInfo method retrieves the buffer requirements for a specified input stream.
     * @remarks
     * The buffer requirements may depend on the media types of the various streams. Before calling this method, set the media type of each stream by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-setinputtype">IMediaObject::SetInputType</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-setoutputtype">IMediaObject::SetOutputType</a> methods. If the media types have not been set, this method might return an error.
     * 
     * If the DMO performs lookahead on the input stream, it returns the DMO_INPUT_STREAMF_HOLDS_BUFFERS flag in the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-getinputstreaminfo">IMediaObject::GetInputStreamInfo</a> method. During processing, the DMO holds up to the number of bytes indicated by the <i>pcbMaxLookahead</i> parameter. The application must allocate enough buffers for the DMO to hold this much data.
     * 
     * A buffer is <i>aligned</i> if the buffer's start address is a multiple of <i>*pcbAlignment</i>. The alignment must be a power of two. Depending on the microprocessor, reads and writes to an aligned buffer might be faster than to an unaligned buffer. Also, some microprocessors do not support unaligned reads and writes.
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
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-getinputsizeinfo
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
     * @remarks
     * The buffer requirements may depend on the media types set for each of the streams.
     * 
     * Before calling this method, set the media type of each stream by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-setinputtype">IMediaObject::SetInputType</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-setoutputtype">IMediaObject::SetOutputType</a> methods. If the media types have not been set, this method might return an error. However, if a stream is optional, and the application will not use the stream, you do not have to set the media type for the stream.
     * 
     * A buffer is <i>aligned</i> if the buffer's start address is a multiple of <i>*pcbAlignment</i>. Depending on the architecture of the microprocessor, it is faster to read and write to an aligned buffer than to an unaligned buffer. On some microprocessors, reading and writing to an unaligned buffer is not supported and can cause the program to crash. Zero is not a valid alignment.
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
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-getoutputsizeinfo
     */
    GetOutputSizeInfo(dwOutputStreamIndex, pcbSize, pcbAlignment) {
        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"
        pcbAlignmentMarshal := pcbAlignment is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "uint", dwOutputStreamIndex, pcbSizeMarshal, pcbSize, pcbAlignmentMarshal, pcbAlignment, "HRESULT")
        return result
    }

    /**
     * The GetInputMaxLatency method retrieves the maximum latency on a specified input stream.
     * @remarks
     * The latency is the difference between a time stamp on the input stream and the corresponding time stamp on the output stream. The maximum latency is the largest possible difference in the time stamps. For a DMO, determine the maximum latency as follows:
     * 
     * <ul>
     * <li>Process input buffers until the DMO can produce output. </li>
     * <li>Process as many output buffers as possible. </li>
     * <li>The maximum latency is the largest delta between input time stamps and output time stamps (taken as an absolute value). </li>
     * </ul>
     * Under this definition, latency does not include the time that it takes to process samples. Nor does it include any latency introduced by the size of the input buffer.
     * 
     * For the special case where a DMO processes exactly one sample at a time, the maximum latency is simply the difference in time stamps.
     * 
     * Latency is defined only when samples have time stamps, and the time stamps increase or decrease monotonically. Maximum latency might depend on the media types for the input and output streams.
     * @param {Integer} dwInputStreamIndex Zero-based index of an input stream on the DMO.
     * @returns {Integer} Pointer to a variable that receives the maximum latency.
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-getinputmaxlatency
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
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-setinputmaxlatency
     */
    SetInputMaxLatency(dwInputStreamIndex, rtMaxLatency) {
        result := ComCall(15, this, "uint", dwInputStreamIndex, "int64", rtMaxLatency, "HRESULT")
        return result
    }

    /**
     * The Flush method flushes all internally buffered data.
     * @remarks
     * The DMO performs the following actions when this method is called:
     * 
     * <ul>
     * <li>Releases any <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nn-mediaobj-imediabuffer">IMediaBuffer</a> references it holds.</li>
     * <li>Discards any values that specify the time stamp or sample length for a media buffer.</li>
     * <li>Reinitializes any internal states that depend on the contents of a media sample.</li>
     * </ul>
     * Media types, maximum latency, and locked state do not change.
     * 
     * When the method returns, every input stream accepts data. Output streams cannot produce any data until the application calls the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-processinput">IMediaObject::ProcessInput</a> method on at least one input stream.
     * @returns {HRESULT} Returns S_OK if successful. Otherwise, returns an <b>HRESULT</b> value indicating the cause of the error.
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-flush
     */
    Flush() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * The Discontinuity method signals a discontinuity on the specified input stream.
     * @remarks
     * A discontinuity represents a break in the input. A discontinuity might occur because no more data is expected, the format is changing, or there is a gap in the data. After a discontinuity, the DMO does not accept further input on that stream until all pending data has been processed. The application should call the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-processoutput">IMediaObject::ProcessOutput</a> method until none of the streams returns the DMO_OUTPUT_DATA_BUFFERF_INCOMPLETE flag.
     * 
     * This method might fail if it is called before the client sets the input and output types on the DMO.
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
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-discontinuity
     */
    Discontinuity(dwInputStreamIndex) {
        result := ComCall(17, this, "uint", dwInputStreamIndex, "HRESULT")
        return result
    }

    /**
     * The AllocateStreamingResources method allocates any resources needed by the DMO. Calling this method is always optional.
     * @remarks
     * An application can call this method as a streaming optimization. It gives the DMO an opportunity to perform any time-consuming initializations before streaming begins. If you call this method, do so after you set the media types on the DMO, but before you make the first calls to <b>ProcessInput</b> or <b>ProcessOutput</b>.
     * 
     * This method is optional in the following sense:
     * 
     * <ul>
     * <li>If the DMO does not support this method, the method returns S_OK.</li>
     * <li>If the application never calls this method, the DMO allocates resources within a call to <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-processinput">IMediaObject::ProcessInput</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-processoutput">IMediaObject::ProcessOutput</a>.</li>
     * </ul>
     * If the DMO supports this method, it should also support the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-freestreamingresources">IMediaObject::FreeStreamingResources</a> method.
     * @returns {HRESULT} Returns S_OK if successful. Otherwise, returns an <b>HRESULT</b> value indicating the cause of the error.
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-allocatestreamingresources
     */
    AllocateStreamingResources() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * The FreeStreamingResources method frees resources allocated by the DMO. Calling this method is always optional.
     * @remarks
     * This method releases any resources that the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-allocatestreamingresources">IMediaObject::AllocateStreamingResources</a> method initializes.
     * 
     * If the DMO does not support this method, the method returns S_OK. If you call this method during streaming, the method fails and the DMO does not release any resources.
     * 
     * Regardless of whether the method fails or succeeds, the application can continue to call other methods on the DMO. The DMO might need to re-initialize resources that were previously freed.
     * @returns {HRESULT} Returns S_OK if successful. Otherwise, returns an <b>HRESULT</b> value indicating the cause of the error.
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-freestreamingresources
     */
    FreeStreamingResources() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * The GetInputStatus method queries whether an input stream can accept more input data.
     * @remarks
     * If the input stream will accept more data, the method returns the DMO_INPUT_STATUSF_ACCEPT_DATA flag in the <i>dwFlags</i> parameter. Otherwise, it sets this parameter to zero. If the stream will accept more data, the application can call the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-processinput">IMediaObject::ProcessInput</a> method.
     * 
     * The status of an input stream can change only as the result of one of the following method calls.
     * 
     * <table>
     * <tr>
     * <th>Method
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-discontinuity">IMediaObject::Discontinuity</a>
     * </td>
     * <td>Signals a discontinuity on the specified input stream.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-flush">IMediaObject::Flush</a>
     * </td>
     * <td>Flushes all internally buffered data.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-processinput">IMediaObject::ProcessInput</a>
     * </td>
     * <td>Delivers a buffer to the specified input stream.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-processoutput">IMediaObject::ProcessOutput</a>
     * </td>
     * <td>Generates output from the current input data.</td>
     * </tr>
     * </table>
     * @param {Integer} dwInputStreamIndex Zero-based index of an input stream on the DMO.
     * @returns {Integer} Pointer to a variable that receives either zero or DMO_INPUT_STATUSF_ACCEPT_DATA.
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-getinputstatus
     */
    GetInputStatus(dwInputStreamIndex) {
        result := ComCall(20, this, "uint", dwInputStreamIndex, "uint*", &dwFlags := 0, "HRESULT")
        return dwFlags
    }

    /**
     * The ProcessInput method delivers a buffer to the specified input stream.
     * @remarks
     * The input buffer specified in the <i>pBuffer</i> parameter is read-only. The DMO will not modify the data in this buffer. All write operations occur on the output buffers, which are given in a separate call to the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-processoutput">IMediaObject::ProcessOutput</a> method.
     * 
     * If the DMO does not process all the data in the buffer, it keeps a reference count on the buffer. It releases the buffer once it has generated all the output, unless it needs to perform lookahead on the data. (To determine whether a DMO performs lookahead, call the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-getinputstreaminfo">IMediaObject::GetInputStreamInfo</a> method.)
     * 
     * If this method returns DMO_E_NOTACCEPTING, call <b>ProcessOutput</b> until the input stream can accept more data. To determine whether the stream can accept more data, call the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-getinputstatus">IMediaObject::GetInputStatus</a> method.
     * 
     * If the method returns S_FALSE, no output was generated from this input and the application does not need to call <b>ProcessOutput</b>. However, a DMO is not required to return S_FALSE in this situation; it might return S_OK.
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
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-processinput
     */
    ProcessInput(dwInputStreamIndex, pBuffer, dwFlags, rtTimestamp, rtTimelength) {
        result := ComCall(21, this, "uint", dwInputStreamIndex, "ptr", pBuffer, "uint", dwFlags, "int64", rtTimestamp, "int64", rtTimelength, "HRESULT")
        return result
    }

    /**
     * The ProcessOutput method generates output from the current input data.
     * @remarks
     * The <i>pOutputBuffers</i> parameter points to an array of <b>DMO_OUTPUT_DATA_BUFFER</b> structures. The application must allocate one structure for each output stream. To determine the number of output streams, call the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-getstreamcount">IMediaObject::GetStreamCount</a> method. Set the <i>cOutputBufferCount</i> parameter to this number.
     * 
     * Each <b>DMO_OUTPUT_DATA_BUFFER</b> structure contains a pointer to a buffer's <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nn-mediaobj-imediabuffer">IMediaBuffer</a> interface. The application allocates these buffers. The other members of the structure are status fields. The DMO sets these fields if the method succeeds. If the method fails, their values are undefined.
     * 
     * When the application calls <c>ProcessOutput</c>, the DMO processes as much input data as possible. It writes the output data to the output buffers, starting from the end of the data in each buffer. (To find the end of the data, call the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediabuffer-getbufferandlength">IMediaBuffer::GetBufferAndLength</a> method.) The DMO never holds a reference count on an output buffer.
     * 
     * If the DMO fills an entire output buffer and still has input data to process, the DMO returns the DMO_OUTPUT_DATA_BUFFERF_INCOMPLETE flag in the <b>DMO_OUTPUT_DATA_BUFFER</b> structure. The application should check for this flag by testing the <b>dwStatus</b> member of each structure.
     * 
     * If the method returns S_FALSE, no output was generated. However, a DMO is not required to return S_FALSE in this situation; it might return S_OK.
     * 
     * <b>Discarding data:</b>
     * 
     * You can discard data from a stream by setting the DMO_PROCESS_OUTPUT_DISCARD_WHEN_NO_BUFFER flag in the <i>dwFlags</i> parameter. For each stream that you want to discard, set the <b>pBuffer</b> member of the <b>DMO_OUTPUT_DATA_BUFFER</b> structure to <b>NULL</b>.
     * 
     * For each stream in which <b>pBuffer</b> is <b>NULL</b>:
     * 
     * <ul>
     * <li>If the DMO_PROCESS_OUTPUT_DISCARD_WHEN_NO_BUFFER flag is set, and the stream is discardable or optional, the DMO discards the data.</li>
     * <li>If the flag is set but the stream is neither discardable nor optional, the DMO discards the data if possible. It is not guaranteed to discard the data.</li>
     * <li>If the flag is not set, the DMO does not produce output data for that stream, but does not discard the data.</li>
     * </ul>
     * To check whether a stream is discardable or optional, call the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediaobject-getoutputstreaminfo">IMediaObject::GetOutputStreamInfo</a> method.
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
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-processoutput
     */
    ProcessOutput(dwFlags, cOutputBufferCount, pOutputBuffers, pdwStatus) {
        pdwStatusMarshal := pdwStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(22, this, "uint", dwFlags, "uint", cOutputBufferCount, "ptr", pOutputBuffers, pdwStatusMarshal, pdwStatus, "HRESULT")
        return result
    }

    /**
     * The Lock method acquires or releases a lock on the DMO. Call this method to keep the DMO serialized when performing multiple operations.
     * @remarks
     * This method prevents other threads from calling methods on the DMO. If another thread calls a method on the DMO, the thread blocks until the lock is released.
     * 
     * If you are using the Active Template Library (ATL) to implement a DMO, the name of the Lock method conflicts with the <b>CComObjectRootEx::Lock</b> method. To work around this problem, define the preprocessor symbol FIX_LOCK_NAME before including the header file Dmo.h:
     * 
     * 
     * ```cpp
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
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-imediaobject-lock
     */
    Lock(bLock) {
        result := ComCall(23, this, "int", bLock, "HRESULT")
        return result
    }
}

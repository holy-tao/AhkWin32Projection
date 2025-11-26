#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaType.ahk
#Include .\IMFAttributes.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This section contains reference information for the IMFDeviceTransform interface.
 * @see https://docs.microsoft.com/windows/win32/api//mftransform/nn-mftransform-imfdevicetransform
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFDeviceTransform extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFDeviceTransform
     * @type {Guid}
     */
    static IID => Guid("{d818fbd8-fc46-42f2-87ac-1ea2d1f9bf32}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeTransform", "GetInputAvailableType", "GetInputCurrentType", "GetInputStreamAttributes", "GetOutputAvailableType", "GetOutputCurrentType", "GetOutputStreamAttributes", "GetStreamCount", "GetStreamIDs", "ProcessEvent", "ProcessInput", "ProcessMessage", "ProcessOutput", "SetInputStreamState", "GetInputStreamState", "SetOutputStreamState", "GetOutputStreamState", "GetInputStreamPreferredState", "FlushInputStream", "FlushOutputStream"]

    /**
     * InitializeTransform is called to initialize the Device MFT.
     * @param {IMFAttributes} pAttributes Optionally contains a pointer to an attribute, passed in by the capture pipeline that contains initialization parameters. Currently none defined.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include but not limited to values given in the following table.
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
     * Initialization succeeded
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device MFT could not  support the request at this time.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imfdevicetransform-initializetransform
     */
    InitializeTransform(pAttributes) {
        result := ComCall(3, this, "ptr", pAttributes, "HRESULT")
        return result
    }

    /**
     * The GetInputAvailableType method gets an available media type for an input stream on this Media Foundation transform (MFT).
     * @param {Integer} dwInputStreamID Input stream identifier. To get the list of stream identifiers, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imfdevicetransform-getstreamids">IMFDeviceTransform::GetStreamID</a>.
     * @param {Integer} dwTypeIndex Index of the media type to retrieve. Media types are indexed from zero and returned in approximate order of preference.
     * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imfdevicetransform-getinputavailabletype
     */
    GetInputAvailableType(dwInputStreamID, dwTypeIndex) {
        result := ComCall(4, this, "uint", dwInputStreamID, "uint", dwTypeIndex, "ptr*", &pMediaType := 0, "HRESULT")
        return IMFMediaType(pMediaType)
    }

    /**
     * The GetInputCurrentType method gets the current media type for an input stream on this Media Foundation transform (MFT).
     * @param {Integer} dwInputStreamID Input stream identifier. To get the list of stream identifiers, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imfdevicetransform-getstreamids">IMFDeviceTransform::GetStreamIDs</a>.
     * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface that represents the current type used by that stream.
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imfdevicetransform-getinputcurrenttype
     */
    GetInputCurrentType(dwInputStreamID) {
        result := ComCall(5, this, "uint", dwInputStreamID, "ptr*", &pMediaType := 0, "HRESULT")
        return IMFMediaType(pMediaType)
    }

    /**
     * The GetInputStreamAttributes method gets the attribute store for an input stream on this Media Foundation transform (MFT).
     * @param {Integer} dwInputStreamID Stream ID of the input stream whose state needs to be retrieved.
     * @returns {IMFAttributes} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imfdevicetransform-getinputstreamattributes
     */
    GetInputStreamAttributes(dwInputStreamID) {
        result := ComCall(6, this, "uint", dwInputStreamID, "ptr*", &ppAttributes := 0, "HRESULT")
        return IMFAttributes(ppAttributes)
    }

    /**
     * The GetOutputAvailableType method gets an available media type for an output stream on this Media Foundation transform (MFT).
     * @param {Integer} dwOutputStreamID Output stream identifier. To get the list of stream identifiers, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imfdevicetransform-getstreamids">IMFDeviceTransform::GetStreamIDs</a>.
     * @param {Integer} dwTypeIndex Index of the media type to retrieve. Media types are indexed from zero and returned in approximate order of preference.
     * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imfdevicetransform-getoutputavailabletype
     */
    GetOutputAvailableType(dwOutputStreamID, dwTypeIndex) {
        result := ComCall(7, this, "uint", dwOutputStreamID, "uint", dwTypeIndex, "ptr*", &pMediaType := 0, "HRESULT")
        return IMFMediaType(pMediaType)
    }

    /**
     * The GetOutputCurrentType method gets the current media type for an output stream on this Media Foundation transform (MFT).
     * @param {Integer} dwOutputStreamID Output stream identifier. To get the list of stream identifiers, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imfdevicetransform-getstreamids">IMFDeviceTransform::GetStreamIDs</a>.
     * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface that represents the current type used by that stream.
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imfdevicetransform-getoutputcurrenttype
     */
    GetOutputCurrentType(dwOutputStreamID) {
        result := ComCall(8, this, "uint", dwOutputStreamID, "ptr*", &pMediaType := 0, "HRESULT")
        return IMFMediaType(pMediaType)
    }

    /**
     * The GetOutputStreamAttributes method gets the attribute store for an output stream on this Media Foundation transform (MFT).
     * @param {Integer} dwOutputStreamID The Stream ID of the output stream whose state needs to be retrieved.
     * @returns {IMFAttributes} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imfdevicetransform-getoutputstreamattributes
     */
    GetOutputStreamAttributes(dwOutputStreamID) {
        result := ComCall(9, this, "uint", dwOutputStreamID, "ptr*", &ppAttributes := 0, "HRESULT")
        return IMFAttributes(ppAttributes)
    }

    /**
     * The GetStreamCount method gets the current number of input and output streams on this Media Foundation transform (MFT).
     * @param {Pointer<Integer>} pcInputStreams Receives the number of input streams.
     * @param {Pointer<Integer>} pcOutputStreams Receives the number of output streams.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include,  but are  not limited to the values given in the following table.
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
     * Transitioning the stream state succeeded.
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
     * Invalid pointer passed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imfdevicetransform-getstreamcount
     */
    GetStreamCount(pcInputStreams, pcOutputStreams) {
        pcInputStreamsMarshal := pcInputStreams is VarRef ? "uint*" : "ptr"
        pcOutputStreamsMarshal := pcOutputStreams is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pcInputStreamsMarshal, pcInputStreams, pcOutputStreamsMarshal, pcOutputStreams, "HRESULT")
        return result
    }

    /**
     * The GetStreamIDs method gets the stream identifiers for the input and output streams on this Media Foundation transform (MFT).
     * @param {Integer} dwInputIDArraySize The number of elements in <i>pdwInputStreamIDs</i>
     * @param {Pointer<Integer>} pdwInputStreamIds A pointer to an array allocated by the caller. The method fills the array with the input stream identifiers. The array size must be at least equal to the number of input streams. To get the number of input streams, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imfdevicetransform-getstreamcount">IMFDeviceTransform::GetStreamCount</a>. 
     * 
     * If the caller passes an array that is larger than the number of input streams, the MFT must not write values into the extra array entries.
     * @param {Integer} dwOutputIDArraySize The number of elements in <i>pdwOutputStreamIDs</i>.
     * @param {Pointer<Integer>} pdwOutputStreamIds A pointer to an array allocated by the caller. The method fills the array with the output stream identifiers. The array size must be at least equal to the number of output streams. To get the number of output streams, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imfdevicetransform-getstreamcount">IMFDeviceTransform::GetStreamCount</a>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include but not limited to values given in the following table.
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
     * Transitioning the stream state succeeded.
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
     * Invalid pointer passed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer coming in does not  have enough space to fill in the stream IDs.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imfdevicetransform-getstreamids
     */
    GetStreamIDs(dwInputIDArraySize, pdwInputStreamIds, dwOutputIDArraySize, pdwOutputStreamIds) {
        pdwInputStreamIdsMarshal := pdwInputStreamIds is VarRef ? "uint*" : "ptr"
        pdwOutputStreamIdsMarshal := pdwOutputStreamIds is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "uint", dwInputIDArraySize, pdwInputStreamIdsMarshal, pdwInputStreamIds, "uint", dwOutputIDArraySize, pdwOutputStreamIdsMarshal, pdwOutputStreamIds, "HRESULT")
        return result
    }

    /**
     * The ProcessEvent method sends an event to an input stream on this Media Foundation transform (MFT).
     * @param {Integer} dwInputStreamID Stream identifier. To get the list of stream identifiers, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imfdevicetransform-getstreamids">IMFDeviceTransform::GetStreamIDs</a>.
     * @param {IMFMediaEvent} pEvent Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaevent">IMFMediaEvent</a> interface of an event object.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include but not limited to values given in the following table.
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
     * The event processed successfully. The event will be propagated down stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDSTREAMNUMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid stream ID was passed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_S_TRANSFORM_DO_NO_PROPOGATE_EVENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the Device MFT does not want the event to be propagated further.
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
     * The function is not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imfdevicetransform-processevent
     */
    ProcessEvent(dwInputStreamID, pEvent) {
        result := ComCall(12, this, "uint", dwInputStreamID, "ptr", pEvent, "HRESULT")
        return result
    }

    /**
     * The ProcessInput method delivers data to an input stream on this Media Foundation transform (MFT).
     * @param {Integer} dwInputStreamID Input stream identifier.
     * @param {IMFSample} pSample Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> interface of the input sample. The sample must contain at least one media buffer that contains valid input data.
     * @param {Integer} dwFlags Must be zero.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include but not limited to values given in the following table.
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
     * Method succeeded.
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
     * Invalid argument passed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device MFT could not  support the request at this time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVAILIDSTREAMNUMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid stream ID was passed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALID_STREAM_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested stream transition is not possible.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_TRANSFORM_TYPE_NOT_SET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Input media type has not been set.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imfdevicetransform-processinput
     */
    ProcessInput(dwInputStreamID, pSample, dwFlags) {
        result := ComCall(13, this, "uint", dwInputStreamID, "ptr", pSample, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The ProcessMessage method sends a message to the Device Media Foundation transform (MFT).
     * @param {Integer} eMessage The message to send, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/ne-mftransform-mft_message_type">MFT_MESSAGE_TYPE</a> enumeration.
     * @param {Pointer} ulParam Message parameter. The meaning of this parameter depends on the message type.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include but not limited to values given in the following table.
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
     * Method succeeded.
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
     * Invalid argument passed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device MFT could not  support the request at this time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVAILIDSTREAMNUMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid stream ID was passed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALID_STREAM_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested stream transition is not possible.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_TRANSFORM_TYPE_NOT_SET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Input media type has not been set.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imfdevicetransform-processmessage
     */
    ProcessMessage(eMessage, ulParam) {
        result := ComCall(14, this, "int", eMessage, "ptr", ulParam, "HRESULT")
        return result
    }

    /**
     * The ProcessOutput method gets the processed output from the Device MFT output streams.
     * @param {Integer} dwFlags Bitwise OR of zero or more flags from the <a href="https://docs.microsoft.com/windows/win32/api/mftransform/ne-mftransform-_mft_process_output_flags">_MFT_PROCESS_OUTPUT_FLAGS</a> enumeration.
     * @param {Integer} cOutputBufferCount Number of elements in the <i>pOutputSamples</i> array. The value must be at least 1.
     * @param {Pointer<MFT_OUTPUT_DATA_BUFFER>} pOutputSample Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/ns-mftransform-mft_output_data_buffer">MFT_OUTPUT_DATA_BUFFER</a> structures, allocated by the caller. The MFT uses this array to return output data to the caller.
     * @returns {Integer} Receives a bitwise OR of zero or more flags from the <a href="https://docs.microsoft.com/windows/win32/api/mftransform/ne-mftransform-_mft_process_output_status">_MFT_PROCESS_OUTPUT_STATUS</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imfdevicetransform-processoutput
     */
    ProcessOutput(dwFlags, cOutputBufferCount, pOutputSample) {
        result := ComCall(15, this, "uint", dwFlags, "uint", cOutputBufferCount, "ptr", pOutputSample, "uint*", &pdwStatus := 0, "HRESULT")
        return pdwStatus
    }

    /**
     * The SetInputStreamState method sets the Device MFT input stream state and media type.
     * @param {Integer} dwStreamID Stream ID of the input stream where the state and media type needs to be changed.
     * @param {IMFMediaType} pMediaType Preferred media type for the input stream is passed in through this parameter. Device MFT should change the media type only if the incoming media type is different from the current media type.
     * @param {Integer} value Specifies the  <b>DeviceStreamState</b> which the input stream should transition to.
     * @param {Integer} dwFlags When  <b>S_OK</b> is returned, perform the state change operation. Otherwise, this contains an error that occurred while setting the media type on the devproxy  output pin. In this case, propagate the error appropriately.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include but not limited to values given in the following table.
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
     * Initialization succeeded
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device MFT could not  support the request at this time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVAILIDSTREAMNUMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid stream ID was passed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALID_STREAM_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested stream transition is not possible.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imfdevicetransform-setinputstreamstate
     */
    SetInputStreamState(dwStreamID, pMediaType, value, dwFlags) {
        result := ComCall(16, this, "uint", dwStreamID, "ptr", pMediaType, "int", value, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The GetInputStreamState method gets the Device MFT’s input stream state.
     * @param {Integer} dwStreamID Stream ID of the input stream whose state needs to be retrieved.
     * @returns {Integer} Specifies the current <b>DeviceStreamState</b> of the specified input Device MFT stream.
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imfdevicetransform-getinputstreamstate
     */
    GetInputStreamState(dwStreamID) {
        result := ComCall(17, this, "uint", dwStreamID, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * The SetOutputStreamState method sets the Device MFT output stream state and media type.
     * @param {Integer} dwStreamID Stream ID of the input stream where the state and media type needs to be changed.
     * @param {IMFMediaType} pMediaType Preferred media type for the input stream is passed in through this parameter. Device MFT should change the media type only if the incoming media type is different from the current media type.
     * @param {Integer} value Specifies the  <b>DeviceStreamState</b> which the input stream should transition to.
     * @param {Integer} dwFlags Must be zero.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include but not limited to values given in the following table.
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
     * Transitioning the stream state succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device MFT could not  support the request at this time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVAILIDSTREAMNUMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid stream ID was passed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALID_STREAM_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested stream transition is not possible.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imfdevicetransform-setoutputstreamstate
     */
    SetOutputStreamState(dwStreamID, pMediaType, value, dwFlags) {
        result := ComCall(18, this, "uint", dwStreamID, "ptr", pMediaType, "int", value, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The GetOutputStreamState method gets the Device MFT’s output stream state.
     * @param {Integer} dwStreamID Stream ID of the output stream whose state needs to be retrieved.
     * @returns {Integer} Specifies the current <b>DeviceStreamState</b> of the specified output Device MFT stream.
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imfdevicetransform-getoutputstreamstate
     */
    GetOutputStreamState(dwStreamID) {
        result := ComCall(19, this, "uint", dwStreamID, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * The GetInputStreamPreferredState method gets a Device MFT input stream’s preferred state and media type.
     * @param {Integer} dwStreamID Stream ID of the input stream whose state needs to be retrieved.
     * @param {Pointer<Integer>} value Specifies the current <b>DeviceStreamState</b> of the specified input Device MFT stream.
     * @param {Pointer<IMFMediaType>} ppMediaType Preferred media type for the input stream is passed in through this parameter.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include but not limited to values given in the following table.
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
     * Transitioning the stream state succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device MFT could not  support the request at this time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVAILIDSTREAMNUMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid stream ID was passed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALID_STREAM_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested stream transition is not possible.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imfdevicetransform-getinputstreampreferredstate
     */
    GetInputStreamPreferredState(dwStreamID, value, ppMediaType) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, "uint", dwStreamID, valueMarshal, value, "ptr*", ppMediaType, "HRESULT")
        return result
    }

    /**
     * The FlushInputStream method flushes a Device MFT’s input stream.
     * @param {Integer} dwStreamIndex Stream ID of the input stream which needs to be flushed.
     * @param {Integer} dwFlags Contains the <b>HRESULT</b> of flushing the corresponding devproxy output stream.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include but not limited to values given in the following table.
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
     * Transitioning the stream state succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device MFT could not  support the request at this time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVAILIDSTREAMNUMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid stream ID was passed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALID_STREAM_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested stream transition is not possible.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imfdevicetransform-flushinputstream
     */
    FlushInputStream(dwStreamIndex, dwFlags) {
        result := ComCall(21, this, "uint", dwStreamIndex, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The FlushOutputStream method flushes a Device MFT’s output stream.
     * @param {Integer} dwStreamIndex Stream ID of the output stream which needs to be flushed.
     * @param {Integer} dwFlags Must be zero.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include but not limited to values given in the following table.
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
     * Transitioning the stream state succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device MFT could not  support the request at this time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVAILIDSTREAMNUMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid stream ID was passed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALID_STREAM_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested stream transition is not possible.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imfdevicetransform-flushoutputstream
     */
    FlushOutputStream(dwStreamIndex, dwFlags) {
        result := ComCall(22, this, "uint", dwStreamIndex, "uint", dwFlags, "HRESULT")
        return result
    }
}

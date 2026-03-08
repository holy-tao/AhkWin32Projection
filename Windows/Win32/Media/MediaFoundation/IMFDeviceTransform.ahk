#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaType.ahk
#Include .\IMFAttributes.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This section contains reference information for the IMFDeviceTransform interface.
 * @see https://learn.microsoft.com/windows/win32/api/mftransform/nn-mftransform-imfdevicetransform
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
     * @remarks
     * Device MFTs can take advantage of this function to initialize various internal objects and states. Pipeline can also use the input <i>IMFAttributes</i> parameter to communicate certain configuration information to the Device MFT.
     * @param {IMFAttributes} pAttributes Contains a pointer to an attribute, passed in by the capture pipeline that contains initialization parameters. The following attributes values are passed to the function
     * <table>
     * <tr>
     * <th>Attribute Key</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_DEVICEMFT_CONNECTED_FILTER_KSCONTROL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IKsControl interface of the preceding DeviceTransform object. It also implements IMFDeviceTransform, used to get necessary information needed to create a valid pipeline.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_SYMBOLIC_LINK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Denotes the symbolic link for a video capture driver
     * 
     * </td>
     * </tr>
     *  <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_DEVSOURCE_ATTRIBUTE_FRIENDLY_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies the display name for a device. The display name is a human-readable string, suitable for display in a user interface.
     * </td>
     * </tr>
     * </table>
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
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-initializetransform
     */
    InitializeTransform(pAttributes) {
        result := ComCall(3, this, "ptr", pAttributes, "HRESULT")
        return result
    }

    /**
     * The GetInputAvailableType method gets an available media type for an input stream on this Media Foundation transform (MFT).
     * @remarks
     * The MFT defines a list of available media types for each input stream and orders them by preference. This method enumerates the available media types for an input stream. To enumerate the available types, increment <i>dwTypeIndex</i> until the method returns <b>MF_E_NO_MORE_TYPES</b>.
     * 
     * <h3><a id="Implementation_notes"></a><a id="implementation_notes"></a><a id="IMPLEMENTATION_NOTES"></a>Implementation notes</h3>
     * If the MFT stores a media type internally, the MFT should return a clone of the media type, not a pointer to the original type. Otherwise, the caller might modify the type and alter the internal state of the MFT.
     * @param {Integer} dwInputStreamID Input stream identifier. To get the list of stream identifiers, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imfdevicetransform-getstreamids">IMFDeviceTransform::GetStreamID</a>.
     * @param {Integer} dwTypeIndex Index of the media type to retrieve. Media types are indexed from zero and returned in approximate order of preference.
     * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-getinputavailabletype
     */
    GetInputAvailableType(dwInputStreamID, dwTypeIndex) {
        result := ComCall(4, this, "uint", dwInputStreamID, "uint", dwTypeIndex, "ptr*", &pMediaType := 0, "HRESULT")
        return IMFMediaType(pMediaType)
    }

    /**
     * The GetInputCurrentType method gets the current media type for an input stream on this Media Foundation transform (MFT).
     * @remarks
     * If the specified input stream does not yet have a media type, the method returns <b>MF_E_TRANSFORM_TYPE_NOT_SET</b>. 
     * 
     * <h3><a id="Implementation_notes"></a><a id="implementation_notes"></a><a id="IMPLEMENTATION_NOTES"></a>Implementation notes</h3>
     * The MFT should return a clone of the media type, not a pointer to the original type. Otherwise, the caller might modify the type and alter the internal state of the MFT.
     * @param {Integer} dwInputStreamID Input stream identifier. To get the list of stream identifiers, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imfdevicetransform-getstreamids">IMFDeviceTransform::GetStreamIDs</a>.
     * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface that represents the current type used by that stream.
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-getinputcurrenttype
     */
    GetInputCurrentType(dwInputStreamID) {
        result := ComCall(5, this, "uint", dwInputStreamID, "ptr*", &pMediaType := 0, "HRESULT")
        return IMFMediaType(pMediaType)
    }

    /**
     * The GetInputStreamAttributes method gets the attribute store for an input stream on this Media Foundation transform (MFT).
     * @remarks
     * This method  is used by DTM to get a specific input stream’s attribute store.
     * @param {Integer} dwInputStreamID Stream ID of the input stream whose state needs to be retrieved.
     * @returns {IMFAttributes} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-getinputstreamattributes
     */
    GetInputStreamAttributes(dwInputStreamID) {
        result := ComCall(6, this, "uint", dwInputStreamID, "ptr*", &ppAttributes := 0, "HRESULT")
        return IMFAttributes(ppAttributes)
    }

    /**
     * The GetOutputAvailableType method gets an available media type for an output stream on this Media Foundation transform (MFT).
     * @remarks
     * The MFT defines a list of available media types for each output stream and orders them by preference.
     * 
     * This method enumerates the available media types for an output stream. To enumerate the available types, increment <i>dwTypeIndex</i> until the method returns <b>MF_E_NO_MORE_TYPES</b>.
     * 
     * <h3><a id="Implementation_notes"></a><a id="implementation_notes"></a><a id="IMPLEMENTATION_NOTES"></a>Implementation notes</h3>
     * If the MFT stores a media type internally, the MFT should return a clone of the media type, not a pointer to the original type. Otherwise, the caller might modify the type and alter the internal state of the MFT.
     * @param {Integer} dwOutputStreamID Output stream identifier. To get the list of stream identifiers, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imfdevicetransform-getstreamids">IMFDeviceTransform::GetStreamIDs</a>.
     * @param {Integer} dwTypeIndex Index of the media type to retrieve. Media types are indexed from zero and returned in approximate order of preference.
     * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-getoutputavailabletype
     */
    GetOutputAvailableType(dwOutputStreamID, dwTypeIndex) {
        result := ComCall(7, this, "uint", dwOutputStreamID, "uint", dwTypeIndex, "ptr*", &pMediaType := 0, "HRESULT")
        return IMFMediaType(pMediaType)
    }

    /**
     * The GetOutputCurrentType method gets the current media type for an output stream on this Media Foundation transform (MFT).
     * @remarks
     * If the specified output stream does not yet have a media type, the method returns <b>MF_E_TRANSFORM_TYPE_NOT_SET</b>.
     * 
     * <h3><a id="Implementation_notes"></a><a id="implementation_notes"></a><a id="IMPLEMENTATION_NOTES"></a>Implementation notes</h3>
     * The MFT should return a clone of the media type, not a pointer to the original type. Otherwise, the caller might modify the type and alter the internal state of the MFT.
     * @param {Integer} dwOutputStreamID Output stream identifier. To get the list of stream identifiers, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imfdevicetransform-getstreamids">IMFDeviceTransform::GetStreamIDs</a>.
     * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface that represents the current type used by that stream.
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-getoutputcurrenttype
     */
    GetOutputCurrentType(dwOutputStreamID) {
        result := ComCall(8, this, "uint", dwOutputStreamID, "ptr*", &pMediaType := 0, "HRESULT")
        return IMFMediaType(pMediaType)
    }

    /**
     * The GetOutputStreamAttributes method gets the attribute store for an output stream on this Media Foundation transform (MFT).
     * @remarks
     * This function is used by the DTM to get a specific output stream’s attribute store.
     * @param {Integer} dwOutputStreamID The Stream ID of the output stream whose state needs to be retrieved.
     * @returns {IMFAttributes} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-getoutputstreamattributes
     */
    GetOutputStreamAttributes(dwOutputStreamID) {
        result := ComCall(9, this, "uint", dwOutputStreamID, "ptr*", &ppAttributes := 0, "HRESULT")
        return IMFAttributes(ppAttributes)
    }

    /**
     * The GetStreamCount method gets the current number of input and output streams on this Media Foundation transform (MFT).
     * @remarks
     * This function is used by DTM to get the number of streams supported by the Device MFT. The number of streams include unselected streams., fore example, streams with no media type or a NULL media type.
     * 
     * This method would not be called with NULL parameters.
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
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-getstreamcount
     */
    GetStreamCount(pcInputStreams, pcOutputStreams) {
        pcInputStreamsMarshal := pcInputStreams is VarRef ? "uint*" : "ptr"
        pcOutputStreamsMarshal := pcOutputStreams is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pcInputStreamsMarshal, pcInputStreams, pcOutputStreamsMarshal, pcOutputStreams, "HRESULT")
        return result
    }

    /**
     * The GetStreamIDs method gets the stream identifiers for the input and output streams on this Media Foundation transform (MFT).
     * @remarks
     * Stream identifiers are necessary because some MFTs can add or remove streams, so the index of a stream may not be unique. Therefore, <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nn-mftransform-imfdevicetransform">IMFDeviceTransform</a> methods that operate on streams take stream identifiers.
     * 
     * All input stream identifiers must be unique within an MFT, and all output stream identifiers must be unique. However, an input stream and an output stream can share the same identifier. 
     * I
     * 
     * If the client adds an input stream, the client assigns the identifier, so the MFT must allow arbitrary identifiers, as long as they are unique. If the MFT creates an output stream, the MFT assigns the identifier. 
     * 
     * 
     * By convention, if an MFT has exactly one fixed input stream and one fixed output stream, it should assign the identifier 0 to both streams.
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
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-getstreamids
     */
    GetStreamIDs(dwInputIDArraySize, pdwInputStreamIds, dwOutputIDArraySize, pdwOutputStreamIds) {
        pdwInputStreamIdsMarshal := pdwInputStreamIds is VarRef ? "uint*" : "ptr"
        pdwOutputStreamIdsMarshal := pdwOutputStreamIds is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "uint", dwInputIDArraySize, pdwInputStreamIdsMarshal, pdwInputStreamIds, "uint", dwOutputIDArraySize, pdwOutputStreamIdsMarshal, pdwOutputStreamIds, "HRESULT")
        return result
    }

    /**
     * The ProcessEvent method sends an event to an input stream on this Media Foundation transform (MFT).
     * @remarks
     * An MFT can handle sending the event downstream, or it can let the DTM do this, as indicated by the return value:
     * 
     * <ul>
     * <li><b>E_NOTIMPL:</b> The MFT ignores all events, and the DTM should send all events downstream. After the pipeline receives this return value</li>
     * <li><b>S_OK: </b>The MFT has examined this event, but the DTM should send the event downstream. Internally, the MFT might respond to the event in some way, or it might ignore the event. </li>
     * <li><b>MF_S_TRANSFORM_DO_NOT_PROPAGATE_EVENT:</b> The DTM should not propagate this event downstream. Either the MFT will send the event downstream, or else the MFT will consume the event and not send it downstream. The MFT should only consume the event if the event should stop at this MFT and not travel any further downstream. But in most cases, the event should travel downstream. </li>
     * </ul>
     * To send the event downstream, the MFT adds the event to the collection object that is provided by the client in the pEvents member of the <b>MFT_OUTPUT_DATA_BUFFER</b> structure, when the client calls <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imfdevicetransform-processoutput">IMFTransform::ProcessOutput</a>. 
     * 
     * Events must be serialized with the samples that come before and after them. Attach the event to the output sample that follows the event. (The pipeline will process the event first, and then the sample.) If an MFT holds back one or more samples between calls to <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imfdevicetransform-processinput">IMFTransform::ProcessInput</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imfdevicetransform-processoutput">IMFTransform::ProcessOutput</a>, the MFT should handle sending all events downstream, because in this situation the pipeline cannot correlate input samples with output samples.
     * 
     * If an MFT does not hold back samples and does not need to examine any events, it can return <b>E_NOTIMPL</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-processevent
     */
    ProcessEvent(dwInputStreamID, pEvent) {
        result := ComCall(12, this, "uint", dwInputStreamID, "ptr", pEvent, "HRESULT")
        return result
    }

    /**
     * The ProcessInput method delivers data to an input stream on this Media Foundation transform (MFT).
     * @remarks
     * In most cases, if the method succeeds, the MFT stores the sample and holds a reference count on the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> pointer. When the MFT is done using the sample it must release it to avoid a memory leak.
     * 
     * After the DTM has set valid media types on all of the streams, the MFT should always be able to accept more input and be able to produce more output. 
     * 
     * If an MFT encounters a non-fatal error in the input data, it can simply drop the data and attempt to recover when it gets the more input data. If the MFT drops any data, it should set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mfsampleextension-discontinuity-attribute">MFSampleExtension_Discontinuity</a> attribute on the next output sample, to notify the caller that there is a gap in the data stream.
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
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-processinput
     */
    ProcessInput(dwInputStreamID, pSample, dwFlags) {
        result := ComCall(13, this, "uint", dwInputStreamID, "ptr", pSample, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The ProcessMessage method sends a message to the Device Media Foundation transform (MFT).
     * @remarks
     * Before calling this method, set the media types on all input and output streams.
     * 
     * The MFT might ignore certain message types. If so, the method returns <b>S_OK</b>. An error code indicates that the transform handles this message type but was unable to process the message in this instance.
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/ne-mftransform-mft_message_type">MFT_MESSAGE_TYPE</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-processmessage
     */
    ProcessMessage(eMessage, ulParam) {
        result := ComCall(14, this, "int", eMessage, "ptr", ulParam, "HRESULT")
        return result
    }

    /**
     * The ProcessOutput method gets the processed output from the Device MFT output streams.
     * @remarks
     * In most cases, if the method succeeds, the Media Foundation transform (MFT) stores the sample and holds a reference count on the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> pointer. When the MFT is done using the sample, it must release it to avoid memory leaks.
     * 
     * 
     * After the device transform manager (DTM) has set valid media types on all of the streams, the MFT should always be able to accept more input and be able to produce more output. 
     * 
     * 
     * If an MFT encounters a non-fatal error in the input data, it can simply drop the data and attempt to recover when it gets the more input data. If the MFT drops any data, it should set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mfsampleextension-discontinuity-attribute">MFSampleExtension_Discontinuity</a> attribute on the next output sample, to notify the caller that there is a gap in the data stream.
     * @param {Integer} dwFlags Bitwise OR of zero or more flags from the <a href="https://docs.microsoft.com/windows/win32/api/mftransform/ne-mftransform-_mft_process_output_flags">_MFT_PROCESS_OUTPUT_FLAGS</a> enumeration.
     * @param {Integer} cOutputBufferCount Number of elements in the <i>pOutputSamples</i> array. The value must be at least 1.
     * @param {Pointer<MFT_OUTPUT_DATA_BUFFER>} pOutputSample Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/ns-mftransform-mft_output_data_buffer">MFT_OUTPUT_DATA_BUFFER</a> structures, allocated by the caller. The MFT uses this array to return output data to the caller.
     * @returns {Integer} Receives a bitwise OR of zero or more flags from the <a href="https://docs.microsoft.com/windows/win32/api/mftransform/ne-mftransform-_mft_process_output_status">_MFT_PROCESS_OUTPUT_STATUS</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-processoutput
     */
    ProcessOutput(dwFlags, cOutputBufferCount, pOutputSample) {
        result := ComCall(15, this, "uint", dwFlags, "uint", cOutputBufferCount, "ptr", pOutputSample, "uint*", &pdwStatus := 0, "HRESULT")
        return pdwStatus
    }

    /**
     * The SetInputStreamState method sets the Device MFT input stream state and media type.
     * @remarks
     * This interface function helps to transition the input stream to a specified state with a specified media type set on the input stream. This will be used by device transform  manager (DTM) when the Device MFT requests a specific input stream’s state and media type to be changed. Device MFT would need to request such a change when one of the Device MFT's output changes.
     * 
     * As an  example, consider a Device MFT that has two input streams and three output streams. Let  Output 1 and Output 2 source from Input 1 and  stream at 720p. Now, if   Output 2’s media type changes to 1080p, Device MFT has to change Input 1's media type to 1080p. To achieve this, Device MFT should request DTM to call this method using the <a href="https://docs.microsoft.com/windows-hardware/drivers/stream/metransforminputstreamstatechanged">METransformInputStreamStateChanged</a> message.
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
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-setinputstreamstate
     */
    SetInputStreamState(dwStreamID, pMediaType, value, dwFlags) {
        result := ComCall(16, this, "uint", dwStreamID, "ptr", pMediaType, "int", value, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The GetInputStreamState method gets the Device MFT’s input stream state.
     * @remarks
     * This method is used by device transform  manager (DTM) to get a specific input stream’s state.
     * @param {Integer} dwStreamID Stream ID of the input stream whose state needs to be retrieved.
     * @returns {Integer} Specifies the current <b>DeviceStreamState</b> of the specified input Device MFT stream.
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-getinputstreamstate
     */
    GetInputStreamState(dwStreamID) {
        result := ComCall(17, this, "uint", dwStreamID, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * The SetOutputStreamState method sets the Device MFT output stream state and media type.
     * @remarks
     * This interface method helps to transition the output stream to a specified state with specified media type set on the output stream. This will be used by the DTM when the Device Source requests a specific output stream’s state and media type to be changed. Device MFT should change the specified output stream’s media type and state to the requested media type.
     * 
     * If the incoming media type and stream state are same as the current media type and stream state the method return <b>S_OK</b>.
     * 
     * If the incoming media type and current media type of the stream are the same, Device MFT must change the stream’s state to the requested value and return the appropriate <b>HRESULT</b>.
     * 
     * When a change in the output stream’s media type requires a corresponding change in the input then Device MFT must post the <a href="https://docs.microsoft.com/windows-hardware/drivers/stream/metransforminputstreamstatechanged">METransformInputStreamStateChanged</a> event  to DTM to change the relevant input stream. The call must return only after changing the input stream’s media type and the appropriate <b>HRESULT</b>.
     * 
     * As an  example, consider a Device MFT that has two input streams and three output streams. Let  Output 1 and Output 2 source from Input 1 and  stream at 720p. Now, let us say Output 2’s media type changes to 1080p. To satisfy this request, Device MFT must  change the Input 1 media type to 1080p, by posting <a href="https://docs.microsoft.com/windows-hardware/drivers/stream/metransforminputstreamstatechanged">METransformInputStreamStateChanged</a> event to the DTM. DTM would call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imfdevicetransform-setinputstreamstate">SetInputStreamState</a> to change the input stream’ media type and state. After this call, the <b>SetOutputStreamState</b> must return.
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
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-setoutputstreamstate
     */
    SetOutputStreamState(dwStreamID, pMediaType, value, dwFlags) {
        result := ComCall(18, this, "uint", dwStreamID, "ptr", pMediaType, "int", value, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The GetOutputStreamState method gets the Device MFT’s output stream state.
     * @remarks
     * This method is used by device transform manager (DTM) to get a specific output stream’s state.
     * @param {Integer} dwStreamID Stream ID of the output stream whose state needs to be retrieved.
     * @returns {Integer} Specifies the current <b>DeviceStreamState</b> of the specified output Device MFT stream.
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-getoutputstreamstate
     */
    GetOutputStreamState(dwStreamID) {
        result := ComCall(19, this, "uint", dwStreamID, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * The GetInputStreamPreferredState method gets a Device MFT input stream’s preferred state and media type.
     * @remarks
     * This interface function helps to query the Device MFT input stream’s preferred state and mediatype to which it needs to be transitioned.
     * 
     * When a change in the output stream’s media type needs corresponding change in the input, then Device MFT would post <a href="https://docs.microsoft.com/windows-hardware/drivers/stream/metransforminputstreamstatechanged">METransformInputStreamStateChanged</a> to DTM to change the relevant input stream. DTM would call <b>GetInputStreamPreferredState</b> to retrieve Device MFT input stream’s preferred mediatype and state.
     * 
     * As an  example, consider a Device MFT that has two input streams and three output streams. Let  Output 1 and Output 2 source from Input 1 and  stream at 720p. Now, let us say Output 2’s media type changes to 1080p. To satisfy this request, Device MFT must  change the Input 1 media type to 1080p, by posting <a href="https://docs.microsoft.com/windows-hardware/drivers/stream/metransforminputstreamstatechanged">METransformInputStreamStateChanged</a> event to the DTM. DTM would call <b>GetInputStreamPreferredState</b> and retrieve the preferred state and mediatype. DTM would call  <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imfdevicetransform-setinputstreamstate">SetInputStreamState</a> to change the input stream’ mediatype and state.
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
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-getinputstreampreferredstate
     */
    GetInputStreamPreferredState(dwStreamID, value, ppMediaType) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, "uint", dwStreamID, valueMarshal, value, "ptr*", ppMediaType, "HRESULT")
        return result
    }

    /**
     * The FlushInputStream method flushes a Device MFT’s input stream.
     * @remarks
     * This interface method helps to flush a Device MFT’s input stream.
     * 
     * Device MFT should drop all samples in its queues and reset all its internal data structures related to that input stream. This is equivalent to resetting the input stream. The media type and stream state must not change.
     * 
     * <h3><a id="When_called"></a><a id="when_called"></a><a id="WHEN_CALLED"></a>When called</h3>
     * When the input stream needs to be reset, device transform manager (DTM) would call this method.
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
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-flushinputstream
     */
    FlushInputStream(dwStreamIndex, dwFlags) {
        result := ComCall(21, this, "uint", dwStreamIndex, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The FlushOutputStream method flushes a Device MFT’s output stream.
     * @remarks
     * This interface function helps to flush a Device MFT’s output stream.
     * 
     * Device MFT should drop all samples in its queues and reset all its internal data structures related to that output stream. This is equivalent to resetting the output stream. The media type and stream state must not change.
     * 
     * <h3><a id="When_called"></a><a id="when_called"></a><a id="WHEN_CALLED"></a>When called</h3>
     * When the output stream needs to be reset, device transform manager (DTM) would call this method.
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
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imfdevicetransform-flushoutputstream
     */
    FlushOutputStream(dwStreamIndex, dwFlags) {
        result := ComCall(22, this, "uint", dwStreamIndex, "uint", dwFlags, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\MFT_INPUT_STREAM_INFO.ahk
#Include .\MFT_OUTPUT_STREAM_INFO.ahk
#Include .\IMFAttributes.ahk
#Include .\IMFMediaType.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by all Media Foundation Transforms (MFTs).
 * @see https://learn.microsoft.com/windows/win32/api/mftransform/nn-mftransform-imftransform
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTransform extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFTransform
     * @type {Guid}
     */
    static IID => Guid("{bf94c121-5b05-4e6f-8000-ba598961414d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStreamLimits", "GetStreamCount", "GetStreamIDs", "GetInputStreamInfo", "GetOutputStreamInfo", "GetAttributes", "GetInputStreamAttributes", "GetOutputStreamAttributes", "DeleteInputStream", "AddInputStreams", "GetInputAvailableType", "GetOutputAvailableType", "SetInputType", "SetOutputType", "GetInputCurrentType", "GetOutputCurrentType", "GetInputStatus", "GetOutputStatus", "SetOutputBounds", "ProcessEvent", "ProcessMessage", "ProcessInput", "ProcessOutput"]

    /**
     * Gets the minimum and maximum number of input and output streams for this Media Foundation transform (MFT).
     * @remarks
     * If the MFT has a fixed number of streams, the minimum and maximum values are the same.
     *       
     * 
     * It is not recommended to create an MFT that supports zero inputs or zero outputs. An MFT with no inputs or no outputs may not be compatible with the rest of the Media Foundation pipeline. You should create a Media Foundation sink or source for this purpose instead.
     *       
     * 
     * When an MFT is first created, it is not guaranteed to have the minimum number of streams. To find the actual number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getstreamcount">IMFTransform::GetStreamCount</a>.
     *       
     * 
     * This method should not be called with <b>NULL</b> parameters, although in practice some implementations may allow <b>NULL</b> parameters.
     *       
     * 
     * If <b>MFT_UNIQUE_METHOD_NAMES</b> is defined before including mftransform.h, this method is renamed <b>MFTGetStreamLimits</b>. See <a href="https://docs.microsoft.com/windows/desktop/medfound/comparison-of-mfts-and-dmos">Creating Hybrid DMO/MFT Objects</a>.
     * @param {Pointer<Integer>} pdwInputMinimum Receives the minimum number of input streams.
     * @param {Pointer<Integer>} pdwInputMaximum Receives the maximum number of input streams. If there is no maximum, receives the value <b>MFT_STREAMS_UNLIMITED</b>.
     * @param {Pointer<Integer>} pdwOutputMinimum Receives the minimum number of output streams.
     * @param {Pointer<Integer>} pdwOutputMaximum Receives the maximum number of output streams. If there is no maximum, receives the value <b>MFT_STREAMS_UNLIMITED</b>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getstreamlimits
     */
    GetStreamLimits(pdwInputMinimum, pdwInputMaximum, pdwOutputMinimum, pdwOutputMaximum) {
        pdwInputMinimumMarshal := pdwInputMinimum is VarRef ? "uint*" : "ptr"
        pdwInputMaximumMarshal := pdwInputMaximum is VarRef ? "uint*" : "ptr"
        pdwOutputMinimumMarshal := pdwOutputMinimum is VarRef ? "uint*" : "ptr"
        pdwOutputMaximumMarshal := pdwOutputMaximum is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwInputMinimumMarshal, pdwInputMinimum, pdwInputMaximumMarshal, pdwInputMaximum, pdwOutputMinimumMarshal, pdwOutputMinimum, pdwOutputMaximumMarshal, pdwOutputMaximum, "HRESULT")
        return result
    }

    /**
     * Gets the current number of input and output streams on this Media Foundation transform (MFT).
     * @remarks
     * The number of streams includes unselected streams—that is, streams with no media type or a <b>NULL</b> media type.
     * 
     * This method should not be called with <b>NULL</b> parameters, although in practice some implementations may allow <b>NULL</b> parameters.
     *       
     * 
     * If <b>MFT_UNIQUE_METHOD_NAMES</b> is defined before including mftransform.h, this method is renamed <b>MFTGetStreamCount</b>. See <a href="https://docs.microsoft.com/windows/desktop/medfound/comparison-of-mfts-and-dmos">Creating Hybrid DMO/MFT Objects</a>.
     * @param {Pointer<Integer>} pcInputStreams Receives the number of input streams.
     * @param {Pointer<Integer>} pcOutputStreams Receives the number of output streams.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getstreamcount
     */
    GetStreamCount(pcInputStreams, pcOutputStreams) {
        pcInputStreamsMarshal := pcInputStreams is VarRef ? "uint*" : "ptr"
        pcOutputStreamsMarshal := pcOutputStreams is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pcInputStreamsMarshal, pcInputStreams, pcOutputStreamsMarshal, pcOutputStreams, "HRESULT")
        return result
    }

    /**
     * Gets the stream identifiers for the input and output streams on this Media Foundation transform (MFT).
     * @remarks
     * Stream identifiers are necessary because some MFTs can add or remove streams, so the index of a stream may not be unique. Therefore, <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nn-mftransform-imftransform">IMFTransform</a> methods that operate on streams take stream identifiers.
     *       
     * 
     * This method can return <b>E_NOTIMPL</b> if both of the following conditions are true:
     * 
     * <ul>
     * <li>The transform has a fixed number of streams.
     *           </li>
     * <li>The streams are numbered consecutively from 0 to n – 1, where n is the number of input streams or output streams. In other words, the first input stream is 0, the second is 1, and so on; and the first output stream is 0, the second is 1, and so on.
     *           </li>
     * </ul>
     * This method must be implemented if any of the following conditions is true:
     * 
     * <ul>
     * <li>The MFT can add or remove output streams.
     *           </li>
     * <li>The MFT allows the client to add or remove input streams.
     *           </li>
     * <li>The stream identifiers are not consecutive.
     *           </li>
     * </ul>
     * All input stream identifiers must be unique within an MFT, and all output stream identifiers must be unique. However, an input stream and an output stream can share the same identifier.
     *       
     * 
     * If the client adds an input stream, the client assigns the identifier, so the MFT must allow arbitrary identifiers, as long as they are unique. If the MFT creates an output stream, the MFT assigns the identifier.
     *       
     * 
     * By convention, if an MFT has exactly one fixed input stream and one fixed output stream, it should assign the identifier 0 to both streams.
     *       
     * 
     * If <b>MFT_UNIQUE_METHOD_NAMES</b> is defined before including mftransform.h, this method is renamed <b>MFTGetStreamIDs</b>. See <a href="https://docs.microsoft.com/windows/desktop/medfound/comparison-of-mfts-and-dmos">Creating Hybrid DMO/MFT Objects</a>.
     * @param {Integer} dwInputIDArraySize Number of elements in the <i>pdwInputIDs</i> array.
     * @param {Pointer<Integer>} pdwInputIDs Pointer to an array allocated by the caller. The method fills the array with the input stream identifiers. The array size must be at least equal to the number of input streams. To get the number of input streams, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getstreamcount">IMFTransform::GetStreamCount</a>.
     *           
     * 
     * If the caller passes an array that is larger than the number of input streams, the MFT must not write values into the extra array entries.
     * @param {Integer} dwOutputIDArraySize Number of elements in the <i>pdwOutputIDs</i> array.
     * @param {Pointer<Integer>} pdwOutputIDs Pointer to an array allocated by the caller. The method fills the array with the output stream identifiers. The array size must be at least equal to the number of output streams. To get the number of output streams, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getstreamcount">GetStreamCount</a>.
     *           
     * 
     * If the caller passes an array that is larger than the number of output streams, the MFT must not write values into the extra array entries.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
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
     * Not implemented. See Remarks.
     *               
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
     * One or both of the arrays is too small.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getstreamids
     */
    GetStreamIDs(dwInputIDArraySize, pdwInputIDs, dwOutputIDArraySize, pdwOutputIDs) {
        pdwInputIDsMarshal := pdwInputIDs is VarRef ? "uint*" : "ptr"
        pdwOutputIDsMarshal := pdwOutputIDs is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", dwInputIDArraySize, pdwInputIDsMarshal, pdwInputIDs, "uint", dwOutputIDArraySize, pdwOutputIDsMarshal, pdwOutputIDs, "HRESULT")
        return result
    }

    /**
     * Gets the buffer requirements and other information for an input stream on this Media Foundation transform (MFT).
     * @remarks
     * It is valid to call this method before setting the media types. Note that the results of this call can change dynamically after the media type changes and after <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processinput">ProcessInput</a> is called, so you may need to call this method again after either of these occur.
     * 
     * If <b>MFT_UNIQUE_METHOD_NAMES</b> is defined before including mftransform.h, this method is renamed <b>MFTGetInputStreamInfo</b>. See <a href="https://docs.microsoft.com/windows/desktop/medfound/comparison-of-mfts-and-dmos">Creating Hybrid DMO/MFT Objects</a>.
     * @param {Integer} dwInputStreamID Input stream identifier. To get the list of stream identifiers, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getstreamids">IMFTransform::GetStreamIDs</a>.
     * @returns {MFT_INPUT_STREAM_INFO} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/ns-mftransform-mft_input_stream_info">MFT_INPUT_STREAM_INFO</a> structure. The method fills the structure with information about the input stream.
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getinputstreaminfo
     */
    GetInputStreamInfo(dwInputStreamID) {
        pStreamInfo := MFT_INPUT_STREAM_INFO()
        result := ComCall(6, this, "uint", dwInputStreamID, "ptr", pStreamInfo, "HRESULT")
        return pStreamInfo
    }

    /**
     * Gets the buffer requirements and other information for an output stream on this Media Foundation transform (MFT).
     * @remarks
     * It is valid to call this method before setting the media types. Note that the results of this call can change dynamically after the media type changes and after <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">ProcessOutput</a> is called, so you may need to call this method again after either of these occur.
     * 
     * If <b>MFT_UNIQUE_METHOD_NAMES</b> is defined before including mftransform.h, this method is renamed <b>MFTGetOutputStreamInfo</b>. See <a href="https://docs.microsoft.com/windows/desktop/medfound/comparison-of-mfts-and-dmos">Creating Hybrid DMO/MFT Objects</a>.
     * @param {Integer} dwOutputStreamID Output stream identifier. To get the list of stream identifiers, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getstreamids">IMFTransform::GetStreamIDs</a>.
     * @returns {MFT_OUTPUT_STREAM_INFO} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/ns-mftransform-mft_output_stream_info">MFT_OUTPUT_STREAM_INFO</a> structure. The method fills the structure with information about the output stream.
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getoutputstreaminfo
     */
    GetOutputStreamInfo(dwOutputStreamID) {
        pStreamInfo := MFT_OUTPUT_STREAM_INFO()
        result := ComCall(7, this, "uint", dwOutputStreamID, "ptr", pStreamInfo, "HRESULT")
        return pStreamInfo
    }

    /**
     * Gets the global attribute store for this Media Foundation transform (MFT).
     * @remarks
     * Use the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> pointer retrieved by this method to get or set attributes that apply to the entire MFT. To get the attribute store for an input stream, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getinputstreamattributes">IMFTransform::GetInputStreamAttributes</a>. To get the attribute store for an output stream, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getoutputstreamattributes">IMFTransform::GetOutputStreamAttributes</a>.
     *       
     * 
     * Implementation of this method is optional unless the MFT needs to support a particular set of attributes. Exception: Hardware-based MFTs must implement this method. See <a href="https://docs.microsoft.com/windows/desktop/medfound/hardware-mfts">Hardware MFTs</a>.
     * @returns {IMFAttributes} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getattributes
     */
    GetAttributes() {
        result := ComCall(8, this, "ptr*", &pAttributes := 0, "HRESULT")
        return IMFAttributes(pAttributes)
    }

    /**
     * Gets the attribute store for an input stream on this Media Foundation transform (MFT).
     * @remarks
     * Implementation of this method is optional unless the MFT needs to support a particular set of attributes. 
     * 
     * To get the attribute store for the entire MFT, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getattributes">IMFTransform::GetAttributes</a>.
     * @param {Integer} dwInputStreamID Input stream identifier. To get the list of stream identifiers, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getstreamids">IMFTransform::GetStreamIDs</a>.
     * @returns {IMFAttributes} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getinputstreamattributes
     */
    GetInputStreamAttributes(dwInputStreamID) {
        result := ComCall(9, this, "uint", dwInputStreamID, "ptr*", &pAttributes := 0, "HRESULT")
        return IMFAttributes(pAttributes)
    }

    /**
     * Gets the attribute store for an output stream on this Media Foundation transform (MFT).
     * @remarks
     * Implementation of this method is optional unless the MFT needs to support a particular set of attributes. 
     * 
     * To get the attribute store for the entire MFT, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getattributes">IMFTransform::GetAttributes</a>.
     * @param {Integer} dwOutputStreamID Output stream identifier. To get the list of stream identifiers, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getstreamids">IMFTransform::GetStreamIDs</a>.
     * @returns {IMFAttributes} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getoutputstreamattributes
     */
    GetOutputStreamAttributes(dwOutputStreamID) {
        result := ComCall(10, this, "uint", dwOutputStreamID, "ptr*", &pAttributes := 0, "HRESULT")
        return IMFAttributes(pAttributes)
    }

    /**
     * Removes an input stream from this Media Foundation transform (MFT).
     * @remarks
     * If the transform has a fixed number of input streams, the method returns <b>E_NOTIMPL</b>.
     *       
     * 
     * An MFT might support this method but not allow certain input streams to be removed. If an input stream can be removed, the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getinputstreaminfo">IMFTransform::GetInputStreamInfo</a> method returns the <b>MFT_INPUT_STREAM_REMOVABLE</b> flag for that stream. Otherwise, the stream cannot be removed, and the method returns <b>MF_E_INVALIDREQUEST</b>. The method also fails if the MFT currently has the minimum number of input streams that it requires. To find the minimum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getstreamlimits">IMFTransform::GetStreamLimits</a>.
     *       
     * 
     * If the transform still has unprocessed input for that stream, the method might succeed or it might return <b>MF_E_TRANSFORM_INPUT_REMAINING</b>. If the method succeeds, the MFT will continue to process the remaining input after the stream is removed. If the method returns <b>MF_E_TRANSFORM_INPUT_REMAINING</b>, you must clear the input buffers before removing the stream. To clear the input buffers, either call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">IMFTransform::ProcessOutput</a> or else call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processmessage">IMFTransform::ProcessMessage</a> with the <b>MFT_MESSAGE_COMMAND_FLUSH</b> to flush the MFT. Then call the <b>DeleteInputStream</b> again. An MFT should never discard input buffers when <b>DeleteInputStream</b> is called.
     *       
     * 
     * If <b>MFT_UNIQUE_METHOD_NAMES</b> is defined before including mftransform.h, this method is renamed <b>MFTDeleteInputStream</b>. See <a href="https://docs.microsoft.com/windows/desktop/medfound/comparison-of-mfts-and-dmos">Creating Hybrid DMO/MFT Objects</a>.
     * @param {Integer} dwStreamID Identifier of the input stream to remove.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
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
     * The transform has a fixed number of input streams.
     *               
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
     * The stream is not removable, or the transform currently has the minimum number of input streams it can support.
     *               
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
     * Invalid stream identifier.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_TRANSFORM_INPUT_REMAINING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The transform has unprocessed input buffers for the specified stream.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-deleteinputstream
     */
    DeleteInputStream(dwStreamID) {
        result := ComCall(11, this, "uint", dwStreamID, "HRESULT")
        return result
    }

    /**
     * Adds one or more new input streams to this Media Foundation transform (MFT).
     * @remarks
     * If the new streams exceed the maximum number of input streams for this transform, the method returns <b>E_INVALIDARG.</b> To find the maximum number of input streams, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getstreamlimits">IMFTransform::GetStreamLimits</a>.
     *       
     * 
     * If any of the new stream identifiers conflicts with an existing input stream, the method returns <b>E_INVALIDARG</b>.
     *       
     * 
     * If <b>MFT_UNIQUE_METHOD_NAMES</b> is defined before including mftransform.h, this method is renamed <b>MFTAddInputStreams</b>. See <a href="https://docs.microsoft.com/windows/desktop/medfound/comparison-of-mfts-and-dmos">Creating Hybrid DMO/MFT Objects</a>.
     * @param {Integer} cStreams Number of streams to add.
     * @param {Pointer<Integer>} adwStreamIDs Array of stream identifiers. The new stream identifiers must not match any existing input streams.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
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
     * Invalid argument.
     *               
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
     * The MFT has a fixed number of input streams.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-addinputstreams
     */
    AddInputStreams(cStreams, adwStreamIDs) {
        adwStreamIDsMarshal := adwStreamIDs is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "uint", cStreams, adwStreamIDsMarshal, adwStreamIDs, "HRESULT")
        return result
    }

    /**
     * Gets an available media type for an input stream on this Media Foundation transform (MFT).
     * @remarks
     * The MFT defines a list of available media types for each input stream and orders them by preference. This method enumerates the available media types for an input stream. To enumerate the available types, increment <i>dwTypeIndex</i> until the method returns <b>MF_E_NO_MORE_TYPES</b>.
     *       
     * 
     * Setting the media type on one stream might change the available types for another stream, or change the preference order. However, an MFT is not required to update the list of available types dynamically. The only guaranteed way to test whether you can set a particular input type is to call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-setinputtype">IMFTransform::SetInputType</a>.
     *       
     * 
     * In some cases, an MFT cannot return a list of input types until one or more output types are set. If so, the method returns <b>MF_E_TRANSFORM_TYPE_NOT_SET</b>.
     *       
     * 
     * An MFT is not required to implement this method. However, most MFTs should implement this method, unless the supported types are simple and can be discovered through the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftgetinfo">MFTGetInfo</a> function.
     * 
     * If <b>MFT_UNIQUE_METHOD_NAMES</b> is defined before including mftransform.h, this method is renamed <b>MFTGetInputAvailableType</b>. See <a href="https://docs.microsoft.com/windows/desktop/medfound/comparison-of-mfts-and-dmos">Creating Hybrid DMO/MFT Objects</a>.
     * 
     * For encoders, after the output type is set, <b>GetInputAvailableType</b> must return a list of input types that are compatible with the current output type. This means that all types returned by <b>GetInputAvailableType</b> after the output type is set must be valid types for <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-setinputtype">SetInputType</a>.
     * 
     * Encoders should reject input types if the attributes of the input media type and output media type do not match, such as resolution setting with <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-frame-size-attribute">MF_MT_FRAME_SIZE</a>, nominal range setting with <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-video-nominal-range-attribute">MF_MT_VIDEO_NOMINAL_RANGE</a>, or frame rate setting with MF_MT_FRAME_SIZE
     * 
     * <h3><a id="Implementation_Notes"></a><a id="implementation_notes"></a><a id="IMPLEMENTATION_NOTES"></a>Implementation Notes</h3>
     * If the MFT stores a media type internally, the MFT should return a clone of the media  type, not a pointer to the original type. Otherwise, the caller might modify the type and alter the internal state of the MFT.
     * @param {Integer} dwInputStreamID Input stream identifier. To get the list of stream identifiers, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getstreamids">IMFTransform::GetStreamIDs</a>.
     * @param {Integer} dwTypeIndex Index of the media type to retrieve. Media types are indexed from zero and returned in approximate order of preference.
     * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getinputavailabletype
     */
    GetInputAvailableType(dwInputStreamID, dwTypeIndex) {
        result := ComCall(13, this, "uint", dwInputStreamID, "uint", dwTypeIndex, "ptr*", &ppType := 0, "HRESULT")
        return IMFMediaType(ppType)
    }

    /**
     * Gets an available media type for an output stream on this Media Foundation transform (MFT).
     * @remarks
     * The MFT defines a list of available media types for each output stream and orders them by preference. This method enumerates the available media types for an output stream. To enumerate the available types, increment <i>dwTypeIndex</i> until the method returns MF_<b>E_NO_MORE_TYPES</b>.
     *       
     * 
     * Setting the media type on one stream can change the available types for another stream (or change the preference order). However, an MFT is not required to update the list of available types dynamically. The only guaranteed way to test whether you can set a particular input type is to call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-setoutputtype">IMFTransform::SetOutputType</a>.
     *       
     * 
     * In some cases, an MFT cannot return a list of output types until one or more input types are set. If so, the method returns <b>MF_E_TRANSFORM_TYPE_NOT_SET</b>.
     *       
     * 
     * An MFT is not required to implement this method. However, most MFTs should implement this method, unless the supported types are simple and can be discovered through the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftgetinfo">MFTGetInfo</a> function.
     *       
     * 
     * This method can return a <i>partial</i> media type. A partial media type contains an incomplete description of a format, and is used to provide a hint to the caller. For example, a partial type might include just the major type and subtype GUIDs. However, after the client sets the input types on the MFT, the MFT should generally return at least one complete output type, which can be used without further modification.
     *       For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/complete-and-partial-media-types">Complete and Partial Media Types</a>.
     * 
     * Some MFTs cannot provide an accurate list of output types until the MFT receives the first input sample. For example, the MFT might need to read the first packet header to deduce the format. An MFT should handle this situation as follows:
     * 
     * <ol>
     * <li>Before the MFT receives any input, it offers a list of one or more output types that it could possibly produce. For example, an MPEG-2 decoder might return a media type that describes the MPEG-2 main profile/main level.
     *           </li>
     * <li>The client selects one of these types (generally the first) and sets it on the output stream.
     *           </li>
     * <li>The client delivers the first input sample by calling <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processinput">IMFTransform::ProcessInput</a>.
     *           </li>
     * <li>If the output type does not conform to the input data, the transform signals a format change in the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">ProcessOutput</a> method. For more information about format changes, see <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">IMFTransform::ProcessOutput</a>.
     *           </li>
     * <li>The calls <b>GetOutputAvailableType</b> again. At this point, the method should return an updated list of types that reflects the input data.
     *           </li>
     * <li>The client selects a new output type from this list and calls <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-setoutputtype">SetOutputType</a>.
     *           </li>
     * </ol>
     * If <b>MFT_UNIQUE_METHOD_NAMES</b> is defined before including mftransform.h, this method is renamed <b>MFTGetOutputAvailableType</b>. See <a href="https://docs.microsoft.com/windows/desktop/medfound/comparison-of-mfts-and-dmos">Creating Hybrid DMO/MFT Objects</a>.
     * 
     * <h3><a id="Implementation_Notes"></a><a id="implementation_notes"></a><a id="IMPLEMENTATION_NOTES"></a>Implementation Notes</h3>
     * If the MFT stores a media type internally, the MFT should return a clone of the media  type, not a pointer to the original type. Otherwise, the caller might modify the type and alter the internal state of the MFT.
     * @param {Integer} dwOutputStreamID Output stream identifier. To get the list of stream identifiers, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getstreamids">IMFTransform::GetStreamIDs</a>.
     * @param {Integer} dwTypeIndex Index of the media type to retrieve. Media types are indexed from zero and returned in approximate order of preference.
     * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getoutputavailabletype
     */
    GetOutputAvailableType(dwOutputStreamID, dwTypeIndex) {
        result := ComCall(14, this, "uint", dwOutputStreamID, "uint", dwTypeIndex, "ptr*", &ppType := 0, "HRESULT")
        return IMFMediaType(ppType)
    }

    /**
     * Sets, tests, or clears the media type for an input stream on this Media Foundation transform (MFT).
     * @remarks
     * This method can be used to set, test without setting, or clear the media type:
     * 
     * <ul>
     * <li>To set the media type, set <i>dwFlags</i> to zero and set <i>pType</i> to a non-<b>NULL</b> pointer that specifies the media type.
     *           </li>
     * <li>To test the media type without setting it, set <i>dwFlags</i> to <b>MFT_SET_TYPE_TEST_ONLY</b> and set <i>pType</i> to a non-<b>NULL</b> pointer that specifies the media type. If the media type is acceptable, the method return <b>S_OK</b>. Otherwise, it returns <b>MF_E_INVALIDMEDIATYPE</b>. Regardless of the return value, the current media type does not change.
     *           </li>
     * <li>To clear the media type, set <i>pType</i> to <b>NULL</b>.
     *           </li>
     * </ul>
     * Setting the media type on one stream may change the acceptable types on another stream.
     *       
     * 
     * An MFT may require the caller to set one or more output types before setting the input type. If so, the method returns <b>MF_E_TRANSFORM_TYPE_NOT_SET</b>.
     *       
     * 
     * If the MFT supports DirectX Video Acceleration (DXVA) but is unable to find a suitable DXVA configuration (for example, if the graphics driver does not have the right capabilities), the method should return <b>MF_E_UNSUPPORTED_D3D_TYPE</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/supporting-dxva-2-0-in-media-foundation">Supporting DXVA 2.0 in Media Foundation</a>.
     *       
     * 
     * If <b>MFT_UNIQUE_METHOD_NAMES</b> is defined before including mftransform.h, this method is renamed <b>MFTSetInputType</b>. See <a href="https://docs.microsoft.com/windows/desktop/medfound/comparison-of-mfts-and-dmos">Creating Hybrid DMO/MFT Objects</a>.
     * @param {Integer} dwInputStreamID Input stream identifier. To get the list of stream identifiers, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getstreamids">IMFTransform::GetStreamIDs</a>.
     * @param {IMFMediaType} pType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface, or <b>NULL</b>.
     * @param {Integer} dwFlags Zero or more flags from the <a href="https://docs.microsoft.com/windows/win32/api/mftransform/ne-mftransform-_mft_set_type_flags">_MFT_SET_TYPE_FLAGS</a> enumeration.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
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
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDMEDIATYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The MFT cannot use the proposed media type.
     *               
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
     * Invalid stream identifier.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The proposed type is not valid. This error code indicates that the media type itself is not configured correctly; for example, it might contain mutually contradictory attributes.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_TRANSFORM_CANNOT_CHANGE_MEDIATYPE_WHILE_PROCESSING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The MFT cannot switch types while processing data. Try draining or flushing the MFT.
     *               
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
     * You must set the output types before setting the input types.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_UNSUPPORTED_D3D_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The MFT could not find a suitable DirectX Video Acceleration (DXVA) configuration.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-setinputtype
     */
    SetInputType(dwInputStreamID, pType, dwFlags) {
        result := ComCall(15, this, "uint", dwInputStreamID, "ptr", pType, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Sets, tests, or clears the media type for an output stream on this Media Foundation transform (MFT).
     * @remarks
     * This method can be used to set, test without setting, or clear the media type:
     * 
     * <ul>
     * <li>To set the media type, set <i>dwFlags</i> to zero and set <i>pType</i> to a non-<b>NULL</b> pointer that specifies the media type.
     *           </li>
     * <li>To test the media type without setting it, set <i>dwFlags</i> to <b>MFT_SET_TYPE_TEST_ONLY</b> and set <i>pType</i> to a non-<b>NULL</b> pointer that specifies the media type. If the media type is acceptable, the method return <b>S_OK</b>. Otherwise, it returns <b>MF_E_INVALIDMEDIATYPE</b>. Regardless of the return value, the current media type does not change.
     *           </li>
     * <li>To clear the media type, set <i>pType</i> to <b>NULL</b>.
     *           </li>
     * </ul>
     * Setting the media type on one stream may change the acceptable types on another stream.
     *       
     * 
     * An MFT may require the caller to set one or more input types before setting the output type. If so, the method returns <b>MF_E_TRANSFORM_TYPE_NOT_SET</b>.
     *       
     * 
     * If the MFT supports DirectX Video Acceleration (DXVA) but is unable to find a suitable DXVA configuration (for example, if the graphics driver does not have the right capabilities), the method should return <b>MF_E_UNSUPPORTED_D3D_TYPE</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/supporting-dxva-2-0-in-media-foundation">Supporting DXVA 2.0 in Media Foundation</a>.
     * 
     * If <b>MFT_UNIQUE_METHOD_NAMES</b> is defined before including mftransform.h, this method is renamed <b>MFTSetOutputType</b>. See <a href="https://docs.microsoft.com/windows/desktop/medfound/comparison-of-mfts-and-dmos">Creating Hybrid DMO/MFT Objects</a>.
     * @param {Integer} dwOutputStreamID Output stream identifier. To get the list of stream identifiers, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getstreamids">IMFTransform::GetStreamIDs</a>.
     * @param {IMFMediaType} pType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface, or <b>NULL</b>.
     * @param {Integer} dwFlags Zero or more flags from the <a href="https://docs.microsoft.com/windows/win32/api/mftransform/ne-mftransform-_mft_set_type_flags">_MFT_SET_TYPE_FLAGS</a> enumeration.
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
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDMEDIATYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The transform cannot use the proposed media type.
     *               
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
     * Invalid stream identifier.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The proposed type is not valid. This error code indicates that the media type itself is not configured correctly; for example, it might contain mutually contradictory flags.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_TRANSFORM_CANNOT_CHANGE_MEDIATYPE_WHILE_PROCESSING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The MFT cannot switch types while processing data. Try draining or flushing the MFT.
     *               
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
     * You must set the input types before setting the output types.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_UNSUPPORTED_D3D_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The MFT could not find a suitable DirectX Video Acceleration (DXVA) configuration.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-setoutputtype
     */
    SetOutputType(dwOutputStreamID, pType, dwFlags) {
        result := ComCall(16, this, "uint", dwOutputStreamID, "ptr", pType, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Gets the current media type for an input stream on this Media Foundation transform (MFT).
     * @remarks
     * If the specified input stream does not yet have a media type, the method returns <b>MF_E_TRANSFORM_TYPE_NOT_SET</b>. Most MFTs do not set any default media types when first created. Instead, the client must set the media type by calling <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-setinputtype">IMFTransform::SetInputType</a>.
     *       
     * 
     * If <b>MFT_UNIQUE_METHOD_NAMES</b> is defined before including mftransform.h, this method is renamed <b>MFTGetInputCurrentType</b>. See <a href="https://docs.microsoft.com/windows/desktop/medfound/comparison-of-mfts-and-dmos">Creating Hybrid DMO/MFT Objects</a>.
     * 
     * <h3><a id="Implementation_Notes"></a><a id="implementation_notes"></a><a id="IMPLEMENTATION_NOTES"></a>Implementation Notes</h3>
     * The MFT should return a clone of the media  type, not a pointer to the original type. Otherwise, the caller might modify the type and alter the internal state of the MFT.
     * @param {Integer} dwInputStreamID Input stream identifier. To get the list of stream identifiers, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getstreamids">IMFTransform::GetStreamIDs</a>.
     * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getinputcurrenttype
     */
    GetInputCurrentType(dwInputStreamID) {
        result := ComCall(17, this, "uint", dwInputStreamID, "ptr*", &ppType := 0, "HRESULT")
        return IMFMediaType(ppType)
    }

    /**
     * Gets the current media type for an output stream on this Media Foundation transform (MFT).
     * @remarks
     * If the specified output stream does not yet have a media type, the method returns <b>MF_E_TRANSFORM_TYPE_NOT_SET</b>. Most MFTs do not set any default media types when first created. Instead, the client must set the media type by calling <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-setoutputtype">IMFTransform::SetOutputType</a>.
     *       
     * 
     * If <b>MFT_UNIQUE_METHOD_NAMES</b> is defined before including mftransform.h, this method is renamed <b>MFTGetOutputCurrentType</b>. See <a href="https://docs.microsoft.com/windows/desktop/medfound/comparison-of-mfts-and-dmos">Creating Hybrid DMO/MFT Objects</a>.
     * 
     * <h3><a id="Implementation_Notes"></a><a id="implementation_notes"></a><a id="IMPLEMENTATION_NOTES"></a>Implementation Notes</h3>
     * The MFT should return a clone of the media  type, not a pointer to the original type. Otherwise, the caller might modify the type and alter the internal state of the MFT.
     * @param {Integer} dwOutputStreamID Output stream identifier. To get the list of stream identifiers, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getstreamids">IMFTransform::GetStreamIDs</a>.
     * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getoutputcurrenttype
     */
    GetOutputCurrentType(dwOutputStreamID) {
        result := ComCall(18, this, "uint", dwOutputStreamID, "ptr*", &ppType := 0, "HRESULT")
        return IMFMediaType(ppType)
    }

    /**
     * Queries whether an input stream on this Media Foundation transform (MFT) can accept more data.
     * @remarks
     * If the method returns the <b>MFT_INPUT_STATUS_ACCEPT_DATA</b> flag, you can deliver an input sample to the specified stream by calling <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processinput">IMFTransform::ProcessInput</a>. If the method succeeds but does not return any flags in the <i>pdwFlags</i> parameter, it means the input stream already has as much data as it can accept.
     *       
     * 
     * Use this method to test whether the input stream is ready to accept more data, without incurring the overhead of allocating a new sample and calling <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processinput">ProcessInput</a>.
     *       
     * 
     * After the client has set valid media types on all of the streams, the MFT should always be in one of two states: Able to accept more input, or able to produce more output (or both).
     *       
     * 
     * If <b>MFT_UNIQUE_METHOD_NAMES</b> is defined before including mftransform.h, this method is renamed <b>MFTGetInputStatus</b>. See <a href="https://docs.microsoft.com/windows/desktop/medfound/comparison-of-mfts-and-dmos">Creating Hybrid DMO/MFT Objects</a>.
     * @param {Integer} dwInputStreamID Input stream identifier. To get the list of stream identifiers, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getstreamids">IMFTransform::GetStreamIDs</a>.
     * @returns {Integer} Receives a member of the <a href="https://docs.microsoft.com/windows/win32/api/mftransform/ne-mftransform-_mft_input_status_flags">_MFT_INPUT_STATUS_FLAGS</a> enumeration, or zero. If the value is <b>MFT_INPUT_STATUS_ACCEPT_DATA</b>, the stream specified in <i>dwInputStreamID</i> can accept more input data.
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getinputstatus
     */
    GetInputStatus(dwInputStreamID) {
        result := ComCall(19, this, "uint", dwInputStreamID, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * Queries whether the Media Foundation transform (MFT) is ready to produce output data.
     * @remarks
     * If the method returns the <b>MFT_OUTPUT_STATUS_SAMPLE_READY</b> flag, it means you can generate one or more output samples by calling <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">IMFTransform::ProcessOutput</a>.
     *       
     * 
     * MFTs are not required to implement this method. If the method returns <b>E_NOTIMPL</b>, you must call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">ProcessOutput</a> to determine whether the transform has output data.
     *       
     * 
     * If the MFT has more than one output stream, but it does not produce samples at the same time for each stream, it can set the <b>MFT_OUTPUT_STATUS_SAMPLE_READY</b> flag when just one stream is ready. However, if the MFT normally produces samples at the same time for each output stream, it should not set this flag until all streams are ready.
     *       
     * 
     * After the client has set valid media types on all of the streams, the MFT should always be in one of two states: Able to accept more input, or able to produce more output.
     *       
     * 
     * If <b>MFT_UNIQUE_METHOD_NAMES</b> is defined before including mftransform.h, this method is renamed <b>MFTGetOutputStatus</b>. See <a href="https://docs.microsoft.com/windows/desktop/medfound/comparison-of-mfts-and-dmos">Creating Hybrid DMO/MFT Objects</a>.
     * @returns {Integer} Receives a member of the <a href="https://docs.microsoft.com/windows/win32/api/mftransform/ne-mftransform-_mft_output_status_flags">_MFT_OUTPUT_STATUS_FLAGS</a> enumeration, or zero. If the value is <b>MFT_OUTPUT_STATUS_SAMPLE_READY</b>, the MFT can produce an output sample.
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-getoutputstatus
     */
    GetOutputStatus() {
        result := ComCall(20, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * Sets the range of time stamps the client needs for output.
     * @remarks
     * This method can be used to optimize preroll, especially in formats that have gaps between time stamps, or formats where the data must start on a sync point, such as MPEG-2. Calling this method is optional, and implementation of this method by an MFT is optional. If the MFT does not implement the method, the return value is <b>E_NOTIMPL</b>.
     * 
     * If an MFT implements this method, it must limit its output data to the range of times specified by <i>hnsLowerBound</i> and <i>hnsUpperBound</i>. The MFT discards any input data that is not needed to produce output within this range. If the sample boundaries do not exactly match the range, the MFT should split the output samples, if possible. Otherwise, the output samples can overlap the range.
     *       
     * 
     * For example, suppose the output range is 100 to 150 milliseconds (ms), and the output format is video with each frame lasting 33 ms. A sample with a time stamp of 67 ms overlaps the range (67 + 33 = 100) and is produced as output. A sample with a time stamp of  66 ms is discarded (66 + 33 = 99). Similarly, a sample with a time stamp of 150 ms is produced as output, but a sample with a time stamp of 151 is discarded.
     * 
     * If <b>MFT_UNIQUE_METHOD_NAMES</b> is defined before including mftransform.h, this method is renamed <b>MFTSetOutputBounds</b>. See <a href="https://docs.microsoft.com/windows/desktop/medfound/comparison-of-mfts-and-dmos">Creating Hybrid DMO/MFT Objects</a>.
     * @param {Integer} hnsLowerBound Specifies the earliest time stamp. The Media Foundation transform (MFT) will accept input until it can produce an output sample that begins at this time; or until it can produce a sample that ends at this time or later. If there is no lower bound, use the value <b>MFT_OUTPUT_BOUND_LOWER_UNBOUNDED</b>.
     * @param {Integer} hnsUpperBound Specifies the latest time stamp. The MFT will not produce an output sample with time stamps later than this time. If there is no upper bound, use the value <b>MFT_OUTPUT_BOUND_UPPER_UNBOUNDED</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
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
     * Not implemented.
     *               
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
     * The media type is not set on one or more streams.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-setoutputbounds
     */
    SetOutputBounds(hnsLowerBound, hnsUpperBound) {
        result := ComCall(21, this, "int64", hnsLowerBound, "int64", hnsUpperBound, "HRESULT")
        return result
    }

    /**
     * Sends an event to an input stream on this Media Foundation transform (MFT).
     * @remarks
     * An MFT can handle sending the event downstream, or it can let the pipeline do this, as indicated by the return value:
     *       
     * 
     * <ul>
     * <li><b>E_NOTIMPL</b>: The MFT ignores all events, and the pipeline should send all events downstream. After the pipeline receives this return value, it might not call <b>ProcessEvent</b> again.
     *           </li>
     * <li><b>S_OK</b>: The MFT has examined this event, but the pipeline should send the event downstream. Internally, the MFT might respond to the event in some way, or it might ignore the event.
     *           </li>
     * <li><b>MF_S_TRANSFORM_DO_NOT_PROPAGATE_EVENT</b>: The pipeline should not propagate this event downstream. Either the MFT will send the event downstream, or else the MFT will consume the event and not send it downstream. The MFT should only consume the event if the event should stop at this MFT and not travel any further downstream. But in most cases, the event should travel downstream.
     *           </li>
     * </ul>
     * To send the event downstream, the MFT adds the event to the collection object that is provided by the client in the <b>pEvents</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/ns-mftransform-mft_output_data_buffer">MFT_OUTPUT_DATA_BUFFER</a> structure, when the client calls <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">IMFTransform::ProcessOutput</a>.
     *       
     * 
     * Events must be serialized with the samples that come before and after them. Attach the event to the output sample that follows the event. (The pipeline will process the event first, and then the sample.) If an MFT holds back one or more samples between calls to <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processinput">IMFTransform::ProcessInput</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">ProcessOutput</a>, the MFT should handle sending all events downstream, because in this situation the pipeline cannot correlate input samples with output samples.
     *       
     * 
     * If an MFT does not hold back samples and does not need to examine any events, it can return <b>E_NOTIMPL</b>.
     *       
     * 
     * If <b>MFT_UNIQUE_METHOD_NAMES</b> is defined before including mftransform.h, this method is renamed <b>MFTProcessEvent</b>. See <a href="https://docs.microsoft.com/windows/desktop/medfound/comparison-of-mfts-and-dmos">Creating Hybrid DMO/MFT Objects</a>.
     * @param {Integer} dwInputStreamID Input stream identifier. To get the list of stream identifiers, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getstreamids">IMFTransform::GetStreamIDs</a>.
     * @param {IMFMediaEvent} pEvent Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaevent">IMFMediaEvent</a> interface of an event object.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
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
     * Not implemented.
     *               
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
     * Invalid stream number.
     *               
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
     * The media type is not set on one or more streams.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_S_TRANSFORM_DO_NOT_PROPAGATE_EVENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pipeline should not propagate the event.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-processevent
     */
    ProcessEvent(dwInputStreamID, pEvent) {
        result := ComCall(22, this, "uint", dwInputStreamID, "ptr", pEvent, "HRESULT")
        return result
    }

    /**
     * Sends a message to the Media Foundation transform (MFT).
     * @remarks
     * Each message type has a different requirement for calling order, see the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/ne-mftransform-mft_message_type">MFT_MESSAGE_TYPE</a> enumeration for more details.
     *       
     * 
     * The MFT might ignore certain message types. If so, the method returns <b>S_OK</b>. An error code indicates that the transform handles this message type but was unable to process the message in this instance.
     *       
     * 
     * If <b>MFT_UNIQUE_METHOD_NAMES</b> is defined before including mftransform.h, this method is renamed <b>MFTProcessMessage</b>. See <a href="https://docs.microsoft.com/windows/desktop/medfound/comparison-of-mfts-and-dmos">Creating Hybrid DMO/MFT Objects</a>.
     * @param {Integer} eMessage The message to send, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/ne-mftransform-mft_message_type">MFT_MESSAGE_TYPE</a> enumeration.
     * @param {Pointer} ulParam Message parameter. The meaning of this parameter depends on the message type.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
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
     * Invalid stream number. Applies to the <b>MFT_MESSAGE_NOTIFY_END_OF_STREAM</b> message.
     *               
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
     * The media type is not set on one or more streams.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-processmessage
     */
    ProcessMessage(eMessage, ulParam) {
        result := ComCall(23, this, "int", eMessage, "ptr", ulParam, "HRESULT")
        return result
    }

    /**
     * Delivers data to an input stream on this Media Foundation transform (MFT).
     * @remarks
     * In most cases, if the method succeeds, the MFT stores the sample and holds a reference count on the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> pointer. Do not re-use the sample until the MFT releases the sample. Instead of storing the sample, however, an MFT might copy the sample data into a new buffer. In that case, the MFT should set the <b>MFT_INPUT_STREAM_DOES_NOT_ADDREF</b> flag in the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getinputstreaminfo">IMFTransform::GetInputStreamInfo</a> method.
     *       
     * 
     * If the MFT already has enough input data to produce an output sample, it does not accept new input data, and <b>ProcessInput</b> returns <b>MF_E_NOTACCEPTING</b>. At that point, the client should clear the pending input data by doing one of the following:
     *         
     * 
     * <ul>
     * <li>Generate new output by calling <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">IMFTransform::ProcessOutput</a>.
     *           </li>
     * <li>Flush the input data by calling <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processmessage">IMFTransform::ProcessMessage</a> with the MFT_<b>MESSAGE_COMMAND_FLUSH</b> message.
     *           </li>
     * </ul>
     * An exception to this rule is the <b>MFT_OUTPUT_STREAM_LAZY_READ</b> flag. When this flag is present, the transform will discard stored samples if you give it more input. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getoutputstreaminfo">IMFTransform::GetOutputStreamInfo</a>. A transform should never queue any more input data than is required to produce the correct output.
     *       
     * 
     * An MFT can process the input data in the <b>ProcessInput</b> method. However, most MFTs wait until the client calls <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">ProcessOutput</a>.
     *       
     * 
     * After the client has set valid media types on all of the streams, the MFT should always be in one of two states: Able to accept more input, or able to produce more output. It should never be in both states or neither state. An MFT should only accept as much input as it needs to generate at least one output sample, at which point <b>ProcessInput</b> returns <b>MF_E_NOTACCEPTING</b>. When <b>ProcessInput</b> returns <b>MF_E_NOTACCEPTING</b>, the client can assume that the MFT is ready to produce output.
     *       
     * 
     * If an MFT encounters a non-fatal error in the input data, it can simply drop the data and attempt to recover when it gets the more input data. To request more input data, the MFT returns <b>MF_E_TRANSFORM_NEED_MORE_INPUT</b> from the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">IMFTransform::ProcessOutput</a> method. If the MFT drops any data, it should set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mfsampleextension-discontinuity-attribute">MFSampleExtension_Discontinuity</a> attribute attribute on the next output sample, to notify the caller that there is a gap in the data stream.
     *       
     * 
     * If <b>MFT_UNIQUE_METHOD_NAMES</b> is defined before including mftransform.h, this method is renamed <b>MFTProcessInput</b>. See <a href="https://docs.microsoft.com/windows/desktop/medfound/comparison-of-mfts-and-dmos">Creating Hybrid DMO/MFT Objects</a>.
     * 
     * <h3><a id="Asynchronous_Processing"></a><a id="asynchronous_processing"></a><a id="ASYNCHRONOUS_PROCESSING"></a>Asynchronous Processing</h3>
     * The previous remarks describe the <i>synchronous</i> processing model. To support asynchronous processing, see <a href="https://docs.microsoft.com/windows/desktop/medfound/asynchronous-mfts">Asynchronous MFTs</a>.
     * @param {Integer} dwInputStreamID Input stream identifier. To get the list of stream identifiers, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getstreamids">IMFTransform::GetStreamIDs</a>.
     * @param {IMFSample} pSample Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> interface of the input sample. The sample must contain at least one media buffer that contains valid input data.
     * @param {Integer} dwFlags Reserved. Must be zero.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
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
     * Invalid argument.
     *               
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
     * Invalid stream identifier.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_NO_SAMPLE_DURATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input sample requires a valid sample duration. To set the duration, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfsample-setsampleduration">IMFSample::SetSampleDuration</a>. 
     * 
     * Some MFTs require that input samples have valid durations. Some MFTs do not require sample durations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_NO_SAMPLE_TIMESTAMP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input sample requires a time stamp. To set the time stamp, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfsample-setsampletime">IMFSample::SetSampleTime</a>. 
     * 
     * Some MFTs require that input samples have valid time stamps. Some MFTs do not require time stamps.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_NOTACCEPTING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The transform cannot process more input at this time.
     *               
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
     * The media type is not set on one or more streams.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_UNSUPPORTED_D3D_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media type is not supported for DirectX Video Acceleration (DXVA). A DXVA-enabled decoder might return this error code.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  If you are converting a DirectX Media Object (DMO) to an MFT, be aware that <b>S_FALSE</b> is not a valid return code for <b>IMFTransform::ProcessInput</b>, unlike the <b>IMediaObject::ProcessInput</b> method.</div>
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-processinput
     */
    ProcessInput(dwInputStreamID, pSample, dwFlags) {
        result := ComCall(24, this, "uint", dwInputStreamID, "ptr", pSample, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Generates output from the current input data.
     * @remarks
     * The size of the <i>pOutputSamples</i> array must be equal to or greater than the number of <i>selected</i> output streams. The number of selected output streams equals the total number of output streams minus the number of <i>deselected</i> streams. A stream is deselected if it has the <b>MFT_OUTPUT_STREAM_OPTIONAL</b> flag and the caller does not set a media type (or sets the media type to <b>NULL</b>). For more information, see <a href="https://docs.microsoft.com/windows/win32/api/mftransform/ne-mftransform-_mft_output_stream_info_flags">_MFT_OUTPUT_STREAM_INFO_FLAGS</a> enumeration.
     *       
     * 
     * This method generates output samples and can also generate events. If the method succeeds, at least one of the following conditions is true:
     * 
     * <ul>
     * <li>One or more samples in the <i>pOutputSamples</i> array contains output data.
     *           </li>
     * <li>One or more members of the <i>pOutputSamples</i> array contains a non-empty collection of events.
     *           </li>
     * </ul>
     * If <b>MFT_UNIQUE_METHOD_NAMES</b> is defined before including Mftransform.h, this method is renamed <b>MFTProcessOutput</b>. See <a href="https://docs.microsoft.com/windows/desktop/medfound/comparison-of-mfts-and-dmos">Creating Hybrid DMO/MFT Objects</a>.
     * 
     * <h3><a id="Output_Buffers"></a><a id="output_buffers"></a><a id="OUTPUT_BUFFERS"></a>Output Buffers</h3>
     * The MFT returns output data for a stream through the <b>pSample</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/ns-mftransform-mft_output_data_buffer">MFT_OUTPUT_DATA_BUFFER</a> structure. This structure member is a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> interface of a media sample. (See <a href="https://docs.microsoft.com/windows/desktop/medfound/media-samples">Media Samples</a>.) The media sample is allocated either by the caller or by the MFT, depending on the MFT's allocation model. To find the allocation model, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getoutputstreaminfo">IMFTransform::GetOutputStreamInfo</a> and examine the <b>dwFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/ns-mftransform-mft_output_stream_info">MFT_OUTPUT_STREAM_INFO</a> structure:
     * 
     * <ul>
     * <li>If the <b>MFT_OUTPUT_STREAM_PROVIDES_SAMPLES</b> flag is present, the MFT allocates the media sample.
     *             </li>
     * <li>If the <b>MFT_OUTPUT_STREAM_CAN_PROVIDE_SAMPLES</b> flag is present, the caller can optionally provide a media sample. If <b>pSample</b> is <b>NULL</b>, the MFT will allocate the media sample.
     *             </li>
     * <li>If neither of these two flags is present, the caller must allocate the media sample.
     *             </li>
     * </ul>
     * These flags remain constant unless the media type for the output stream changes.
     * 
     * If the caller allocates the media sample, the media sample must contain a buffer that is large enough to hold the output data. To find the buffer requirements, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getoutputstreaminfo">GetOutputStreamInfo</a>. The MFT writes the output data to the start of the buffer, overwriting any data that already exists in the buffer.
     * 
     * If the MFT allocates the sample, the MFT also allocates the buffers for the sample.
     * 
     * If the MFT has multiple output streams, the streams might produce output at different rates, so some streams might have output while other streams do not. If a stream did not any produce output, the MFT sets the <b>MFT_OUTPUT_DATA_BUFFER_NO_SAMPLE</b> flag in the <b>dwStatus</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/ns-mftransform-mft_output_data_buffer">MFT_OUTPUT_DATA_BUFFER</a> structure for that stream. In that case, if the caller allocated <b>pSample</b>, the buffers in the sample do not contain any valid data. If the caller did not allocate <b>pSample</b>, the <b>MFT_OUTPUT_DATA_BUFFER_NO_SAMPLE</b> flag indicates that <b>pSample</b> still equals <b>NULL</b> after the method returns.
     * 
     * If no output streams have data, and the MFT has no events to return, then <b>ProcessOutput</b> returns <b>MF_E_TRANSFORM_NEED_MORE_INPUT</b>.
     * 
     * The MFT cannot return more than one sample per stream in a single call to <b>ProcessOutput</b>. If there is more output data available for a stream after <b>ProcessOutput</b> returns, the MFT sets the <b>MFT_OUTPUT_DATA_BUFFER_INCOMPLETE</b> flag in the <b>dwStatus</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/ns-mftransform-mft_output_data_buffer">MFT_OUTPUT_DATA_BUFFER</a> structure for that stream.
     * 
     * If the MFT has enough data to produce output, it should refuse to accept any more input until <b>ProcessOutput</b> has been called enough times to pull all of the available output. (An exception is when the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getoutputstreaminfo">IMFTransform::GetOutputStreamInfo</a> method returns the <b>MFT_OUTPUT_STREAM_LAZY_READ</b> flag.) Generally, an MFT with multiple output streams should produce output for a stream as soon as possible, and not wait for all of the streams to have output.
     * 
     * <h3><a id="In-Band_Events"></a><a id="in-band_events"></a><a id="IN-BAND_EVENTS"></a>In-Band Events</h3>
     * The MFT can return a collection of event objects in the <b>pEvents</b> member of each <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/ns-mftransform-mft_output_data_buffer">MFT_OUTPUT_DATA_BUFFER</a> structure. The MFT allocates both the collection object and the events.
     * 
     * To send an event to the caller, the MFT performs the following steps inside <b>ProcessOutput</b>:
     * 
     * <ol>
     * <li>Create a new collection object by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatecollection">MFCreateCollection</a>.
     *             </li>
     * <li>Add one or more events to the collection by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfcollection-addelement">IMFCollection::AddElement</a>.
     *             </li>
     * <li>Set the <b>pEvents</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/ns-mftransform-mft_output_data_buffer">MFT_OUTPUT_DATA_BUFFER</a> structure equal to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfcollection">IMFCollection</a> pointer. The MFT leaves a reference count on this interface; the caller must release the pointer.
     *             </li>
     * </ol>
     * Events do not have time stamps. The caller should process the events before processing the output samples. In other words, events occur at the point in the stream immediately after the previous call to <b>ProcessOutput</b>, and prior to any output samples returned from the current <b>ProcessOutput</b> call.
     * 
     * It is valid for the <b>ProcessOutput</b> method to return one or more events and zero output samples.
     * 
     * The caller is responsible for releasing any events that the MFT allocates. When the method returns, check the <b>pEvents</b> member of each <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/ns-mftransform-mft_output_data_buffer">MFT_OUTPUT_DATA_BUFFER</a> structure. If the value is not <b>NULL</b>, the caller must release the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfcollection">IMFCollection</a> interface pointer:
     * 
     * 
     * ```cpp
     * // Release the events that an MFT might allocate in IMFTransform::ProcessOutput().
     * void ReleaseEventCollection(DWORD cOutputBuffers, MFT_OUTPUT_DATA_BUFFER* pBuffers)
     * {
     *     for (DWORD i = 0; i < cOutputBuffers; i++)
     *     {
     *         if (pBuffers[i].pEvents)
     *         {
     *             pBuffers[i].pEvents->Release();
     *             pBuffers[i].pEvents = NULL;
     *         }
     *     }
     * }
     * 
     * ```
     * 
     * 
     * An MFT should not use the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaeventgenerator">IMFMediaEventGenerator</a> interface to send in-band events.
     * 
     * <h3><a id="Stream_Changes"></a><a id="stream_changes"></a><a id="STREAM_CHANGES"></a>Stream Changes</h3>
     * The <b>ProcessOutput</b> method can cause any of the following changes in an output stream:
     * 
     * <ul>
     * <li>The deletion of an output stream. To signal a stream deletion, the MFT sets the <b>MFT_OUTPUT_DATA_BUFFER_STREAM_END</b> flag in the <b>dwStatus</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/ns-mftransform-mft_output_data_buffer">MFT_OUTPUT_DATA_BUFFER</a> structure for that stream.
     *             </li>
     * <li>The creation of a new output stream. To signal a new output stream, the MFT sets the <b>MFT_PROCESS_OUTPUT_STATUS_NEW_STREAMS</b> flag in the <i>pdwStatus</i> parameter. A new stream can have the same stream identifier as a deleted stream.
     *             </li>
     * <li>A format change on an output stream. To signal a format change, the MFT sets the <b>MFT_OUTPUT_DATA_BUFFER_FORMAT_CHANGE</b> flag in the <b>dwStatus</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/ns-mftransform-mft_output_data_buffer">MFT_OUTPUT_DATA_BUFFER</a> structure for that stream.
     *             </li>
     * </ul>
     * It is possible that all three of these actions will result from a single call to <b>ProcessOutput</b>. The caller must respond to them in the order listed here—first deletions, then additions, then format changes.
     * 
     * The <b>MFT_OUTPUT_DATA_BUFFER_FORMAT_CHANGE</b> flag signals a format change on an output stream. This might mean the current media type has become invalid, or the preference order has changed and a more efficient format is available. In the latter case, it is possible that the client will re-set the original media type. To guard against endless loops, the MFT should not set the <b>MFT_OUTPUT_DATA_BUFFER_FORMAT_CHANGE</b> flag again until there is another change. Also, avoid setting this flag if the preference order changes but the current media type is still the most preferred type.
     * 
     * <h3><a id="Sample_Attributes"></a><a id="sample_attributes"></a><a id="SAMPLE_ATTRIBUTES"></a>Sample Attributes</h3>
     * An input sample might have attributes, which are accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. Unless a specific attribute no longer applies, all attributes should be copied into the corresponding output sample. The responsibility for copying attributes is determined as follows:
     * 
     * <ul>
     * <li>If the value of the <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-exattribute-supported-property">MFPKEY_EXATTRIBUTE_SUPPORTED</a> property on the MFT is <b>VARIANT_TRUE</b>, the MFT copies the attributes.
     *             </li>
     * <li>If the value of <a href="https://docs.microsoft.com/windows/desktop/medfound/mfpkey-exattribute-supported-property">MFPKEY_EXATTRIBUTE_SUPPORTED</a> is <b>VARIANT_FALSE</b>, or the property is not set, the client must copy the sample attributes. Do not overwrite any attributes that the MFT sets on the output sample.
     *             </li>
     * </ul>
     * For a list of sample attributes, see <a href="https://docs.microsoft.com/windows/desktop/medfound/sample-attributes">Sample Attributes</a>.
     * 
     * <h3><a id="Asynchronous_Processing"></a><a id="asynchronous_processing"></a><a id="ASYNCHRONOUS_PROCESSING"></a>Asynchronous Processing</h3>
     * The previous remarks describe the <i>synchronous</i> processing model. To support asynchronous processing, see <a href="https://docs.microsoft.com/windows/desktop/medfound/asynchronous-mfts">Asynchronous MFTs</a>.
     * @param {Integer} dwFlags Bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/win32/api/mftransform/ne-mftransform-_mft_process_output_flags">_MFT_PROCESS_OUTPUT_FLAGS</a> enumeration.
     * @param {Integer} cOutputBufferCount Number of elements in the <i>pOutputSamples</i> array. The value must be at least 1.
     * @param {Pointer<MFT_OUTPUT_DATA_BUFFER>} pOutputSamples Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/ns-mftransform-mft_output_data_buffer">MFT_OUTPUT_DATA_BUFFER</a> structures, allocated by the caller. The MFT uses this array to return output data to the caller.
     * @returns {Integer} Receives a bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/win32/api/mftransform/ne-mftransform-_mft_process_output_status">_MFT_PROCESS_OUTPUT_STATUS</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/mftransform/nf-mftransform-imftransform-processoutput
     */
    ProcessOutput(dwFlags, cOutputBufferCount, pOutputSamples) {
        result := ComCall(25, this, "uint", dwFlags, "uint", cOutputBufferCount, "ptr", pOutputSamples, "uint*", &pdwStatus := 0, "HRESULT")
        return pdwStatus
    }
}

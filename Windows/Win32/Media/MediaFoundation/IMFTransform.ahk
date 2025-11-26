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
 * @see https://docs.microsoft.com/windows/win32/api//mftransform/nn-mftransform-imftransform
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
     * @param {Pointer<Integer>} pdwInputMinimum Receives the minimum number of input streams.
     * @param {Pointer<Integer>} pdwInputMaximum Receives the maximum number of input streams. If there is no maximum, receives the value <b>MFT_STREAMS_UNLIMITED</b>.
     * @param {Pointer<Integer>} pdwOutputMinimum Receives the minimum number of output streams.
     * @param {Pointer<Integer>} pdwOutputMaximum Receives the maximum number of output streams. If there is no maximum, receives the value <b>MFT_STREAMS_UNLIMITED</b>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imftransform-getstreamlimits
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
     * @param {Pointer<Integer>} pcInputStreams Receives the number of input streams.
     * @param {Pointer<Integer>} pcOutputStreams Receives the number of output streams.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imftransform-getstreamcount
     */
    GetStreamCount(pcInputStreams, pcOutputStreams) {
        pcInputStreamsMarshal := pcInputStreams is VarRef ? "uint*" : "ptr"
        pcOutputStreamsMarshal := pcOutputStreams is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pcInputStreamsMarshal, pcInputStreams, pcOutputStreamsMarshal, pcOutputStreams, "HRESULT")
        return result
    }

    /**
     * Gets the stream identifiers for the input and output streams on this Media Foundation transform (MFT).
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
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imftransform-getstreamids
     */
    GetStreamIDs(dwInputIDArraySize, pdwInputIDs, dwOutputIDArraySize, pdwOutputIDs) {
        pdwInputIDsMarshal := pdwInputIDs is VarRef ? "uint*" : "ptr"
        pdwOutputIDsMarshal := pdwOutputIDs is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", dwInputIDArraySize, pdwInputIDsMarshal, pdwInputIDs, "uint", dwOutputIDArraySize, pdwOutputIDsMarshal, pdwOutputIDs, "HRESULT")
        return result
    }

    /**
     * Gets the buffer requirements and other information for an input stream on this Media Foundation transform (MFT).
     * @param {Integer} dwInputStreamID Input stream identifier. To get the list of stream identifiers, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getstreamids">IMFTransform::GetStreamIDs</a>.
     * @returns {MFT_INPUT_STREAM_INFO} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/ns-mftransform-mft_input_stream_info">MFT_INPUT_STREAM_INFO</a> structure. The method fills the structure with information about the input stream.
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imftransform-getinputstreaminfo
     */
    GetInputStreamInfo(dwInputStreamID) {
        pStreamInfo := MFT_INPUT_STREAM_INFO()
        result := ComCall(6, this, "uint", dwInputStreamID, "ptr", pStreamInfo, "HRESULT")
        return pStreamInfo
    }

    /**
     * Gets the buffer requirements and other information for an output stream on this Media Foundation transform (MFT).
     * @param {Integer} dwOutputStreamID Output stream identifier. To get the list of stream identifiers, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getstreamids">IMFTransform::GetStreamIDs</a>.
     * @returns {MFT_OUTPUT_STREAM_INFO} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/ns-mftransform-mft_output_stream_info">MFT_OUTPUT_STREAM_INFO</a> structure. The method fills the structure with information about the output stream.
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imftransform-getoutputstreaminfo
     */
    GetOutputStreamInfo(dwOutputStreamID) {
        pStreamInfo := MFT_OUTPUT_STREAM_INFO()
        result := ComCall(7, this, "uint", dwOutputStreamID, "ptr", pStreamInfo, "HRESULT")
        return pStreamInfo
    }

    /**
     * Gets the global attribute store for this Media Foundation transform (MFT).
     * @returns {IMFAttributes} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imftransform-getattributes
     */
    GetAttributes() {
        result := ComCall(8, this, "ptr*", &pAttributes := 0, "HRESULT")
        return IMFAttributes(pAttributes)
    }

    /**
     * Gets the attribute store for an input stream on this Media Foundation transform (MFT).
     * @param {Integer} dwInputStreamID Input stream identifier. To get the list of stream identifiers, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getstreamids">IMFTransform::GetStreamIDs</a>.
     * @returns {IMFAttributes} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imftransform-getinputstreamattributes
     */
    GetInputStreamAttributes(dwInputStreamID) {
        result := ComCall(9, this, "uint", dwInputStreamID, "ptr*", &pAttributes := 0, "HRESULT")
        return IMFAttributes(pAttributes)
    }

    /**
     * Gets the attribute store for an output stream on this Media Foundation transform (MFT).
     * @param {Integer} dwOutputStreamID Output stream identifier. To get the list of stream identifiers, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getstreamids">IMFTransform::GetStreamIDs</a>.
     * @returns {IMFAttributes} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imftransform-getoutputstreamattributes
     */
    GetOutputStreamAttributes(dwOutputStreamID) {
        result := ComCall(10, this, "uint", dwOutputStreamID, "ptr*", &pAttributes := 0, "HRESULT")
        return IMFAttributes(pAttributes)
    }

    /**
     * Removes an input stream from this Media Foundation transform (MFT).
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
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imftransform-deleteinputstream
     */
    DeleteInputStream(dwStreamID) {
        result := ComCall(11, this, "uint", dwStreamID, "HRESULT")
        return result
    }

    /**
     * Adds one or more new input streams to this Media Foundation transform (MFT).
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
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imftransform-addinputstreams
     */
    AddInputStreams(cStreams, adwStreamIDs) {
        adwStreamIDsMarshal := adwStreamIDs is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "uint", cStreams, adwStreamIDsMarshal, adwStreamIDs, "HRESULT")
        return result
    }

    /**
     * Gets an available media type for an input stream on this Media Foundation transform (MFT).
     * @param {Integer} dwInputStreamID Input stream identifier. To get the list of stream identifiers, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getstreamids">IMFTransform::GetStreamIDs</a>.
     * @param {Integer} dwTypeIndex Index of the media type to retrieve. Media types are indexed from zero and returned in approximate order of preference.
     * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imftransform-getinputavailabletype
     */
    GetInputAvailableType(dwInputStreamID, dwTypeIndex) {
        result := ComCall(13, this, "uint", dwInputStreamID, "uint", dwTypeIndex, "ptr*", &ppType := 0, "HRESULT")
        return IMFMediaType(ppType)
    }

    /**
     * Gets an available media type for an output stream on this Media Foundation transform (MFT).
     * @param {Integer} dwOutputStreamID Output stream identifier. To get the list of stream identifiers, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getstreamids">IMFTransform::GetStreamIDs</a>.
     * @param {Integer} dwTypeIndex Index of the media type to retrieve. Media types are indexed from zero and returned in approximate order of preference.
     * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imftransform-getoutputavailabletype
     */
    GetOutputAvailableType(dwOutputStreamID, dwTypeIndex) {
        result := ComCall(14, this, "uint", dwOutputStreamID, "uint", dwTypeIndex, "ptr*", &ppType := 0, "HRESULT")
        return IMFMediaType(ppType)
    }

    /**
     * Sets, tests, or clears the media type for an input stream on this Media Foundation transform (MFT).
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
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imftransform-setinputtype
     */
    SetInputType(dwInputStreamID, pType, dwFlags) {
        result := ComCall(15, this, "uint", dwInputStreamID, "ptr", pType, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Sets, tests, or clears the media type for an output stream on this Media Foundation transform (MFT).
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
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imftransform-setoutputtype
     */
    SetOutputType(dwOutputStreamID, pType, dwFlags) {
        result := ComCall(16, this, "uint", dwOutputStreamID, "ptr", pType, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Gets the current media type for an input stream on this Media Foundation transform (MFT).
     * @param {Integer} dwInputStreamID Input stream identifier. To get the list of stream identifiers, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getstreamids">IMFTransform::GetStreamIDs</a>.
     * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imftransform-getinputcurrenttype
     */
    GetInputCurrentType(dwInputStreamID) {
        result := ComCall(17, this, "uint", dwInputStreamID, "ptr*", &ppType := 0, "HRESULT")
        return IMFMediaType(ppType)
    }

    /**
     * Gets the current media type for an output stream on this Media Foundation transform (MFT).
     * @param {Integer} dwOutputStreamID Output stream identifier. To get the list of stream identifiers, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getstreamids">IMFTransform::GetStreamIDs</a>.
     * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imftransform-getoutputcurrenttype
     */
    GetOutputCurrentType(dwOutputStreamID) {
        result := ComCall(18, this, "uint", dwOutputStreamID, "ptr*", &ppType := 0, "HRESULT")
        return IMFMediaType(ppType)
    }

    /**
     * Queries whether an input stream on this Media Foundation transform (MFT) can accept more data.
     * @param {Integer} dwInputStreamID Input stream identifier. To get the list of stream identifiers, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getstreamids">IMFTransform::GetStreamIDs</a>.
     * @returns {Integer} Receives a member of the <a href="https://docs.microsoft.com/windows/win32/api/mftransform/ne-mftransform-_mft_input_status_flags">_MFT_INPUT_STATUS_FLAGS</a> enumeration, or zero. If the value is <b>MFT_INPUT_STATUS_ACCEPT_DATA</b>, the stream specified in <i>dwInputStreamID</i> can accept more input data.
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imftransform-getinputstatus
     */
    GetInputStatus(dwInputStreamID) {
        result := ComCall(19, this, "uint", dwInputStreamID, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * Queries whether the Media Foundation transform (MFT) is ready to produce output data.
     * @returns {Integer} Receives a member of the <a href="https://docs.microsoft.com/windows/win32/api/mftransform/ne-mftransform-_mft_output_status_flags">_MFT_OUTPUT_STATUS_FLAGS</a> enumeration, or zero. If the value is <b>MFT_OUTPUT_STATUS_SAMPLE_READY</b>, the MFT can produce an output sample.
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imftransform-getoutputstatus
     */
    GetOutputStatus() {
        result := ComCall(20, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * Sets the range of time stamps the client needs for output.
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
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imftransform-setoutputbounds
     */
    SetOutputBounds(hnsLowerBound, hnsUpperBound) {
        result := ComCall(21, this, "int64", hnsLowerBound, "int64", hnsUpperBound, "HRESULT")
        return result
    }

    /**
     * Sends an event to an input stream on this Media Foundation transform (MFT).
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
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imftransform-processevent
     */
    ProcessEvent(dwInputStreamID, pEvent) {
        result := ComCall(22, this, "uint", dwInputStreamID, "ptr", pEvent, "HRESULT")
        return result
    }

    /**
     * Sends a message to the Media Foundation transform (MFT).
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
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imftransform-processmessage
     */
    ProcessMessage(eMessage, ulParam) {
        result := ComCall(23, this, "int", eMessage, "ptr", ulParam, "HRESULT")
        return result
    }

    /**
     * Delivers data to an input stream on this Media Foundation transform (MFT).
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
     * The input sample requires a valid sample duration. To set the duration, call <a href="/windows/desktop/api/mfobjects/nf-mfobjects-imfsample-setsampleduration">IMFSample::SetSampleDuration</a>. 
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
     * The input sample requires a time stamp. To set the time stamp, call <a href="/windows/desktop/api/mfobjects/nf-mfobjects-imfsample-setsampletime">IMFSample::SetSampleTime</a>. 
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
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imftransform-processinput
     */
    ProcessInput(dwInputStreamID, pSample, dwFlags) {
        result := ComCall(24, this, "uint", dwInputStreamID, "ptr", pSample, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Generates output from the current input data.
     * @param {Integer} dwFlags Bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/win32/api/mftransform/ne-mftransform-_mft_process_output_flags">_MFT_PROCESS_OUTPUT_FLAGS</a> enumeration.
     * @param {Integer} cOutputBufferCount Number of elements in the <i>pOutputSamples</i> array. The value must be at least 1.
     * @param {Pointer<MFT_OUTPUT_DATA_BUFFER>} pOutputSamples Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/ns-mftransform-mft_output_data_buffer">MFT_OUTPUT_DATA_BUFFER</a> structures, allocated by the caller. The MFT uses this array to return output data to the caller.
     * @returns {Integer} Receives a bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/win32/api/mftransform/ne-mftransform-_mft_process_output_status">_MFT_PROCESS_OUTPUT_STATUS</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//mftransform/nf-mftransform-imftransform-processoutput
     */
    ProcessOutput(dwFlags, cOutputBufferCount, pOutputSamples) {
        result := ComCall(25, this, "uint", dwFlags, "uint", cOutputBufferCount, "ptr", pOutputSamples, "uint*", &pdwStatus := 0, "HRESULT")
        return pdwStatus
    }
}

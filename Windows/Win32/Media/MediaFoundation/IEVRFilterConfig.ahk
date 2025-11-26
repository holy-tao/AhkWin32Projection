#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Sets the number of input pins on the DirectShow Enhanced Video Renderer (EVR) filter.
 * @remarks
 * 
 * The DirectShow EVR filter starts with one input pin, which corresponds to the reference stream. To create additional pins for video substreams, call <a href="https://docs.microsoft.com/windows/desktop/api/evr/nf-evr-ievrfilterconfig-setnumberofstreams">SetNumberOfStreams</a>.
 * 
 * The EVR media sink for Media Foundation does not support this interface. To add new streams to the EVR media sink, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-addstreamsink">IMFMediaSink::AddStreamSink</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//evr/nn-evr-ievrfilterconfig
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IEVRFilterConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEVRFilterConfig
     * @type {Guid}
     */
    static IID => Guid("{83e91e85-82c1-4ea7-801d-85dc50b75086}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetNumberOfStreams", "GetNumberOfStreams"]

    /**
     * Sets the number of input pins on the EVR filter.
     * @param {Integer} dwMaxStreams Specifies the total number of input pins on the EVR filter. This value includes the input pin for the reference stream, which is created by default. For example, to mix one substream plus the reference stream, set this parameter to 2.
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
     * Invalid number of streams. The minimum is one, and the maximum is 16.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_WRONG_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method has already been called, or at least one pin is already connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-ievrfilterconfig-setnumberofstreams
     */
    SetNumberOfStreams(dwMaxStreams) {
        result := ComCall(3, this, "uint", dwMaxStreams, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of input pins on the EVR filter. The EVR filter always has at least one input pin, which corresponds to the reference stream.
     * @returns {Integer} Receives the number of streams.
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-ievrfilterconfig-getnumberofstreams
     */
    GetNumberOfStreams() {
        result := ComCall(4, this, "uint*", &pdwMaxStreams := 0, "HRESULT")
        return pdwMaxStreams
    }
}

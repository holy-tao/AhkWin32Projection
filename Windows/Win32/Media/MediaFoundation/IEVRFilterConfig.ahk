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
     * 
     * @param {Integer} dwMaxStreams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-ievrfilterconfig-setnumberofstreams
     */
    SetNumberOfStreams(dwMaxStreams) {
        result := ComCall(3, this, "uint", dwMaxStreams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwMaxStreams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-ievrfilterconfig-getnumberofstreams
     */
    GetNumberOfStreams(pdwMaxStreams) {
        result := ComCall(4, this, "uint*", pdwMaxStreams, "HRESULT")
        return result
    }
}

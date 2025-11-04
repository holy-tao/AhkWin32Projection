#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMStreamConfig interface sets the output format on certain capture and compression filters, for both audio and video.
 * @remarks
 * 
  * Filters expose this interface on their output pins. To use the interface, enumerate the filter's pins and query for <b>IAMStreamConfig</b>. Or, if you are using the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/capture-graph-builder">Capture Graph Builder</a> object to build the filter graph, you can call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-icapturegraphbuilder2-findinterface">ICaptureGraphBuilder2::FindInterface</a> method. Note that a capture filter might have separate pins for capture and preview.
  * 
  * <h3><a id="Filter_Developers"></a><a id="filter_developers"></a><a id="FILTER_DEVELOPERS"></a>Filter Developers</h3>
  * If you are writing a capture filter or compression filter, implement this interface on the video or audio output pin. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/exposing-capture-and-compression-formats">Exposing Capture and Compression Formats</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamstreamconfig
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMStreamConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMStreamConfig
     * @type {Guid}
     */
    static IID => Guid("{c6e13340-30ac-11d0-a18c-00a0c9118956}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFormat", "GetFormat", "GetNumberOfCapabilities", "GetStreamCaps"]

    /**
     * 
     * @param {Pointer<AM_MEDIA_TYPE>} pmt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamstreamconfig-setformat
     */
    SetFormat(pmt) {
        result := ComCall(3, this, "ptr", pmt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<AM_MEDIA_TYPE>>} ppmt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamstreamconfig-getformat
     */
    GetFormat(ppmt) {
        ppmtMarshal := ppmt is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, ppmtMarshal, ppmt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} piCount 
     * @param {Pointer<Integer>} piSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamstreamconfig-getnumberofcapabilities
     */
    GetNumberOfCapabilities(piCount, piSize) {
        piCountMarshal := piCount is VarRef ? "int*" : "ptr"
        piSizeMarshal := piSize is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, piCountMarshal, piCount, piSizeMarshal, piSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iIndex 
     * @param {Pointer<Pointer<AM_MEDIA_TYPE>>} ppmt 
     * @param {Pointer<Integer>} pSCC 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamstreamconfig-getstreamcaps
     */
    GetStreamCaps(iIndex, ppmt, pSCC) {
        ppmtMarshal := ppmt is VarRef ? "ptr*" : "ptr"
        pSCCMarshal := pSCC is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "int", iIndex, ppmtMarshal, ppmt, pSCCMarshal, pSCC, "HRESULT")
        return result
    }
}

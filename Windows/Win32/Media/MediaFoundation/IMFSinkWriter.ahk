#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\MF_SINK_WRITER_STATISTICS.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by the Microsoft Media Foundation sink writer object.
 * @remarks
 * 
  * To create the sink writer, call one of the following functions:
  * 
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-mfcreatesinkwriterfrommediasink">MFCreateSinkWriterFromMediaSink</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-mfcreatesinkwriterfromurl">MFCreateSinkWriterFromURL</a>
  * </li>
  * </ul>
  * Alternatively, use the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nn-mfreadwrite-imfreadwriteclassfactory">IMFReadWriteClassFactory</a> interface.
  * 
  * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
  * 
  * In Windows 8, this interface is extended with <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nn-mfreadwrite-imfsinkwriterex">IMFSinkWriterEx</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nn-mfreadwrite-imfsinkwriter
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSinkWriter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSinkWriter
     * @type {Guid}
     */
    static IID => Guid("{3137f1cd-fe5e-4805-a5d8-fb477448cb3d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddStream", "SetInputMediaType", "BeginWriting", "WriteSample", "SendStreamTick", "PlaceMarker", "NotifyEndOfSegment", "Flush", "Finalize", "GetServiceForStream", "GetStatistics"]

    /**
     * 
     * @param {IMFMediaType} pTargetMediaType 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-addstream
     */
    AddStream(pTargetMediaType) {
        result := ComCall(3, this, "ptr", pTargetMediaType, "uint*", &pdwStreamIndex := 0, "HRESULT")
        return pdwStreamIndex
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {IMFMediaType} pInputMediaType 
     * @param {IMFAttributes} pEncodingParameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-setinputmediatype
     */
    SetInputMediaType(dwStreamIndex, pInputMediaType, pEncodingParameters) {
        result := ComCall(4, this, "uint", dwStreamIndex, "ptr", pInputMediaType, "ptr", pEncodingParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-beginwriting
     */
    BeginWriting() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {IMFSample} pSample 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-writesample
     */
    WriteSample(dwStreamIndex, pSample) {
        result := ComCall(6, this, "uint", dwStreamIndex, "ptr", pSample, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Integer} llTimestamp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-sendstreamtick
     */
    SendStreamTick(dwStreamIndex, llTimestamp) {
        result := ComCall(7, this, "uint", dwStreamIndex, "int64", llTimestamp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-placemarker
     */
    PlaceMarker(dwStreamIndex, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(8, this, "uint", dwStreamIndex, pvContextMarshal, pvContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-notifyendofsegment
     */
    NotifyEndOfSegment(dwStreamIndex) {
        result := ComCall(9, this, "uint", dwStreamIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-flush
     */
    Flush(dwStreamIndex) {
        result := ComCall(10, this, "uint", dwStreamIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-finalize
     */
    Finalize() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<Guid>} guidService 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-getserviceforstream
     */
    GetServiceForStream(dwStreamIndex, guidService, riid) {
        result := ComCall(12, this, "uint", dwStreamIndex, "ptr", guidService, "ptr", riid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @returns {MF_SINK_WRITER_STATISTICS} 
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-getstatistics
     */
    GetStatistics(dwStreamIndex) {
        pStats := MF_SINK_WRITER_STATISTICS()
        result := ComCall(13, this, "uint", dwStreamIndex, "ptr", pStats, "HRESULT")
        return pStats
    }
}

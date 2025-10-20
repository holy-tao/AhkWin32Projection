#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IMFMediaType>} pTargetMediaType 
     * @param {Pointer<UInt32>} pdwStreamIndex 
     * @returns {HRESULT} 
     */
    AddStream(pTargetMediaType, pdwStreamIndex) {
        result := ComCall(3, this, "ptr", pTargetMediaType, "uint*", pdwStreamIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<IMFMediaType>} pInputMediaType 
     * @param {Pointer<IMFAttributes>} pEncodingParameters 
     * @returns {HRESULT} 
     */
    SetInputMediaType(dwStreamIndex, pInputMediaType, pEncodingParameters) {
        result := ComCall(4, this, "uint", dwStreamIndex, "ptr", pInputMediaType, "ptr", pEncodingParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BeginWriting() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<IMFSample>} pSample 
     * @returns {HRESULT} 
     */
    WriteSample(dwStreamIndex, pSample) {
        result := ComCall(6, this, "uint", dwStreamIndex, "ptr", pSample, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Integer} llTimestamp 
     * @returns {HRESULT} 
     */
    SendStreamTick(dwStreamIndex, llTimestamp) {
        result := ComCall(7, this, "uint", dwStreamIndex, "int64", llTimestamp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     */
    PlaceMarker(dwStreamIndex, pvContext) {
        result := ComCall(8, this, "uint", dwStreamIndex, "ptr", pvContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @returns {HRESULT} 
     */
    NotifyEndOfSegment(dwStreamIndex) {
        result := ComCall(9, this, "uint", dwStreamIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @returns {HRESULT} 
     */
    Flush(dwStreamIndex) {
        result := ComCall(10, this, "uint", dwStreamIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finalize() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<Guid>} guidService 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvObject 
     * @returns {HRESULT} 
     */
    GetServiceForStream(dwStreamIndex, guidService, riid, ppvObject) {
        result := ComCall(12, this, "uint", dwStreamIndex, "ptr", guidService, "ptr", riid, "ptr", ppvObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<MF_SINK_WRITER_STATISTICS>} pStats 
     * @returns {HRESULT} 
     */
    GetStatistics(dwStreamIndex, pStats) {
        result := ComCall(13, this, "uint", dwStreamIndex, "ptr", pStats, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

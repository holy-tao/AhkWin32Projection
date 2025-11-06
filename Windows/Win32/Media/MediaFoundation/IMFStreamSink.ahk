#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaSink.ahk
#Include .\IMFMediaTypeHandler.ahk
#Include .\IMFMediaEventGenerator.ahk

/**
 * Represents a stream on a media sink object.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfstreamsink
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFStreamSink extends IMFMediaEventGenerator{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFStreamSink
     * @type {Guid}
     */
    static IID => Guid("{0a97b3cf-8e7c-4a3d-8f8c-0c843dc247fb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMediaSink", "GetIdentifier", "GetMediaTypeHandler", "ProcessSample", "PlaceMarker", "Flush"]

    /**
     * 
     * @returns {IMFMediaSink} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfstreamsink-getmediasink
     */
    GetMediaSink() {
        result := ComCall(7, this, "ptr*", &ppMediaSink := 0, "HRESULT")
        return IMFMediaSink(ppMediaSink)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfstreamsink-getidentifier
     */
    GetIdentifier() {
        result := ComCall(8, this, "uint*", &pdwIdentifier := 0, "HRESULT")
        return pdwIdentifier
    }

    /**
     * 
     * @returns {IMFMediaTypeHandler} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfstreamsink-getmediatypehandler
     */
    GetMediaTypeHandler() {
        result := ComCall(9, this, "ptr*", &ppHandler := 0, "HRESULT")
        return IMFMediaTypeHandler(ppHandler)
    }

    /**
     * 
     * @param {IMFSample} pSample 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfstreamsink-processsample
     */
    ProcessSample(pSample) {
        result := ComCall(10, this, "ptr", pSample, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eMarkerType 
     * @param {Pointer<PROPVARIANT>} pvarMarkerValue 
     * @param {Pointer<PROPVARIANT>} pvarContextValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfstreamsink-placemarker
     */
    PlaceMarker(eMarkerType, pvarMarkerValue, pvarContextValue) {
        result := ComCall(11, this, "int", eMarkerType, "ptr", pvarMarkerValue, "ptr", pvarContextValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfstreamsink-flush
     */
    Flush() {
        result := ComCall(12, this, "HRESULT")
        return result
    }
}

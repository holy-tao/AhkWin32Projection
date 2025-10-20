#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaEventGenerator.ahk

/**
 * Represents a stream on a media sink object.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfstreamsink
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFStreamSink extends IMFMediaEventGenerator{
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
     * 
     * @param {Pointer<IMFMediaSink>} ppMediaSink 
     * @returns {HRESULT} 
     */
    GetMediaSink(ppMediaSink) {
        result := ComCall(7, this, "ptr", ppMediaSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwIdentifier 
     * @returns {HRESULT} 
     */
    GetIdentifier(pdwIdentifier) {
        result := ComCall(8, this, "uint*", pdwIdentifier, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFMediaTypeHandler>} ppHandler 
     * @returns {HRESULT} 
     */
    GetMediaTypeHandler(ppHandler) {
        result := ComCall(9, this, "ptr", ppHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFSample>} pSample 
     * @returns {HRESULT} 
     */
    ProcessSample(pSample) {
        result := ComCall(10, this, "ptr", pSample, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} eMarkerType 
     * @param {Pointer<PROPVARIANT>} pvarMarkerValue 
     * @param {Pointer<PROPVARIANT>} pvarContextValue 
     * @returns {HRESULT} 
     */
    PlaceMarker(eMarkerType, pvarMarkerValue, pvarContextValue) {
        result := ComCall(11, this, "int", eMarkerType, "ptr", pvarMarkerValue, "ptr", pvarContextValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Flush() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

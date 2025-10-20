#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFCaptureSink.ahk

/**
 * Extends the IMFCaptureSink interface to provide functionality for dynamically setting the output media type of the record sink or preview sink.
 * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nn-mfcaptureengine-imfcapturesink2
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCaptureSink2 extends IMFCaptureSink{
    /**
     * The interface identifier for IMFCaptureSink2
     * @type {Guid}
     */
    static IID => Guid("{f9e4219e-6197-4b5e-b888-bee310ab2c59}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<IMFMediaType>} pMediaType 
     * @param {Pointer<IMFAttributes>} pEncodingAttributes 
     * @returns {HRESULT} 
     */
    SetOutputMediaType(dwStreamIndex, pMediaType, pEncodingAttributes) {
        result := ComCall(8, this, "uint", dwStreamIndex, "ptr", pMediaType, "ptr", pEncodingAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

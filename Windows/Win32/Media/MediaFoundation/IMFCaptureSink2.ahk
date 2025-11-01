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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetOutputMediaType"]

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {IMFMediaType} pMediaType 
     * @param {IMFAttributes} pEncodingAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesink2-setoutputmediatype
     */
    SetOutputMediaType(dwStreamIndex, pMediaType, pEncodingAttributes) {
        result := ComCall(8, this, "uint", dwStreamIndex, "ptr", pMediaType, "ptr", pEncodingAttributes, "HRESULT")
        return result
    }
}

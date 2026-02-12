#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFCaptureSink.ahk

/**
 * Extends the IMFCaptureSink interface to provide functionality for dynamically setting the output media type of the record sink or preview sink.
 * @see https://learn.microsoft.com/windows/win32/api//content/mfcaptureengine/nn-mfcaptureengine-imfcapturesink2
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
     * Dynamically sets the output media type of the record sink or preview sink.
     * @remarks
     * This is an asynchronous call.  Listen to the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-capture-engine-output-media-type-set">MF_CAPTURE_ENGINE_OUTPUT_MEDIA_TYPE_SET</a> event
     * to be notified when the output media type has been set.
     * @param {Integer} dwStreamIndex The stream index to change the output media type on.
     * @param {IMFMediaType} pMediaType The new output media type.
     * @param {IMFAttributes} pEncodingAttributes The new encoder attributes. This can be  <b>null</b>.
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
     * The method succeeded
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALID_MEDIATYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sink does not support the media type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfcaptureengine/nf-mfcaptureengine-imfcapturesink2-setoutputmediatype
     */
    SetOutputMediaType(dwStreamIndex, pMediaType, pEncodingAttributes) {
        result := ComCall(8, this, "uint", dwStreamIndex, "ptr", pMediaType, "ptr", pEncodingAttributes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

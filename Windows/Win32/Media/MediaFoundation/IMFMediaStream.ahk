#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaSource.ahk
#Include .\IMFStreamDescriptor.ahk
#Include .\IMFMediaEventGenerator.ahk

/**
 * Represents one stream in a media source.
 * @remarks
 * 
 * Streams are created when a media source is started. For each stream, the media source sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/menewstream">MENewStream</a> event with a pointer to the stream's <b>IMFMediaStream</b> interface.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfmediastream
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaStream extends IMFMediaEventGenerator{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaStream
     * @type {Guid}
     */
    static IID => Guid("{d182108f-4ec6-443f-aa42-a71106ec825f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMediaSource", "GetStreamDescriptor", "RequestSample"]

    /**
     * Retrieves a pointer to the media source that created this media stream.
     * @returns {IMFMediaSource} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasource">IMFMediaSource</a> interface of the media source. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmediastream-getmediasource
     */
    GetMediaSource() {
        result := ComCall(7, this, "ptr*", &ppMediaSource := 0, "HRESULT")
        return IMFMediaSource(ppMediaSource)
    }

    /**
     * Retrieves a stream descriptor for this media stream.
     * @returns {IMFStreamDescriptor} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfstreamdescriptor">IMFStreamDescriptor</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmediastream-getstreamdescriptor
     */
    GetStreamDescriptor() {
        result := ComCall(8, this, "ptr*", &ppStreamDescriptor := 0, "HRESULT")
        return IMFStreamDescriptor(ppStreamDescriptor)
    }

    /**
     * Requests a sample from the media source.
     * @param {IUnknown} pToken Pointer to the <b>IUnknown</b> interface to an object that is used as a token for the request. The caller must implement this object. This parameter can be <b>NULL</b>. See Remarks.
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
     * <dt><b>MF_E_END_OF_STREAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The end of the stream was reached.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_MEDIA_SOURCE_WRONGSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media source is stopped.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The source's <a href="/windows/desktop/api/mfidl/nf-mfidl-imfmediasource-shutdown">Shutdown</a> method has been called.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmediastream-requestsample
     */
    RequestSample(pToken) {
        result := ComCall(9, this, "ptr", pToken, "HRESULT")
        return result
    }
}

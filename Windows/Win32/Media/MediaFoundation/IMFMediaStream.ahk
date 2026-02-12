#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaSource.ahk
#Include .\IMFStreamDescriptor.ahk
#Include .\IMFMediaEventGenerator.ahk

/**
 * Represents one stream in a media source.
 * @remarks
 * Streams are created when a media source is started. For each stream, the media source sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/menewstream">MENewStream</a> event with a pointer to the stream's <b>IMFMediaStream</b> interface.
 * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nn-mfidl-imfmediastream
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
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfmediastream-getmediasource
     */
    GetMediaSource() {
        result := ComCall(7, this, "ptr*", &ppMediaSource := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMFMediaSource(ppMediaSource)
    }

    /**
     * Retrieves a stream descriptor for this media stream.
     * @remarks
     * Do not modify the stream descriptor. To change the presentation, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasource-createpresentationdescriptor">IMFMediaSource::CreatePresentationDescriptor</a> and modify the presentation descriptor.
     * @returns {IMFStreamDescriptor} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfstreamdescriptor">IMFStreamDescriptor</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfmediastream-getstreamdescriptor
     */
    GetStreamDescriptor() {
        result := ComCall(8, this, "ptr*", &ppStreamDescriptor := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMFStreamDescriptor(ppStreamDescriptor)
    }

    /**
     * Requests a sample from the media source.
     * @remarks
     * If <i>pToken</i> is not <b>NULL</b>, the media stream calls <b>AddRef</b> on <i>pToken</i> and places the token in a first-in, first-out queue.
     * 
     * When the next sample is available, the media stream stream does the following:
     * 
     * <ol>
     * <li>Pulls the first token from the queue.
     *           </li>
     * <li>Sets the <a href="https://docs.microsoft.com/windows/desktop/medfound/mfsampleextension-token-attribute">MFSampleExtension_Token</a> attribute on the media sample. The attribute data is a pointer to the token object.
     *           </li>
     * <li>Sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/memediasample">MEMediaSample</a> event. The event data is a pointer to the media sample's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> interface.
     *           </li>
     * <li>Calls <b>Release</b> on the token.
     *           </li>
     * </ol>
     * If the media stream cannot fulfill the caller's request for a sample, it simply releases the token object and skips steps 2 and 3.
     * 
     * The caller should monitor the reference count on the request token. If the media stream sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/memediasample">MEMediaSample</a> event, get the <a href="https://docs.microsoft.com/windows/desktop/medfound/mfsampleextension-token-attribute">MFSampleExtension_Token</a> attribute from the sample and match the attribute value against the token. If the token's reference count falls to zero and you did not receive an MEMediaSample event, it means that the request was dropped.
     * 
     * Because the Media Foundation pipeline is multithreaded, the source's <b>RequestSample</b> method might get called after the source has stopped. If the media source is stopped, the method should return <b>MF_E_MEDIA_SOURCE_WRONGSTATE</b>. The pipeline does not treat this return code as an error condition. If the source returns any other error code, the pipeline treats it as fatal error and halts the session.<div class="alert"><b>Note</b>  Earlier versions of the documentation listed the wrong error code for this case.</div>
     * <div> </div>
     * 
     * 
     * If the media source is paused, the method succeeds, but the stream does not deliver the sample until the source is started again.
     * 
     * If a media source encounters an error asynchronously while processing data, it should signal the error in one of the following ways (but not both):
     * 
     * <ul>
     * <li>Return an error code from the next <b>RequestSample</b> call.</li>
     * <li>Send an <a href="https://docs.microsoft.com/windows/desktop/medfound/meerror">MEError</a> event.</li>
     * </ul>
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
     * The source's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasource-shutdown">Shutdown</a> method has been called.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfmediastream-requestsample
     */
    RequestSample(pToken) {
        result := ComCall(9, this, "ptr", pToken, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

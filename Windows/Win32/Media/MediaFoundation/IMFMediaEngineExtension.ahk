#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables an application to load media resources in the Media Engine.
 * @remarks
 * To use this interface, set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-media-engine-extension">MF_MEDIA_ENGINE_EXTENSION</a> attribute when you call the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineclassfactory-createinstance">IMFMediaEngineClassFactory::CreateInstance</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imfmediaengineextension
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaEngineExtension extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaEngineExtension
     * @type {Guid}
     */
    static IID => Guid("{2f69d622-20b5-41e9-afdf-89ced1dda04e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CanPlayType", "BeginCreateObject", "CancelObjectCreation", "EndCreateObject"]

    /**
     * Queries whether the object can load a specified type of media resource.
     * @remarks
     * Implement this method if your Media Engine extension supports one or more MIME types.
     * @param {BOOL} AudioOnly If <b>TRUE</b>, the Media Engine is set to audio-only mode. Otherwise, the Media Engine is set to audio-video mode.
     * @param {BSTR} MimeType A string that contains a MIME type with an optional codecs parameter, as defined in RFC 4281.
     * @returns {Integer} Receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_canplay">MF_MEDIA_ENGINE_CANPLAY</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineextension-canplaytype
     */
    CanPlayType(AudioOnly, MimeType) {
        MimeType := MimeType is String ? BSTR.Alloc(MimeType).Value : MimeType

        result := ComCall(3, this, "int", AudioOnly, "ptr", MimeType, "int*", &pAnswer := 0, "HRESULT")
        return pAnswer
    }

    /**
     * Begins an asynchronous request to create either a byte stream or a media source.
     * @remarks
     * This method requests the object to create either a byte stream or a media source, depending on the value of the <i>type</i> parameter:
     * 
     * <ul>
     * <li>If <i>type</i> is <b>MF_OBJECT_BYTESTREAM</b>, the method creates a byte stream for the URL that is specified in <i>bstrURL</i>. In this case, the <i>pByteStream</i> parameter is <b>NULL</b>. </li>
     * <li>If <i>type</i> is <b>MF_OBJECT_MEDIASOURCE</b>, the method creates a media source, using the byte stream that is specified in the <i>pByteStream</i> parameter. Note that <i>pByteStream</i> can also be <b>NULL</b> in this case.</li>
     * </ul>
     * The method is performed asynchronously. The Media Engine calls the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineextension-endcreateobject">IMFMediaEngineExtension::EndCreateObject</a> method to complete the operation.
     * 
     * <h3><a id="Implemention_Notes"></a><a id="implemention_notes"></a><a id="IMPLEMENTION_NOTES"></a>Implementation Notes</h3>
     * A Media Engine extension can be used to support a custom byte stream object, a custom media source, or both. For a byte stream, create the byte stream object when <i>type</i> equals <b>MF_OBJECT_BYTESTREAM</b>. For a media source, create the source when the type equals <b>MF_OBJECT_MEDIASOURCE</b>.
     * 
     * To load a URL, the Media Engine performs the following steps:<ol>
     * <li>Try to create a byte stream from the URL.</li>
     * <li>If a byte stream is successfully created, try to create a media source from the byte stream.</li>
     * <li>If a byte stream cannot be created, try to create a media source directly from the URL.</li>
     * </ol>
     * 
     * 
     * At each step, the Media Engine calls <b>IMFMediaEngineExtension::BeginCreateObject</b> on the extension object. If the <b>BeginCreateObject</b> method fails, the Media Engine tries the <a href="https://docs.microsoft.com/windows/desktop/medfound/source-resolver">Source Resolver</a>.
     * 
     * In your <b>BeginCreateObject</b> method, you can choose to handle any of the following cases:<ul>
     * <li>The <i>type</i> parameter is <b>MF_OBJECT_BYTESTREAM</b>. Create a byte stream from the URL.</li>
     * <li>The <i>type</i> parameter is <b>MF_OBJECT_MEDIASOURCE</b> and <i>pByteStream</i> points to a byte stream. Use the byte stream to create a media source. </li>
     * <li>The <i>type</i> parameter is <b>MF_OBJECT_MEDIASOURCE</b> and <i>pByteStream</i> is <b>NULL</b>. Create a media source from the URL.</li>
     * </ul>
     * 
     * 
     * Return a failure code for any cases that you do not handle. 
     * 
     * Examples:<ul>
     * <li>To support a custom media format, implement a media source. If the media source does not require any special byte-stream implementation, create the media source when <i>type</i> is <b>MF_OBJECT_MEDIASOURCE</b> and <i>pByteStream</i> is non-<b>NULL</b>. The standard Microsoft Media Foundation byte stream implementation will be used in this case.</li>
     * <li>To support a custom URL scheme, handle the case where <i>type</i> is <b>MF_OBJECT_BYTESTREAM</b> and return a byte stream object that is capable of reading the URL. </li>
     * </ul>
     * 
     * 
     * If the <b>BeginCreateObject</b> method succeeds, the operation should be performed asynchronously. When the operation completes, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method on the callback interface specified in <i>pCallback</i>. The Media Engine completes the operation by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineextension-endcreateobject">IMFMediaEngineExtension::EndCreateObject</a>.
     * @param {BSTR} bstrURL The URL of the media resource.
     * @param {IMFByteStream} pByteStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface.
     * 
     * If the <i>type</i> parameter equals  <b>MF_OBJECT_BYTESTREAM</b>, this parameter is <b>NULL</b>. 
     * 
     * If <i>type</i> equals <b>MF_OBJECT_MEDIASOURCE</b>, this parameter either contains a pointer to a byte stream or is <b>NULL</b>. See Remarks for more information.
     * @param {Integer} type A member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mf_object_type">MF_OBJECT_TYPE</a> enumeration that specifies which type of object to create.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_OBJECT_BYTESTREAM"></a><a id="mf_object_bytestream"></a><dl>
     * <dt><b>MF_OBJECT_BYTESTREAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Create a byte stream. The byte stream must support the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_OBJECT_MEDIASOURCE"></a><a id="mf_object_mediasource"></a><dl>
     * <dt><b>MF_OBJECT_MEDIASOURCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Create a media source. The media source must support the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasource">IMFMediaSource</a> interface.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {IMFAsyncCallback} pCallback A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface. This interface is used to signal the completion of the asynchronous operation.
     * @param {IUnknown} punkState A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of an object implemented by the caller. You can use this object to hold state information for the callback. The object is returned to the caller when the callback is invoked. This parameter can be <b>NULL</b>.
     * @returns {IUnknown} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.  This pointer can be used to cancel the asynchronous operation, by passing the pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineextension-cancelobjectcreation">IMFMediaEngineExtension::CancelObjectCreation</a> method. 
     * 
     * The caller must release the interface. This parameter can be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineextension-begincreateobject
     */
    BeginCreateObject(bstrURL, pByteStream, type, pCallback, punkState) {
        bstrURL := bstrURL is String ? BSTR.Alloc(bstrURL).Value : bstrURL

        result := ComCall(4, this, "ptr", bstrURL, "ptr", pByteStream, "int", type, "ptr*", &ppIUnknownCancelCookie := 0, "ptr", pCallback, "ptr", punkState, "HRESULT")
        return IUnknown(ppIUnknownCancelCookie)
    }

    /**
     * Cancels the current request to create an object.
     * @remarks
     * This method attempts to cancel a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineextension-begincreateobject">BeginCreateObject</a>. Because that method is asynchronous, however, it might complete before the operation can be canceled.
     * @param {IUnknown} pIUnknownCancelCookie The pointer that was returned in the the <i>ppIUnknownCancelCookie</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineextension-begincreateobject">IMFMediaEngineExtension::BeginCreateObject</a> method.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineextension-cancelobjectcreation
     */
    CancelObjectCreation(pIUnknownCancelCookie) {
        result := ComCall(5, this, "ptr", pIUnknownCancelCookie, "HRESULT")
        return result
    }

    /**
     * Completes an asynchronous request to create a byte stream or media source.
     * @remarks
     * The Media Engine calls this method to complete the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineextension-begincreateobject">IMFMediaEngineExtension::BeginCreateObject</a> method.
     * @param {IMFAsyncResult} pResult A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface.
     * @returns {IUnknown} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the byte stream or media source. The caller must release the interface
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineextension-endcreateobject
     */
    EndCreateObject(pResult) {
        result := ComCall(6, this, "ptr", pResult, "ptr*", &ppObject := 0, "HRESULT")
        return IUnknown(ppObject)
    }
}

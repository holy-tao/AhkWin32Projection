#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables an application to load media resources in the Media Engine.
 * @remarks
 * 
 * To use this interface, set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-media-engine-extension">MF_MEDIA_ENGINE_EXTENSION</a> attribute when you call the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineclassfactory-createinstance">IMFMediaEngineClassFactory::CreateInstance</a> method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imfmediaengineextension
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
     * @param {BOOL} AudioOnly If <b>TRUE</b>, the Media Engine is set to audio-only mode. Otherwise, the Media Engine is set to audio-video mode.
     * @param {BSTR} MimeType A string that contains a MIME type with an optional codecs parameter, as defined in RFC 4281.
     * @returns {Integer} Receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_canplay">MF_MEDIA_ENGINE_CANPLAY</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineextension-canplaytype
     */
    CanPlayType(AudioOnly, MimeType) {
        MimeType := MimeType is String ? BSTR.Alloc(MimeType).Value : MimeType

        result := ComCall(3, this, "int", AudioOnly, "ptr", MimeType, "int*", &pAnswer := 0, "HRESULT")
        return pAnswer
    }

    /**
     * Begins an asynchronous request to create either a byte stream or a media source.
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
     * @param {IUnknown} punkState A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of an object impemented by the caller. You can use this object to hold state information for the callback. The object is returned to the caller when the callback is invoked. This parameter can be <b>NULL</b>.
     * @returns {IUnknown} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.  This pointer can be used to cancel the asynchronous operation, by passing the pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineextension-cancelobjectcreation">IMFMediaEngineExtension::CancelObjectCreation</a> method. 
     * 
     * The caller must release the interface. This parameter can be NULL.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineextension-begincreateobject
     */
    BeginCreateObject(bstrURL, pByteStream, type, pCallback, punkState) {
        bstrURL := bstrURL is String ? BSTR.Alloc(bstrURL).Value : bstrURL

        result := ComCall(4, this, "ptr", bstrURL, "ptr", pByteStream, "int", type, "ptr*", &ppIUnknownCancelCookie := 0, "ptr", pCallback, "ptr", punkState, "HRESULT")
        return IUnknown(ppIUnknownCancelCookie)
    }

    /**
     * Cancels the current request to create an object.
     * @param {IUnknown} pIUnknownCancelCookie The pointer that was returned in the the <i>ppIUnknownCancelCookie</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineextension-begincreateobject">IMFMediaEngineExtension::BeginCreateObject</a> method.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineextension-cancelobjectcreation
     */
    CancelObjectCreation(pIUnknownCancelCookie) {
        result := ComCall(5, this, "ptr", pIUnknownCancelCookie, "HRESULT")
        return result
    }

    /**
     * Completes an asynchronous request to create a byte stream or media source.
     * @param {IMFAsyncResult} pResult A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface.
     * @returns {IUnknown} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the byte stream or media source. The caller must release the interface
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineextension-endcreateobject
     */
    EndCreateObject(pResult) {
        result := ComCall(6, this, "ptr", pResult, "ptr*", &ppObject := 0, "HRESULT")
        return IUnknown(ppObject)
    }
}

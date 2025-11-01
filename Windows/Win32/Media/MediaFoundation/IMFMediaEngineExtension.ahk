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
     * 
     * @param {BOOL} AudioOnly 
     * @param {BSTR} MimeType 
     * @param {Pointer<Integer>} pAnswer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineextension-canplaytype
     */
    CanPlayType(AudioOnly, MimeType, pAnswer) {
        MimeType := MimeType is String ? BSTR.Alloc(MimeType).Value : MimeType

        pAnswerMarshal := pAnswer is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "int", AudioOnly, "ptr", MimeType, pAnswerMarshal, pAnswer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrURL 
     * @param {IMFByteStream} pByteStream 
     * @param {Integer} type 
     * @param {Pointer<IUnknown>} ppIUnknownCancelCookie 
     * @param {IMFAsyncCallback} pCallback 
     * @param {IUnknown} punkState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineextension-begincreateobject
     */
    BeginCreateObject(bstrURL, pByteStream, type, ppIUnknownCancelCookie, pCallback, punkState) {
        bstrURL := bstrURL is String ? BSTR.Alloc(bstrURL).Value : bstrURL

        result := ComCall(4, this, "ptr", bstrURL, "ptr", pByteStream, "int", type, "ptr*", ppIUnknownCancelCookie, "ptr", pCallback, "ptr", punkState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pIUnknownCancelCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineextension-cancelobjectcreation
     */
    CancelObjectCreation(pIUnknownCancelCookie) {
        result := ComCall(5, this, "ptr", pIUnknownCancelCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFAsyncResult} pResult 
     * @param {Pointer<IUnknown>} ppObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineextension-endcreateobject
     */
    EndCreateObject(pResult, ppObject) {
        result := ComCall(6, this, "ptr", pResult, "ptr*", ppObject, "HRESULT")
        return result
    }
}

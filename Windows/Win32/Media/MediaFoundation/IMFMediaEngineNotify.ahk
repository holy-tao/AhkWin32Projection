#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Callback interface for the IMFMediaEngine interface.
 * @remarks
 * 
 * To set the callback pointer on the Media Engine, set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-media-engine-callback">MF_MEDIA_ENGINE_CALLBACK</a> attribute in the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineclassfactory-createinstance">IMFMediaEngineClassFactory::CreateInstance</a> method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imfmediaenginenotify
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaEngineNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaEngineNotify
     * @type {Guid}
     */
    static IID => Guid("{fee7c112-e776-42b5-9bbf-0048524e2bd5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EventNotify"]

    /**
     * Notifies the application when a playback event occurs.
     * @param {Integer} event A member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_event">MF_MEDIA_ENGINE_EVENT</a> enumeration that specifies the event.
     * @param {Pointer} param1 The first event parameter. The meaning of this parameter depends on the event code.
     * @param {Integer} param2 The second event parameter. The meaning of this parameter depends on the event code.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaenginenotify-eventnotify
     */
    EventNotify(event, param1, param2) {
        result := ComCall(3, this, "uint", event, "ptr", param1, "uint", param2, "HRESULT")
        return result
    }
}

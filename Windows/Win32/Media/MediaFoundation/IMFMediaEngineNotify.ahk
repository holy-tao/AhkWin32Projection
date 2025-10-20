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
     * 
     * @param {Integer} event 
     * @param {Pointer} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} 
     */
    EventNotify(event, param1, param2) {
        result := ComCall(3, this, "uint", event, "ptr", param1, "uint", param2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

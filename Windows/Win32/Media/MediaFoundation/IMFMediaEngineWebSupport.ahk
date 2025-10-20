#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables playback of web audio.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imfmediaenginewebsupport
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaEngineWebSupport extends IUnknown{
    /**
     * The interface identifier for IMFMediaEngineWebSupport
     * @type {Guid}
     */
    static IID => Guid("{ba2743a1-07e0-48ef-84b6-9a2ed023ca6c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {BOOL} 
     */
    ShouldDelayTheLoadEvent() {
        result := ComCall(3, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} dwSampleRate 
     * @param {Pointer<IAudioSourceProvider>} ppSourceProvider 
     * @returns {HRESULT} 
     */
    ConnectWebAudio(dwSampleRate, ppSourceProvider) {
        result := ComCall(4, this, "uint", dwSampleRate, "ptr", ppSourceProvider, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisconnectWebAudio() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

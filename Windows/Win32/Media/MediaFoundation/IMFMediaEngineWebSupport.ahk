#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAudioSourceProvider.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables playback of web audio.
 * @see https://learn.microsoft.com/windows/win32/api//content/mfmediaengine/nn-mfmediaengine-imfmediaenginewebsupport
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaEngineWebSupport extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShouldDelayTheLoadEvent", "ConnectWebAudio", "DisconnectWebAudio"]

    /**
     * Gets a value indicating if the connecting to Web audio should delay the page's load event.
     * @returns {BOOL} True if connection to Web audio should delay the page's load event; otherwise, false.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfmediaengine/nf-mfmediaengine-imfmediaenginewebsupport-shoulddelaytheloadevent
     */
    ShouldDelayTheLoadEvent() {
        result := ComCall(3, this, "int")
        return result
    }

    /**
     * Connects web audio to Media Engine using the specified sample rate.
     * @param {Integer} dwSampleRate The sample rate of the web audio.
     * @returns {Pointer<IAudioSourceProvider>} The sample rate of the web audio.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfmediaengine/nf-mfmediaengine-imfmediaenginewebsupport-connectwebaudio
     */
    ConnectWebAudio(dwSampleRate) {
        result := ComCall(4, this, "uint", dwSampleRate, "ptr*", &ppSourceProvider := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppSourceProvider
    }

    /**
     * Disconnects web audio from the Media Engine.
     * @returns {HRESULT} Returns S_OK on successful completion.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfmediaengine/nf-mfmediaengine-imfmediaenginewebsupport-disconnectwebaudio
     */
    DisconnectWebAudio() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

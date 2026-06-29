#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAudioSourceProvider.ahk" { IAudioSourceProvider }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables playback of web audio.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imfmediaenginewebsupport
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaEngineWebSupport extends IUnknown {
    /**
     * The interface identifier for IMFMediaEngineWebSupport
     * @type {Guid}
     */
    static IID := Guid("{ba2743a1-07e0-48ef-84b6-9a2ed023ca6c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaEngineWebSupport interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ShouldDelayTheLoadEvent : IntPtr
        ConnectWebAudio         : IntPtr
        DisconnectWebAudio      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaEngineWebSupport.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a value indicating if the connecting to Web audio should delay the page's load event.
     * @returns {BOOL} True if connection to Web audio should delay the page's load event; otherwise, false.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaenginewebsupport-shoulddelaytheloadevent
     */
    ShouldDelayTheLoadEvent() {
        result := ComCall(3, this, BOOL)
        return result
    }

    /**
     * Connects web audio to Media Engine using the specified sample rate.
     * @param {Integer} dwSampleRate The sample rate of the web audio.
     * @returns {IAudioSourceProvider} The sample rate of the web audio.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaenginewebsupport-connectwebaudio
     */
    ConnectWebAudio(dwSampleRate) {
        result := ComCall(4, this, "uint", dwSampleRate, "ptr*", &ppSourceProvider := 0, "HRESULT")
        return IAudioSourceProvider(ppSourceProvider)
    }

    /**
     * Disconnects web audio from the Media Engine.
     * @returns {HRESULT} Returns S_OK on successful completion.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaenginewebsupport-disconnectwebaudio
     */
    DisconnectWebAudio() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFMediaEngineWebSupport.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ShouldDelayTheLoadEvent := CallbackCreate(GetMethod(implObj, "ShouldDelayTheLoadEvent"), flags, 1)
        this.vtbl.ConnectWebAudio := CallbackCreate(GetMethod(implObj, "ConnectWebAudio"), flags, 3)
        this.vtbl.DisconnectWebAudio := CallbackCreate(GetMethod(implObj, "DisconnectWebAudio"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ShouldDelayTheLoadEvent)
        CallbackFree(this.vtbl.ConnectWebAudio)
        CallbackFree(this.vtbl.DisconnectWebAudio)
    }
}

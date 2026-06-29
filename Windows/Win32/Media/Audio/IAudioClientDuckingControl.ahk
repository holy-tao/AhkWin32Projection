#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\AUDIO_DUCKING_OPTIONS.ahk" { AUDIO_DUCKING_OPTIONS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a method, SetDuckingOptionsForCurrentStream, that allows an app to specify that the system shouldn't duck the audio of other streams when the app's audio render stream is active.
 * @remarks
 * Get an instance of the [IAudioClientDuckingControl](nn-audioclient-iaudioclientduckingcontrol.md) interface by calling [IAudioClient::GetService](nf-audioclient-iaudioclient-getservice.md), passing in the interface ID constant **IID_IAudioClientDuckingControl**.
 * 
 * **IAudioClientDuckingControl** only controls the ducking caused by the audio stream (**IAudioClient**) that the interface is obtained from. 
 * 
 * Audio from applications could continue to be ducked if there are other concurrent applications with streams that cause ducking.
 * @see https://learn.microsoft.com/windows/win32/api/audioclient/nn-audioclient-iaudioclientduckingcontrol
 * @namespace Windows.Win32.Media.Audio
 */
export default struct IAudioClientDuckingControl extends IUnknown {
    /**
     * The interface identifier for IAudioClientDuckingControl
     * @type {Guid}
     */
    static IID := Guid("{c789d381-a28c-4168-b28f-d3a837924dc3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioClientDuckingControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetDuckingOptionsForCurrentStream : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioClientDuckingControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the audio ducking options for an audio render stream.
     * @remarks
     * Get an instance of the [IAudioClientDuckingControl](nn-audioclient-iaudioclientduckingcontrol.md) interface by calling [IAudioClient::GetService](nf-audioclient-iaudioclient-getservice.md), passing in the interface ID constant **IID_IAudioClientDuckingControl**.
     * 
     * **IAudioClientDuckingControl** only controls the ducking caused by the audio stream (**IAudioClient**) that the interface is obtained from. 
     * 
     * Audio from applications could continue to be ducked if there are other concurrent applications with streams that cause ducking.
     * @param {AUDIO_DUCKING_OPTIONS} options A value from the [AUDIO_DUCKING_OPTIONS](ne-audioclient-audio_ducking_options.md) enumeration specifying the requested ducking behavior.
     * @returns {HRESULT} On successful completion, returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioclientduckingcontrol-setduckingoptionsforcurrentstream
     */
    SetDuckingOptionsForCurrentStream(options) {
        result := ComCall(3, this, AUDIO_DUCKING_OPTIONS, options, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAudioClientDuckingControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetDuckingOptionsForCurrentStream := CallbackCreate(GetMethod(implObj, "SetDuckingOptionsForCurrentStream"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetDuckingOptionsForCurrentStream)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\AMTVAudioEventType.ahk" { AMTVAudioEventType }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Note  This callback interface has been deprecated, because the TV Audio filter does not implement the callback mechanism. .
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamtvaudionotification
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMTVAudioNotification extends IUnknown {
    /**
     * The interface identifier for IAMTVAudioNotification
     * @type {Guid}
     */
    static IID := Guid("{83ec1c33-23d1-11d1-99e6-00a0c9560266}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMTVAudioNotification interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMTVAudioNotification.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Note  The IAMTVAudioNotification interface is deprecated. The OnEvent method handles events from a TV tuner card controlled by the IAMTVAudio interface.
     * @param {AMTVAudioEventType} Event Flag identifying the type of event. The only value currently defined is AMTVAUDIO_EVENT_CHANGED.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtvaudionotification-onevent
     */
    OnEvent(Event) {
        result := ComCall(3, this, AMTVAudioEventType, Event, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMTVAudioNotification.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnEvent := CallbackCreate(GetMethod(implObj, "OnEvent"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnEvent)
    }
}

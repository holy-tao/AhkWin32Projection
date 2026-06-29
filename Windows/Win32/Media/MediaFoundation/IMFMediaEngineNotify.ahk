#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Callback interface for the IMFMediaEngine interface.
 * @remarks
 * To set the callback pointer on the Media Engine, set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-media-engine-callback">MF_MEDIA_ENGINE_CALLBACK</a> attribute in the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineclassfactory-createinstance">IMFMediaEngineClassFactory::CreateInstance</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imfmediaenginenotify
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaEngineNotify extends IUnknown {
    /**
     * The interface identifier for IMFMediaEngineNotify
     * @type {Guid}
     */
    static IID := Guid("{fee7c112-e776-42b5-9bbf-0048524e2bd5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaEngineNotify interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EventNotify : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaEngineNotify.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies the application when a playback event occurs.
     * @param {Integer} event A member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_event">MF_MEDIA_ENGINE_EVENT</a> enumeration that specifies the event.
     * @param {Pointer} param1 The first event parameter. The meaning of this parameter depends on the event code.
     * @param {Integer} param2 The second event parameter. The meaning of this parameter depends on the event code.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaenginenotify-eventnotify
     */
    EventNotify(event, param1, param2) {
        result := ComCall(3, this, "uint", event, "ptr", param1, "uint", param2, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFMediaEngineNotify.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EventNotify := CallbackCreate(GetMethod(implObj, "EventNotify"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EventNotify)
    }
}

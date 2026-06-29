#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\TERMINAL_MEDIA_STATE.ahk" { TERMINAL_MEDIA_STATE }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ITMediaControl interface is a generic interface for media file terminals. The interface exposes methods that allow the application to start, stop, or pause current actions, such as a playback.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itmediacontrol
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITMediaControl extends IDispatch {
    /**
     * The interface identifier for ITMediaControl
     * @type {Guid}
     */
    static IID := Guid("{c445dde8-5199-4bc7-9807-5ffb92e42e09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITMediaControl interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Start          : IntPtr
        Stop           : IntPtr
        Pause          : IntPtr
        get_MediaState : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITMediaControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {TERMINAL_MEDIA_STATE} 
     */
    MediaState {
        get => this.get_MediaState()
    }

    /**
     * The Start method starts the action at the current location.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itmediacontrol-start
     */
    Start() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * The Stop method stops the current action and sets the current location to the beginning of the file.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itmediacontrol-stop
     */
    Stop() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * The Pause method pauses the action, remaining at the current location in the file.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itmediacontrol-pause
     */
    Pause() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * The get_MediaState method gets the current state of media on the file terminal.
     * @returns {TERMINAL_MEDIA_STATE} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-terminal_media_state">TERMINAL_MEDIA_STATE</a> descriptor of the current state of the file terminal.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itmediacontrol-get_mediastate
     */
    get_MediaState() {
        result := ComCall(10, this, "int*", &pTerminalMediaState := 0, "HRESULT")
        return pTerminalMediaState
    }

    Query(iid) {
        if (ITMediaControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Start := CallbackCreate(GetMethod(implObj, "Start"), flags, 1)
        this.vtbl.Stop := CallbackCreate(GetMethod(implObj, "Stop"), flags, 1)
        this.vtbl.Pause := CallbackCreate(GetMethod(implObj, "Pause"), flags, 1)
        this.vtbl.get_MediaState := CallbackCreate(GetMethod(implObj, "get_MediaState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Start)
        CallbackFree(this.vtbl.Stop)
        CallbackFree(this.vtbl.Pause)
        CallbackFree(this.vtbl.get_MediaState)
    }
}

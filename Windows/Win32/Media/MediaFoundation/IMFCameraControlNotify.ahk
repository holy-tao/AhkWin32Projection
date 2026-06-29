#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents the notification callback for changes to camera controls.
 * @remarks
 * Clients implement this interface to receive notifications when another app makes changes to the camera settings for a capture device. Pass the implementation into the [MFCreateCameraControlMonitor](nf-mfidl-mfcreatecameracontrolmonitor.md) function to create an instance of [IMFCameraControlMonitor](nn-mfidl-imfcameracontrolmonitor.md).
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfcameracontrolnotify
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFCameraControlNotify extends IUnknown {
    /**
     * The interface identifier for IMFCameraControlNotify
     * @type {Guid}
     */
    static IID := Guid("{e8f2540d-558a-4449-8b64-4863467a9fe8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFCameraControlNotify interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnChange : IntPtr
        OnError  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFCameraControlNotify.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Raised when a camera control value is changed.
     * @remarks
     * The control for which the **OnChange** event is invoked is specified by calling [IMFCameraControlMonitor::AddControlSubscription](nf-mfidl-imfcameracontrolmonitor-addcontrolsubscription.md). The explicitly supported controls include the properties under [PROPSETID_VIDCAP_VIDEOPROCAMP](/windows-hardware/drivers/stream/propsetid-vidcap-videoprocamp) and [PROPSETID_VIDCAP_CAMERACONTROL](/windows-hardware/drivers/stream/propsetid-vidcap-videoprocamp), and [KSPROPERTYSETID_ExtendedCameraControl](/windows-hardware/drivers/stream/kspropertysetid-extendedcameracontrol). If **AddControlSubscription** is called with KSPROPERTYSETID_ANYCAMERACONTROL as the *controlSet* parameter, then the created subscription will provoke callbacks for any control change, even those outside of the previously listed property sets. If a changed control is outside of those sets, then the **OnChange** callback will have the value KSPROPERTYSETID_ANYCAMERACONTROL as its *controlSet* parameter, but for the explicitly supported property sets, the *controlSet* GUID will still return the supported property set GUID, not KSPROPERTYSETID_ANYCAMERACONTROL. The returned *id* parameter in all cases will be the control ID of the altered control.
     * 
     * To see a code example that implements this method, see [IMFCameraControlNotify](nn-mfidl-imfcameracontrolnotify.md).
     * @param {Pointer<Guid>} controlSet A GUID specifying the camera control set to which the changed control belongs.
     * @param {Integer} id The ID of the changed control within the control set.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameracontrolnotify-onchange
     */
    OnChange(controlSet, id) {
        ComCall(3, this, Guid.Ptr, controlSet, "uint", id)
    }

    /**
     * Raised when an unrecoverable error occurs within the associated IMFCameraControlMonitor.
     * @remarks
     * After the call to this function returns, the system will cleanup and remove the reference to the [IMFCameraControlNotify](nn-mfidl-imfcameracontrolnotify.md). Clients do not need to call [IMFCameraControlMonitor::Shutdown](nf-mfidl-imfcameracontrolmonitor-shutdown.md) after receiving an **OnError** notification.
     * 
     * To see a code example that implements this method, see [IMFCameraControlNotify](nn-mfidl-imfcameracontrolnotify.md).
     * @param {HRESULT} hrStatus The internal error code associated with the error. Possible error values include the following:
     * 
     * | Value | Description |
     * |-------|-------------|
     * | E_OUTOFMEMORY | There were insufficient resources available for the monitor to function properly. |
     * | MF_INVALID_STATE_ERR | A corruption of memory states has occurred. |
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameracontrolnotify-onerror
     */
    OnError(hrStatus) {
        ComCall(4, this, "int", hrStatus)
    }

    Query(iid) {
        if (IMFCameraControlNotify.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnChange := CallbackCreate(GetMethod(implObj, "OnChange"), flags, 3)
        this.vtbl.OnError := CallbackCreate(GetMethod(implObj, "OnError"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnChange)
        CallbackFree(this.vtbl.OnError)
    }
}

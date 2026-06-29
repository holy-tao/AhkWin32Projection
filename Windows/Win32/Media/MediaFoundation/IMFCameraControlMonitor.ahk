#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a camera control monitor that is used to subscribe and unsubscribe to notifications when the state of a camera control changes.
 * @remarks
 * Get an instance of this interface by calling [MFCreateCameraControlMonitor](nf-mfidl-mfcreatecameracontrolmonitor.md). Clients implement the [IMFCameraControlNotify](nn-mfidl-imfcameracontrolnotify.md) interface to receive notifications.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfcameracontrolmonitor
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFCameraControlMonitor extends IUnknown {
    /**
     * The interface identifier for IMFCameraControlMonitor
     * @type {Guid}
     */
    static IID := Guid("{4d46f2c9-28ba-4970-8c7b-1f0c9d80af69}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFCameraControlMonitor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Start                     : IntPtr
        Stop                      : IntPtr
        AddControlSubscription    : IntPtr
        RemoveControlSubscription : IntPtr
        Shutdown                  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFCameraControlMonitor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Starts the camera control monitor, raising IMFCameraControlNotify::OnChange events for changes to controls registered with IMFCameraControlMonitor::AddControlSubscription.
     * @remarks
     * To see a code example that implements this method, see [IMFCameraControlNotify](nn-mfidl-imfcameracontrolnotify.md).
     * @returns {HRESULT} An HRESULT including the following:
     * 
     * | Value | Description |
     * |-------|-------------|
     * | S_OK  | Success     |
     * | MF_E_INVALIDREQUEST | The camera control monitor has already been started or has been shut down. |
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameracontrolmonitor-start
     */
    Start() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Stops the camera control monitor.
     * @remarks
     * Stopping the camera control monitor pauses control change notifications through [IMFCameraControlNotify::OnChange](nf-mfidl-imfcameracontrolnotify-onchange.md). While the monitor is stopped, clients can add and remove control subscriptions with calls to [AddControlSubscription](nf-mfidl-imfcameracontrolmonitor-addcontrolsubscription.md) and [RemoveControlSubscription](nf-mfidl-imfcameracontrolmonitor-removecontrolsubscription.md).
     * 
     * To see a code example that implements this method, see [IMFCameraControlNotify](nn-mfidl-imfcameracontrolnotify.md).
     * @returns {HRESULT} An HRESULT including the following:
     * 
     * 
     * | Value | Description |
     * |-------|-------------|
     * | S_OK  | Success     |
     * | MF_E_INVALIDREQUEST | The camera control monitor has already been stopped or has been shut down. |
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameracontrolmonitor-stop
     */
    Stop() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Adds a camera control to the list of controls for which IMFCameraControlNotify::OnChange notifications will be raised.
     * @remarks
     * Attempting to add or remove subscriptions after calling [Start](nf-mfidl-imfcameracontrolmonitor-start.md) but before calling [Stop](nf-mfidl-imfcameracontrolmonitor-stop.md), or after calling [Shutdown](nf-mfidl-imfcameracontrolmonitor-shutdown.md), will result in an error.
     * 
     * The explicitly supported controls include the properties under [PROPSETID_VIDCAP_VIDEOPROCAMP](/windows-hardware/drivers/stream/propsetid-vidcap-videoprocamp) and [PROPSETID_VIDCAP_CAMERACONTROL](/windows-hardware/drivers/stream/propsetid-vidcap-videoprocamp), and [KSPROPERTYSETID_ExtendedCameraControl](/windows-hardware/drivers/stream/kspropertysetid-extendedcameracontrol). If **AddControlSubscription** is called with KSPROPERTYSETID_ANYCAMERACONTROL as the *controlSet* parameter, then the created subscription will provoke callbacks for any control change, even those outside of the previously listed property sets. 
     * 
     * Specifying a value other than KSPROPERTYSETID_ANYCAMERACONTROL, PROPSETID_VIDCAP_VIDEOPROCAMP, 
     * PROPSETID_VIDCAP_CAMERACONTROL or KSPROPERTYSETID_ExtendedCameraControl will result in an error.
     * 
     * To see a code example that implements this method, see [IMFCameraControlNotify](nn-mfidl-imfcameracontrolnotify.md).
     * @param {Guid} controlSet The GUID for the camera control set to which the added control belongs.
     * @param {Integer} id The ID of the control within the control set.
     * @returns {HRESULT} An HRESULT including the following:
     * 
     * 
     * | Value | Description |
     * |-------|-------------|
     * | S_OK  | Success     |
     * | MF_E_INVALIDREQUEST | The camera control monitor is in the running or shutdown state. |
     * | MF_E_INVALIDARG | An invalid value was supplied for *controlSet*. See Remarks for more information. |
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameracontrolmonitor-addcontrolsubscription
     */
    AddControlSubscription(controlSet, id) {
        result := ComCall(5, this, Guid, controlSet, "uint", id, "HRESULT")
        return result
    }

    /**
     * Removes a camera control from the list of controls for which IMFCameraControlNotify::OnChange notifications will be raised.
     * @remarks
     * Attempting to add or remove subscriptions after calling [Start](nf-mfidl-imfcameracontrolmonitor-start.md) but before calling [Stop](nf-mfidl-imfcameracontrolmonitor-stop.md), or after calling [Shutdown](nf-mfidl-imfcameracontrolmonitor-shutdown.md), will result in an error.
     * 
     * The explicitly supported controls include the properties under [PROPSETID_VIDCAP_VIDEOPROCAMP](/windows-hardware/drivers/stream/propsetid-vidcap-videoprocamp) and [PROPSETID_VIDCAP_CAMERACONTROL](/windows-hardware/drivers/stream/propsetid-vidcap-videoprocamp), and [KSPROPERTYSETID_ExtendedCameraControl](/windows-hardware/drivers/stream/kspropertysetid-extendedcameracontrol). If **AddControlSubscription** is called with KSPROPERTYSETID_ANYCAMERACONTROL as the *controlSet* parameter, then the created subscription will provoke callbacks for any control change, even those outside of the previously listed property sets. 
     * 
     * Specifying a value other than KSPROPERTYSETID_ANYCAMERACONTROL, PROPSETID_VIDCAP_VIDEOPROCAMP, 
     * PROPSETID_VIDCAP_CAMERACONTROL or KSPROPERTYSETID_ExtendedCameraControl will result in an error.
     * 
     * To see a code example that implements this method, see [IMFCameraControlNotify](nn-mfidl-imfcameracontrolnotify.md).
     * @param {Guid} controlSet The GUID for the camera control set to which the added control belongs.
     * @param {Integer} id The ID of the control within the control set.
     * @returns {HRESULT} An HRESULT including the following:
     * 
     * 
     * | Value | Description |
     * |-------|-------------|
     * | S_OK  | Success     |
     * | MF_E_INVALIDREQUEST | The camera control monitor is in the running or shutdown state. |
     * | MF_E_INVALIDARG | An invalid value was supplied for *controlSet*. See Remarks for more information. |
     * | MF_E_NOT_FOUND | No subscription was found for the specified control.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameracontrolmonitor-removecontrolsubscription
     */
    RemoveControlSubscription(controlSet, id) {
        result := ComCall(6, this, Guid, controlSet, "uint", id, "HRESULT")
        return result
    }

    /**
     * The IMFCameraControlMonitor::Shutdown function shuts down the camera control monitor and cleans up associated resources.
     * @remarks
     * Clients are not required to call [Stop](nf-mfidl-imfcameracontrolmonitor-stop.md) before calling **Shutdown**. After calling **Shutdown** subsequent calls to [Start](nf-mfidl-imfcameracontrolmonitor-start.md), [Stop](nf-mfidl-imfcameracontrolmonitor-stop.md), [AddControlSubscription](nf-mfidl-imfcameracontrolmonitor-addcontrolsubscription.md), or [RemoveControlSubscription](nf-mfidl-imfcameracontrolmonitor-addcontrolsubscription.md) will result in an error.
     * 
     * To see a code example that implements this method, see [IMFCameraControlNotify](nn-mfidl-imfcameracontrolnotify.md).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameracontrolmonitor-shutdown
     */
    Shutdown() {
        ComCall(7, this)
    }

    Query(iid) {
        if (IMFCameraControlMonitor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Start := CallbackCreate(GetMethod(implObj, "Start"), flags, 1)
        this.vtbl.Stop := CallbackCreate(GetMethod(implObj, "Stop"), flags, 1)
        this.vtbl.AddControlSubscription := CallbackCreate(GetMethod(implObj, "AddControlSubscription"), flags, 3)
        this.vtbl.RemoveControlSubscription := CallbackCreate(GetMethod(implObj, "RemoveControlSubscription"), flags, 3)
        this.vtbl.Shutdown := CallbackCreate(GetMethod(implObj, "Shutdown"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Start)
        CallbackFree(this.vtbl.Stop)
        CallbackFree(this.vtbl.AddControlSubscription)
        CallbackFree(this.vtbl.RemoveControlSubscription)
        CallbackFree(this.vtbl.Shutdown)
    }
}

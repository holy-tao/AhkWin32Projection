#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a camera control monitor that is used to subscribe and unsubscribe to notifications when the state of a camera control changes.
 * @remarks
 * Get an instance of this interface by calling [MFCreateCameraControlMonitor](nf-mfidl-mfcreatecameracontrolmonitor.md). Clients implement the [IMFCameraControlNotify](nn-mfidl-imfcameracontrolnotify.md) interface to receive notifications.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfcameracontrolmonitor
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCameraControlMonitor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFCameraControlMonitor
     * @type {Guid}
     */
    static IID => Guid("{4d46f2c9-28ba-4970-8c7b-1f0c9d80af69}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Start", "Stop", "AddControlSubscription", "RemoveControlSubscription", "Shutdown"]

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
        result := ComCall(5, this, "ptr", controlSet, "uint", id, "HRESULT")
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
        result := ComCall(6, this, "ptr", controlSet, "uint", id, "HRESULT")
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
}

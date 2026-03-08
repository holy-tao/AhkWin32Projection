#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents the notification callback for changes to camera controls.
 * @remarks
 * Clients implement this interface to receive notifications when another app makes changes to the camera settings for a capture device. Pass the implementation into the [MFCreateCameraControlMonitor](nf-mfidl-mfcreatecameracontrolmonitor.md) function to create an instance of [IMFCameraControlMonitor](nn-mfidl-imfcameracontrolmonitor.md).
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfcameracontrolnotify
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCameraControlNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFCameraControlNotify
     * @type {Guid}
     */
    static IID => Guid("{e8f2540d-558a-4449-8b64-4863467a9fe8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnChange", "OnError"]

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
        ComCall(3, this, "ptr", controlSet, "uint", id)
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
}

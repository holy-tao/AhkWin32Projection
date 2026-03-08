#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is used to configure the capture device's extended properties.
 * @remarks
 * Get an instance of this interface by calling [IMFExtendedCameraController::GetExtendedCameraControl](nf-mfidl-imfextendedcameracontroller-getextendedcameracontrol.md)
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfextendedcameracontrol
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFExtendedCameraControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFExtendedCameraControl
     * @type {Guid}
     */
    static IID => Guid("{38e33520-fca1-4845-a27a-68b7c6ab3789}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCapabilities", "SetFlags", "GetFlags", "LockPayload", "UnlockPayload", "CommitSettings"]

    /**
     * Queries for property capabilities supported by the capture device.
     * @remarks
     * Verify the presence of a particular capability by performing a bitwise AND operation with the return value of this function. Some drivers may require that the camera device preview be in a running state before it can determine which controls are supported. If you check whether a certain control is supported before the preview stream is running, the control may be described as unsupported (and thus unavailable) even though it is supported by the video device.
     * 
     *  The following example demonstrates querying support for the [KSCAMERA_EXTENDEDPROP_VIDEOTORCH_ON](/windows-hardware/drivers/stream/ksproperty-cameracontrol-extended-torchmode) capability.
     * 
     * ```cpp
     * if (FAILED(m_cameraController->GetExtendedCameraControl(MF_CAPTURE_ENGINE_MEDIASOURCE,
     *     KSPROPERTY_CAMERACONTROL_EXTENDED_TORCHMODE,
     *     cameraControl.put())))
     * {
     *     // Return false to indicate that the Torch Mode control is not available.
     *     return false;
     * }
     * 
     * ULONGLONG capabilities = cameraControl->GetCapabilities();
     * 
     * // Check if the torch can be turned on.
     * if (capabilities & KSCAMERA_EXTENDEDPROP_VIDEOTORCH_ON)
     * {
     *     // Check if the torch is off.
     *     if ((cameraControl->GetFlags() & KSCAMERA_EXTENDEDPROP_VIDEOTORCH_ON) == 0)
     *     {
     *         // Torch is off. Tell the camera to turn it on.
     *         check_hresult(cameraControl->SetFlags(KSCAMERA_EXTENDEDPROP_VIDEOTORCH_ON));
     *         // Write the changed settings to the driver.
     *         check_hresult(cameraControl->CommitSettings());
     *     }
     * }
     * 
     * ```
     * @returns {Integer} A ULONGLONG mapping to property capabilities. Supported properties and capabilities are defined in the header file defined in ksmedia.h as constants with the naming convention **KSCAMERA_EXTENDEDPROP_**. For more information, see [KSPROPERTYSETID_ExtendedCameraControl](/windows-hardware/drivers/stream/kspropertysetid-extendedcameracontrol).
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfextendedcameracontrol-getcapabilities
     */
    GetCapabilities() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * Sets the flags for a property on the capture device.
     * @remarks
     * Before setting a property flag, you can check for supported capabilities by calling [IMFExtendedCameraControl::GetCapabilities](nf-mfidl-imfextendedcameracontrol-getcapabilities.md). The following example demonstrates querying support for the [KSCAMERA_EXTENDEDPROP_VIDEOTORCH_ON](/windows-hardware/drivers/stream/ksproperty-cameracontrol-extended-torchmode) capability.
     * 
     * ```cpp
     * if (FAILED(m_cameraController->GetExtendedCameraControl(MF_CAPTURE_ENGINE_MEDIASOURCE,
     *     KSPROPERTY_CAMERACONTROL_EXTENDED_TORCHMODE,
     *     cameraControl.put())))
     * {
     *     // Return false to indicate that the Torch Mode control is not available.
     *     return false;
     * }
     * 
     * ULONGLONG capabilities = cameraControl->GetCapabilities();
     * 
     * // Check if the torch can be turned on.
     * if (capabilities & KSCAMERA_EXTENDEDPROP_VIDEOTORCH_ON)
     * {
     *     // Check if the torch is off.
     *     if ((cameraControl->GetFlags() & KSCAMERA_EXTENDEDPROP_VIDEOTORCH_ON) == 0)
     *     {
     *         // Torch is off. Tell the camera to turn it on.
     *         check_hresult(cameraControl->SetFlags(KSCAMERA_EXTENDEDPROP_VIDEOTORCH_ON));
     *         // Write the changed settings to the driver.
     *         check_hresult(cameraControl->CommitSettings());
     *     }
     * }
     * 
     * ```
     * @param {Integer} ulFlags A ULONGLONG mapping to property flags. Supported properties and flags are defined in the header file defined in ksmedia.h as constants with the naming convention **KSCAMERA_EXTENDEDPROP_**. For more information, see [KSPROPERTYSETID_ExtendedCameraControl](/windows-hardware/drivers/stream/kspropertysetid-extendedcameracontrol).
     * @returns {HRESULT} Returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfextendedcameracontrol-setflags
     */
    SetFlags(ulFlags) {
        result := ComCall(4, this, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * Queries for property flags on the capture device.
     * @remarks
     * Set the property flags on the capture device by calling [IMFExtendedCameraControl::SetFlags](nf-mfidl-imfextendedcameracontrol-setflags.md). Before setting a property flag, you can check for supported capabilities by calling [IMFExtendedCameraControl::GetCapabilities](nf-mfidl-imfextendedcameracontrol-getcapabilities.md). The following example demonstrates querying support for the [KSCAMERA_EXTENDEDPROP_VIDEOTORCH_ON](/windows-hardware/drivers/stream/ksproperty-cameracontrol-extended-torchmode) capability.
     * 
     * ```cpp
     * if (FAILED(m_cameraController->GetExtendedCameraControl(MF_CAPTURE_ENGINE_MEDIASOURCE,
     *     KSPROPERTY_CAMERACONTROL_EXTENDED_TORCHMODE,
     *     cameraControl.put())))
     * {
     *     // Return false to indicate that the Torch Mode control is not available.
     *     return false;
     * }
     * 
     * ULONGLONG capabilities = cameraControl->GetCapabilities();
     * 
     * // Check if the torch can be turned on.
     * if (capabilities & KSCAMERA_EXTENDEDPROP_VIDEOTORCH_ON)
     * {
     *     // Check if the torch is off.
     *     if ((cameraControl->GetFlags() & KSCAMERA_EXTENDEDPROP_VIDEOTORCH_ON) == 0)
     *     {
     *         // Torch is off. Tell the camera to turn it on.
     *         check_hresult(cameraControl->SetFlags(KSCAMERA_EXTENDEDPROP_VIDEOTORCH_ON));
     *         // Write the changed settings to the driver.
     *         check_hresult(cameraControl->CommitSettings());
     *     }
     * }
     * 
     * ```
     * @returns {Integer} A ULONGLONG mapping to property flags. Supported properties and flags are defined in the header file defined in ksmedia.h as constants with the naming convention **KSCAMERA_EXTENDEDPROP_**. For more information, see [KSPROPERTYSETID_ExtendedCameraControl](/windows-hardware/drivers/stream/kspropertysetid-extendedcameracontrol).
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfextendedcameracontrol-getflags
     */
    GetFlags() {
        result := ComCall(5, this, "uint")
        return result
    }

    /**
     * Locks the internal payload buffer contained in the capture device control to enable querying or changing the payload.
     * @param {Pointer<Pointer<Integer>>} ppPayload Receives a BYTE pointer to the buffer containing the raw payload. The caller should not free the buffer directly, but instead should call [IMFExtendedCameraControl::UnlockPayload](nf-mfidl-imfextendedcameracontrol-unlockpayload.md) to free the resources.
     * @param {Pointer<Integer>} pulPayload Receives the size of the buffer returned in *ppPayload*.
     * @returns {HRESULT} On success, returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfextendedcameracontrol-lockpayload
     */
    LockPayload(ppPayload, pulPayload) {
        ppPayloadMarshal := ppPayload is VarRef ? "ptr*" : "ptr"
        pulPayloadMarshal := pulPayload is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, ppPayloadMarshal, ppPayload, pulPayloadMarshal, pulPayload, "HRESULT")
        return result
    }

    /**
     * Unlocks the raw payload contained in the capture device control.
     * @remarks
     * Lock the payload in a capture device control by calling [IMFExtendedCameraControl::LockPayload](nf-mfidl-imfextendedcameracontrol-lockpayload.md).
     * @returns {HRESULT} Returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfextendedcameracontrol-unlockpayload
     */
    UnlockPayload() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Commits the configured control settings to the camera driver.
     * @remarks
     * The following example demonstrates setting the [KSCAMERA_EXTENDEDPROP_VIDEOTORCH_ON](/windows-hardware/drivers/stream/ksproperty-cameracontrol-extended-torchmode) flag and committing the setting.
     * 
     * ```cpp
     * if (FAILED(m_cameraController->GetExtendedCameraControl(MF_CAPTURE_ENGINE_MEDIASOURCE,
     *     KSPROPERTY_CAMERACONTROL_EXTENDED_TORCHMODE,
     *     cameraControl.put())))
     * {
     *     // Return false to indicate that the Torch Mode control is not available.
     *     return false;
     * }
     * 
     * ULONGLONG capabilities = cameraControl->GetCapabilities();
     * 
     * // Check if the torch can be turned on.
     * if (capabilities & KSCAMERA_EXTENDEDPROP_VIDEOTORCH_ON)
     * {
     *     // Check if the torch is off.
     *     if ((cameraControl->GetFlags() & KSCAMERA_EXTENDEDPROP_VIDEOTORCH_ON) == 0)
     *     {
     *         // Torch is off. Tell the camera to turn it on.
     *         check_hresult(cameraControl->SetFlags(KSCAMERA_EXTENDEDPROP_VIDEOTORCH_ON));
     *         // Write the changed settings to the driver.
     *         check_hresult(cameraControl->CommitSettings());
     *     }
     * }
     * 
     * ```
     * @returns {HRESULT} Returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfextendedcameracontrol-commitsettings
     */
    CommitSettings() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}

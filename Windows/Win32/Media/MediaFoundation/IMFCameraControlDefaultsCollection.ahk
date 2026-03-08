#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFCameraControlDefaults.ahk
#Include .\IMFAttributes.ahk

/**
 * Represents a collection of camera controls.
 * @remarks
 * The [IMFCameraControlDefaults](nn-mfidl-imfcameracontroldefaults.md) is used to specify default control values for the controls in the collection. [IMFCameraConfigurationManager](nn-mfidl-imfcameraconfigurationmanager.md) allows you to save the collection as a set of default control values, enabling scenarios such as providing separate sets of default control values for different users.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfcameracontroldefaultscollection
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCameraControlDefaultsCollection extends IMFAttributes{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFCameraControlDefaultsCollection
     * @type {Guid}
     */
    static IID => Guid("{92d43d0f-54a8-4bae-96da-356d259a5c26}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 33

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetControlCount", "GetControl", "GetOrAddExtendedControl", "GetOrAddControl", "RemoveControl", "RemoveAllControls"]

    /**
     * Gets the number of controls currently in the control defaults collection.
     * @returns {Integer} A ULONG indicating the number of controls in the collection.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameracontroldefaultscollection-getcontrolcount
     */
    GetControlCount() {
        result := ComCall(33, this, "uint")
        return result
    }

    /**
     * Gets the control from the collection using the specified zero-based index.
     * @remarks
     * The specified index must be less than the value returned by [GetControlCount](nf-mfidl-imfcameracontroldefaultscollection-getcontrolcount.md).
     * @param {Integer} index The index of the control to retrieve.
     * @returns {IMFCameraControlDefaults} Receives a pointer to a [IMFCameraControlDefaults](nn-mfidl-imfcameracontroldefaults.md) instance representing the retrieved control.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameracontroldefaultscollection-getcontrol
     */
    GetControl(index) {
        result := ComCall(34, this, "uint", index, "ptr*", &configuration := 0, "HRESULT")
        return IMFCameraControlDefaults(configuration)
    }

    /**
     * Adds a new extended camera control to the camera control collection.
     * @remarks
     * The data payload size may vary for different controls. The *dataSize* value must be valid for the control payload schema so the control can reserve the buffer required.
     * @param {Integer} configType A value from the [MF_CAMERA_CONTROL_CONFIGURATION_TYPE](ne-mfidl-mf_camera_control_configuration_type.md) specifying whether the control value must be set before streaming begins or after streaming starts.
     * @param {Integer} constrolId The ID of the control to be added to the collection. This value must be an ID  in the [KSPROPERTYSETID_ExtendedCameraControl](/windows-hardware/drivers/stream/kspropertysetid-extendedcameracontrol) property set.
     * @param {Integer} streamId The ID of the stream associated with the control. This paramater is only used for pin-level controls. Otherwise, this value is ignored.
     * @param {Integer} dataSize The size of the data payload for the control, in bytes.
     * @returns {IMFCameraControlDefaults} Receives a pointer to a [IMFCameraControlDefaults](nn-mfidl-imfcameracontroldefaults.md) instance representing the added control.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameracontroldefaultscollection-getoraddextendedcontrol
     */
    GetOrAddExtendedControl(configType, constrolId, streamId, dataSize) {
        result := ComCall(35, this, "int", configType, "uint", constrolId, "uint", streamId, "uint", dataSize, "ptr*", &defaults := 0, "HRESULT")
        return IMFCameraControlDefaults(defaults)
    }

    /**
     * Adds a new custom camera control to the camera control collection.
     * @remarks
     * For custom controls, *controlSet* and *controlId* are based on the custom control DDI published by the camera driver vendor. Similarly, the *controlSize* and *dataSize* are based on the DDI published by the vendor.
     * @param {Integer} configType A value from the [MF_CAMERA_CONTROL_CONFIGURATION_TYPE](ne-mfidl-mf_camera_control_configuration_type.md) specifying whether the control value must be set before streaming begins or after streaming starts.
     * @param {Pointer<Guid>} controlSet A GUID specifying the control set to which the control belongs.
     * @param {Integer} constrolId The ID of the control to be added to the collection. This value must be an ID  in the [KSPROPERTYSETID_ExtendedCameraControl](/windows-hardware/drivers/stream/kspropertysetid-extendedcameracontrol) property set.
     * @param {Integer} controlSize The size of the control, in bytes. This value must be greater than or equal to the size of [KSPROPERTY](/windows-hardware/drivers/stream/ksproperty-structure).
     * @param {Integer} dataSize The size of the data payload for the control, in bytes.
     * @returns {IMFCameraControlDefaults} Receives a pointer to a [IMFCameraControlDefaults](nn-mfidl-imfcameracontroldefaults.md) instance representing the added control.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameracontroldefaultscollection-getoraddcontrol
     */
    GetOrAddControl(configType, controlSet, constrolId, controlSize, dataSize) {
        result := ComCall(36, this, "int", configType, "ptr", controlSet, "uint", constrolId, "uint", controlSize, "uint", dataSize, "ptr*", &defaults := 0, "HRESULT")
        return IMFCameraControlDefaults(defaults)
    }

    /**
     * Removes the control with the specified control set and ID from the camera control collection.
     * @param {Pointer<Guid>} controlSet A GUID specifying the control set to which the control belongs.
     * @param {Integer} constrolId The ID of the control to be removed from the collection.
     * @returns {HRESULT} S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameracontroldefaultscollection-removecontrol
     */
    RemoveControl(controlSet, constrolId) {
        result := ComCall(37, this, "ptr", controlSet, "uint", constrolId, "HRESULT")
        return result
    }

    /**
     * Removes all controls from the camera control collection.
     * @returns {HRESULT} S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameracontroldefaultscollection-removeallcontrols
     */
    RemoveAllControls() {
        result := ComCall(38, this, "HRESULT")
        return result
    }
}

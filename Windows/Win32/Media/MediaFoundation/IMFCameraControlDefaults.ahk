#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\MF_CAMERA_CONTROL_RANGE_INFO.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for specifying camera control default values.
 * @remarks
 * Use this interface in conjunction with [IMFCameraControlDefaultsCollection](nn-mfidl-imfcameracontroldefaultscollection.md) and [IMFCameraConfigurationManager](nn-mfidl-imfcameraconfigurationmanager.md) to save sets of default control values. This enables scenarios such as providing separate sets of default control values for different users.
 * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nn-mfidl-imfcameracontroldefaults
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCameraControlDefaults extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFCameraControlDefaults
     * @type {Guid}
     */
    static IID => Guid("{75510662-b034-48f4-88a7-8de61daa4af9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetType", "GetRangeInfo", "LockControlData", "UnlockControlData"]

    /**
     * Gets the configuration type of the control, indicating whether the control value must be set  before streaming begins or after streaming has started.
     * @remarks
     * Some sensor-level controls can only be set after the sensor has started (such as focus/brightness/whitebalance) since the controls require frame data for the parameters to converge. Other types of controls, such as HDR support, can only be configured when the sensor is not in a running state because it requires a re-programming of the sensor mode. Whether a well known control is pre or post start is specified in the DDI specification of the control. If the DDI specification does not explicitly indicate the a control is a pre-start control, the caller should assume the control is post-start.
     * @returns {Integer} A member of the [MF_SENSOR_CONTROL_CONFIGURATION_TYPE](ne-mfidl-mf_camera_control_configuration_type.md) enumeration specifying the configuration type of the control.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfcameracontroldefaults-gettype
     */
    GetType() {
        result := ComCall(3, this, "int")
        return result
    }

    /**
     * Gets information about the accepted range, step value, and default value for a camera control.
     * @remarks
     * The legacy [PROPSETID_VIDCAP_VIDEOPROCAMP](/windows-hardware/drivers/stream/propsetid-vidcap-videoprocamp) and [PROPSETID_VIDCAP_CAMERACONTROL](/windows-hardware/drivers/stream/propsetid-vidcap-cameracontrol) control sets provide an allowed range and step value of with which a control can be configured, as well as a default value. For other controls, the caller is responsible for knowing whether the underlying control supports the basic range information.
     * @returns {MF_CAMERA_CONTROL_RANGE_INFO} Receives a pointer to a [MF_CAMERA_CONTROL_RANGE_INFO](ns-mfidl-mf_camera_control_range_info.md) structure representing the range information for the control.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfcameracontroldefaults-getrangeinfo
     */
    GetRangeInfo() {
        rangeInfo := MF_CAMERA_CONTROL_RANGE_INFO()
        result := ComCall(4, this, "ptr", rangeInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return rangeInfo
    }

    /**
     * Retrieves the data payload for the control associated with the IMFCameraControlDefaults instance, allowing clients to modify the control value directly.
     * @remarks
     * The *control* and *data* parameters are not type checked because custom controls can have arbitrary payload schema sizes.
     * 
     * You must call [UnlockControlData](nf-mfidl-imfcameracontroldefaults-unlockcontroldata.md) must be called before the collection containing the control is submitted to [IMFCameraConfigurationManager::SaveDefaults](nf-mfidl-imfcameraconfigurationmanager-savedefaults.md) method.
     * @param {Pointer<Pointer<Void>>} control Receives a pointer to the control being locked.
     * @param {Pointer<Integer>} controlSize Receives the size of the structure pointed to by *control*.
     * @param {Pointer<Pointer<Void>>} data Receives a pointer to the data payload of the control.
     * @param {Pointer<Integer>} dataSize Receives the size of the buffer pointed to by *dataSize*.
     * @returns {HRESULT} S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfcameracontroldefaults-lockcontroldata
     */
    LockControlData(control, controlSize, data, dataSize) {
        controlMarshal := control is VarRef ? "ptr*" : "ptr"
        controlSizeMarshal := controlSize is VarRef ? "uint*" : "ptr"
        dataMarshal := data is VarRef ? "ptr*" : "ptr"
        dataSizeMarshal := dataSize is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, controlMarshal, control, controlSizeMarshal, controlSize, dataMarshal, data, dataSizeMarshal, dataSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Unlocks the control data buffer unlocked with a call to LockControlData.
     * @remarks
     * After calling **UnlockCOntrolData**, clients should not modify the contents of the control data buffer. Doing so will result in undefined behavior.
     * @returns {HRESULT} S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfcameracontroldefaults-unlockcontroldata
     */
    UnlockControlData() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFCameraControlDefaultsCollection.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMFCameraConfigurationManager interface can be created by calling the COM function CoCreateInstance, and passing the CLSID_CameraConfigurationManager as the CLSID parameter.
 * @remarks
 * An instance of the **IMFCameraConfigurationManager** interface can be created by calling the COM function [CoCreateInstance](../combaseapi/nf-combaseapi-cocreateinstance.md), and passing the **CLSID_CameraConfigurationManager** as the CLSID parameter.
 * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nn-mfidl-imfcameraconfigurationmanager
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCameraConfigurationManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFCameraConfigurationManager
     * @type {Guid}
     */
    static IID => Guid("{a624f617-4704-4206-8a6d-ebda4a093985}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadDefaults", "SaveDefaults", "Shutdown"]

    /**
     * Loads the camera control defaults for the specified capture source.
     * @remarks
     * If there are no default controls specified, the resulting collection will be empty. I.e.  [IMFCameraControlDefaultsCollection::GetControlCount](nf-mfidl-imfcameracontroldefaultscollection-getcontrolcount.md) will return 0.
     * @param {IMFAttributes} cameraAttributes A pointer to an [IMFAttributes](../mfobjects/nn-mfobjects-imfattributes.md) in which the [MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_SYMBOLIC_LINK](/windows/win32/medfound/mf-devsource-attribute-source-type-vidcap-symbolic-link) attribute identifies the capture source for which default control values are retrieved.
     * @returns {Pointer<IMFCameraControlDefaultsCollection>} Receives a pointer to an [IMFCameraControlDefaultsCollection](nn-mfidl-imfcameracontroldefaultscollection.md) object representing the collection of camera control default values.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfcameraconfigurationmanager-loaddefaults
     */
    LoadDefaults(cameraAttributes) {
        result := ComCall(3, this, "ptr", cameraAttributes, "ptr*", &configurations := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return configurations
    }

    /**
     * Saves the provided collection of camera control default values.
     * @remarks
     * The provided default values are assigned to the camera specified with the [MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_SYMBOLIC_LINK](/windows/win32/medfound/mf-devsource-attribute-source-type-vidcap-symbolic-link) value provided when the collection was loaded with a call to [IMFCameraConfigurationManager::LoadDefaults](nf-mfidl-imfcameraconfigurationmanager-loaddefaults.md). Saving an empty collection will clear all existing control default values for the associated camera.
     * @param {IMFCameraControlDefaultsCollection} configurations An [IMFCameraControlDefaultsCollection](nn-mfidl-imfcameracontroldefaultscollection.md) representing the collection of camera control default values to save.
     * @returns {HRESULT} An HRESULT, including the following:
     * 
     * | Value | Description | 
     * |-------|-------------|
     * | S_OK | Success. |
     * | MF_E_SHUTDOWN | The function was called after [IMFCameraConfigurationManager::Shutdown](nf-mfidl-imfcameraconfigurationmanager-shutdown.md) was called. |
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfcameraconfigurationmanager-savedefaults
     */
    SaveDefaults(configurations) {
        result := ComCall(4, this, "ptr", configurations, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IMFCameraConfigurationManager::Shutdown function shuts down the camera configuration manager.
     * @remarks
     * After calling **Shutdown**, subsequent calls to [IMFCameraConfigurationManager::LoadDefaults](nf-mfidl-imfcameraconfigurationmanager-loaddefaults.md) or [IMFCameraConfigurationManager::SaveDefaults](nf-mfidl-imfcameraconfigurationmanager-savedefaults.md) will result in an MF_E_SHUTDOWN error.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfcameraconfigurationmanager-shutdown
     */
    Shutdown() {
        ComCall(5, this)
    }
}

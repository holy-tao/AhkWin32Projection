#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFCameraControlDefaultsCollection.ahk" { IMFCameraControlDefaultsCollection }
#Import ".\IMFAttributes.ahk" { IMFAttributes }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IMFCameraConfigurationManager interface can be created by calling the COM function CoCreateInstance, and passing the CLSID_CameraConfigurationManager as the CLSID parameter.
 * @remarks
 * An instance of the **IMFCameraConfigurationManager** interface can be created by calling the COM function [CoCreateInstance](../combaseapi/nf-combaseapi-cocreateinstance.md), and passing the **CLSID_CameraConfigurationManager** as the CLSID parameter.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfcameraconfigurationmanager
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFCameraConfigurationManager extends IUnknown {
    /**
     * The interface identifier for IMFCameraConfigurationManager
     * @type {Guid}
     */
    static IID := Guid("{a624f617-4704-4206-8a6d-ebda4a093985}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFCameraConfigurationManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        LoadDefaults : IntPtr
        SaveDefaults : IntPtr
        Shutdown     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFCameraConfigurationManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Loads the camera control defaults for the specified capture source.
     * @remarks
     * If there are no default controls specified, the resulting collection will be empty. I.e.  [IMFCameraControlDefaultsCollection::GetControlCount](nf-mfidl-imfcameracontroldefaultscollection-getcontrolcount.md) will return 0.
     * @param {IMFAttributes} cameraAttributes A pointer to an [IMFAttributes](../mfobjects/nn-mfobjects-imfattributes.md) in which the [MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_SYMBOLIC_LINK](/windows/win32/medfound/mf-devsource-attribute-source-type-vidcap-symbolic-link) attribute identifies the capture source for which default control values are retrieved.
     * @returns {IMFCameraControlDefaultsCollection} Receives a pointer to an [IMFCameraControlDefaultsCollection](nn-mfidl-imfcameracontroldefaultscollection.md) object representing the collection of camera control default values.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameraconfigurationmanager-loaddefaults
     */
    LoadDefaults(cameraAttributes) {
        result := ComCall(3, this, "ptr", cameraAttributes, "ptr*", &configurations := 0, "HRESULT")
        return IMFCameraControlDefaultsCollection(configurations)
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameraconfigurationmanager-savedefaults
     */
    SaveDefaults(configurations) {
        result := ComCall(4, this, "ptr", configurations, "HRESULT")
        return result
    }

    /**
     * The IMFCameraConfigurationManager::Shutdown function shuts down the camera configuration manager.
     * @remarks
     * After calling **Shutdown**, subsequent calls to [IMFCameraConfigurationManager::LoadDefaults](nf-mfidl-imfcameraconfigurationmanager-loaddefaults.md) or [IMFCameraConfigurationManager::SaveDefaults](nf-mfidl-imfcameraconfigurationmanager-savedefaults.md) will result in an MF_E_SHUTDOWN error.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameraconfigurationmanager-shutdown
     */
    Shutdown() {
        ComCall(5, this)
    }

    Query(iid) {
        if (IMFCameraConfigurationManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LoadDefaults := CallbackCreate(GetMethod(implObj, "LoadDefaults"), flags, 3)
        this.vtbl.SaveDefaults := CallbackCreate(GetMethod(implObj, "SaveDefaults"), flags, 2)
        this.vtbl.Shutdown := CallbackCreate(GetMethod(implObj, "Shutdown"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LoadDefaults)
        CallbackFree(this.vtbl.SaveDefaults)
        CallbackFree(this.vtbl.Shutdown)
    }
}

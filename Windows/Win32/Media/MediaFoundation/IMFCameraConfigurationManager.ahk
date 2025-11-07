#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFCameraControlDefaultsCollection.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfcameraconfigurationmanager
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
     * 
     * @param {IMFAttributes} cameraAttributes 
     * @returns {IMFCameraControlDefaultsCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameraconfigurationmanager-loaddefaults
     */
    LoadDefaults(cameraAttributes) {
        result := ComCall(3, this, "ptr", cameraAttributes, "ptr*", &configurations := 0, "HRESULT")
        return IMFCameraControlDefaultsCollection(configurations)
    }

    /**
     * 
     * @param {IMFCameraControlDefaultsCollection} configurations 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameraconfigurationmanager-savedefaults
     */
    SaveDefaults(configurations) {
        result := ComCall(4, this, "ptr", configurations, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameraconfigurationmanager-shutdown
     */
    Shutdown() {
        ComCall(5, this)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCameraConfigurationManager extends IUnknown{
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
     * 
     * @param {Pointer<IMFAttributes>} cameraAttributes 
     * @param {Pointer<IMFCameraControlDefaultsCollection>} configurations 
     * @returns {HRESULT} 
     */
    LoadDefaults(cameraAttributes, configurations) {
        result := ComCall(3, this, "ptr", cameraAttributes, "ptr", configurations, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFCameraControlDefaultsCollection>} configurations 
     * @returns {HRESULT} 
     */
    SaveDefaults(configurations) {
        result := ComCall(4, this, "ptr", configurations, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Shutdown() {
        ComCall(5, this)
        return result
    }
}

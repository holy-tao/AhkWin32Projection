#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFAttributes.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCameraControlDefaultsCollection extends IMFAttributes{
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
     * 
     * @returns {Integer} 
     */
    GetControlCount() {
        result := ComCall(33, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IMFCameraControlDefaults>} configuration 
     * @returns {HRESULT} 
     */
    GetControl(index, configuration) {
        result := ComCall(34, this, "uint", index, "ptr", configuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} configType 
     * @param {Integer} constrolId 
     * @param {Integer} streamId 
     * @param {Integer} dataSize 
     * @param {Pointer<IMFCameraControlDefaults>} defaults 
     * @returns {HRESULT} 
     */
    GetOrAddExtendedControl(configType, constrolId, streamId, dataSize, defaults) {
        result := ComCall(35, this, "int", configType, "uint", constrolId, "uint", streamId, "uint", dataSize, "ptr", defaults, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} configType 
     * @param {Pointer<Guid>} controlSet 
     * @param {Integer} constrolId 
     * @param {Integer} controlSize 
     * @param {Integer} dataSize 
     * @param {Pointer<IMFCameraControlDefaults>} defaults 
     * @returns {HRESULT} 
     */
    GetOrAddControl(configType, controlSet, constrolId, controlSize, dataSize, defaults) {
        result := ComCall(36, this, "int", configType, "ptr", controlSet, "uint", constrolId, "uint", controlSize, "uint", dataSize, "ptr", defaults, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} controlSet 
     * @param {Integer} constrolId 
     * @returns {HRESULT} 
     */
    RemoveControl(controlSet, constrolId) {
        result := ComCall(37, this, "ptr", controlSet, "uint", constrolId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveAllControls() {
        result := ComCall(38, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

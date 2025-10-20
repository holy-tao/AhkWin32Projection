#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFVideoProcessorControl2.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFVideoProcessorControl3 extends IMFVideoProcessorControl2{
    /**
     * The interface identifier for IMFVideoProcessorControl3
     * @type {Guid}
     */
    static IID => Guid("{2424b3f2-eb23-40f1-91aa-74bddeea0883}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * 
     * @param {Pointer<IMFMediaType>} ppType 
     * @returns {HRESULT} 
     */
    GetNaturalOutputType(ppType) {
        result := ComCall(12, this, "ptr", ppType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @param {Integer} eFormat 
     * @param {Integer} eProjectionMode 
     * @returns {HRESULT} 
     */
    EnableSphericalVideoProcessing(fEnable, eFormat, eProjectionMode) {
        result := ComCall(13, this, "int", fEnable, "int", eFormat, "int", eProjectionMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} X 
     * @param {Float} Y 
     * @param {Float} Z 
     * @param {Float} W 
     * @param {Float} fieldOfView 
     * @returns {HRESULT} 
     */
    SetSphericalVideoProperties(X, Y, Z, W, fieldOfView) {
        result := ComCall(14, this, "float", X, "float", Y, "float", Z, "float", W, "float", fieldOfView, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pOutputDevice 
     * @returns {HRESULT} 
     */
    SetOutputDevice(pOutputDevice) {
        result := ComCall(15, this, "ptr", pOutputDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

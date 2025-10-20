#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpatialAudioObjectBase.ahk

/**
 * Represents an object that provides audio data to be rendered from a position in 3D space, relative to the user, a head-relative transfer function (HRTF).
 * @remarks
 * 
  * <div class="alert"><b>Note</b>  Many of the methods provided by this interface are implemented in the inherited <a href="https://docs.microsoft.com/windows/win32/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioobjectbase">ISpatialAudioObjectBase</a> interface.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//spatialaudiohrtf/nn-spatialaudiohrtf-ispatialaudioobjectforhrtf
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ISpatialAudioObjectForHrtf extends ISpatialAudioObjectBase{
    /**
     * The interface identifier for ISpatialAudioObjectForHrtf
     * @type {Guid}
     */
    static IID => Guid("{d7436ade-1978-4e14-aba0-555bd8eb83b4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} z 
     * @returns {HRESULT} 
     */
    SetPosition(x, y, z) {
        result := ComCall(7, this, "float", x, "float", y, "float", z, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} gain 
     * @returns {HRESULT} 
     */
    SetGain(gain) {
        result := ComCall(8, this, "float", gain, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} orientation 
     * @returns {HRESULT} 
     */
    SetOrientation(orientation) {
        result := ComCall(9, this, "float*", orientation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} environment 
     * @returns {HRESULT} 
     */
    SetEnvironment(environment) {
        result := ComCall(10, this, "int", environment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SpatialAudioHrtfDistanceDecay>} distanceDecay 
     * @returns {HRESULT} 
     */
    SetDistanceDecay(distanceDecay) {
        result := ComCall(11, this, "ptr", distanceDecay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SpatialAudioHrtfDirectivityUnion>} directivity 
     * @returns {HRESULT} 
     */
    SetDirectivity(directivity) {
        result := ComCall(12, this, "ptr", directivity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

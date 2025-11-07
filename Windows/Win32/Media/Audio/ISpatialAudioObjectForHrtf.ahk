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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPosition", "SetGain", "SetOrientation", "SetEnvironment", "SetDistanceDecay", "SetDirectivity"]

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} z 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiohrtf/nf-spatialaudiohrtf-ispatialaudioobjectforhrtf-setposition
     */
    SetPosition(x, y, z) {
        result := ComCall(7, this, "float", x, "float", y, "float", z, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} gain 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiohrtf/nf-spatialaudiohrtf-ispatialaudioobjectforhrtf-setgain
     */
    SetGain(gain) {
        result := ComCall(8, this, "float", gain, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Float>>} orientation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiohrtf/nf-spatialaudiohrtf-ispatialaudioobjectforhrtf-setorientation
     */
    SetOrientation(orientation) {
        orientationMarshal := orientation is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, orientationMarshal, orientation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} environment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiohrtf/nf-spatialaudiohrtf-ispatialaudioobjectforhrtf-setenvironment
     */
    SetEnvironment(environment) {
        result := ComCall(10, this, "int", environment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SpatialAudioHrtfDistanceDecay>} distanceDecay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiohrtf/nf-spatialaudiohrtf-ispatialaudioobjectforhrtf-setdistancedecay
     */
    SetDistanceDecay(distanceDecay) {
        result := ComCall(11, this, "ptr", distanceDecay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SpatialAudioHrtfDirectivityUnion>} directivity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiohrtf/nf-spatialaudiohrtf-ispatialaudioobjectforhrtf-setdirectivity
     */
    SetDirectivity(directivity) {
        result := ComCall(12, this, "ptr", directivity, "HRESULT")
        return result
    }
}

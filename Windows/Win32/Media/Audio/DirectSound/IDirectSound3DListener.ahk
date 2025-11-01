#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class IDirectSound3DListener extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectSound3DListener
     * @type {Guid}
     */
    static IID => Guid("{279afa84-4981-11ce-a521-0020af0be560}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAllParameters", "GetDistanceFactor", "GetDopplerFactor", "GetOrientation", "GetPosition", "GetRolloffFactor", "GetVelocity", "SetAllParameters", "SetDistanceFactor", "SetDopplerFactor", "SetOrientation", "SetPosition", "SetRolloffFactor", "SetVelocity", "CommitDeferredSettings"]

    /**
     * 
     * @param {Pointer<DS3DLISTENER>} pListener 
     * @returns {HRESULT} 
     */
    GetAllParameters(pListener) {
        result := ComCall(3, this, "ptr", pListener, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pflDistanceFactor 
     * @returns {HRESULT} 
     */
    GetDistanceFactor(pflDistanceFactor) {
        pflDistanceFactorMarshal := pflDistanceFactor is VarRef ? "float*" : "ptr"

        result := ComCall(4, this, pflDistanceFactorMarshal, pflDistanceFactor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pflDopplerFactor 
     * @returns {HRESULT} 
     */
    GetDopplerFactor(pflDopplerFactor) {
        pflDopplerFactorMarshal := pflDopplerFactor is VarRef ? "float*" : "ptr"

        result := ComCall(5, this, pflDopplerFactorMarshal, pflDopplerFactor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DVECTOR>} pvOrientFront 
     * @param {Pointer<D3DVECTOR>} pvOrientTop 
     * @returns {HRESULT} 
     */
    GetOrientation(pvOrientFront, pvOrientTop) {
        result := ComCall(6, this, "ptr", pvOrientFront, "ptr", pvOrientTop, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DVECTOR>} pvPosition 
     * @returns {HRESULT} 
     */
    GetPosition(pvPosition) {
        result := ComCall(7, this, "ptr", pvPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pflRolloffFactor 
     * @returns {HRESULT} 
     */
    GetRolloffFactor(pflRolloffFactor) {
        pflRolloffFactorMarshal := pflRolloffFactor is VarRef ? "float*" : "ptr"

        result := ComCall(8, this, pflRolloffFactorMarshal, pflRolloffFactor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DVECTOR>} pvVelocity 
     * @returns {HRESULT} 
     */
    GetVelocity(pvVelocity) {
        result := ComCall(9, this, "ptr", pvVelocity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DS3DLISTENER>} pcListener 
     * @param {Integer} dwApply 
     * @returns {HRESULT} 
     */
    SetAllParameters(pcListener, dwApply) {
        result := ComCall(10, this, "ptr", pcListener, "uint", dwApply, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} flDistanceFactor 
     * @param {Integer} dwApply 
     * @returns {HRESULT} 
     */
    SetDistanceFactor(flDistanceFactor, dwApply) {
        result := ComCall(11, this, "float", flDistanceFactor, "uint", dwApply, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} flDopplerFactor 
     * @param {Integer} dwApply 
     * @returns {HRESULT} 
     */
    SetDopplerFactor(flDopplerFactor, dwApply) {
        result := ComCall(12, this, "float", flDopplerFactor, "uint", dwApply, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} xFront 
     * @param {Float} yFront 
     * @param {Float} zFront 
     * @param {Float} xTop 
     * @param {Float} yTop 
     * @param {Float} zTop 
     * @param {Integer} dwApply 
     * @returns {HRESULT} 
     */
    SetOrientation(xFront, yFront, zFront, xTop, yTop, zTop, dwApply) {
        result := ComCall(13, this, "float", xFront, "float", yFront, "float", zFront, "float", xTop, "float", yTop, "float", zTop, "uint", dwApply, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} z 
     * @param {Integer} dwApply 
     * @returns {HRESULT} 
     */
    SetPosition(x, y, z, dwApply) {
        result := ComCall(14, this, "float", x, "float", y, "float", z, "uint", dwApply, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} flRolloffFactor 
     * @param {Integer} dwApply 
     * @returns {HRESULT} 
     */
    SetRolloffFactor(flRolloffFactor, dwApply) {
        result := ComCall(15, this, "float", flRolloffFactor, "uint", dwApply, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} z 
     * @param {Integer} dwApply 
     * @returns {HRESULT} 
     */
    SetVelocity(x, y, z, dwApply) {
        result := ComCall(16, this, "float", x, "float", y, "float", z, "uint", dwApply, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CommitDeferredSettings() {
        result := ComCall(17, this, "HRESULT")
        return result
    }
}

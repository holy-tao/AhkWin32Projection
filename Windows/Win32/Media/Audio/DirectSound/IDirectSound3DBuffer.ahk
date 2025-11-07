#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\DS3DBUFFER.ahk
#Include ..\..\..\Graphics\Direct3D\D3DVECTOR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class IDirectSound3DBuffer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectSound3DBuffer
     * @type {Guid}
     */
    static IID => Guid("{279afa86-4981-11ce-a521-0020af0be560}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAllParameters", "GetConeAngles", "GetConeOrientation", "GetConeOutsideVolume", "GetMaxDistance", "GetMinDistance", "GetMode", "GetPosition", "GetVelocity", "SetAllParameters", "SetConeAngles", "SetConeOrientation", "SetConeOutsideVolume", "SetMaxDistance", "SetMinDistance", "SetMode", "SetPosition", "SetVelocity"]

    /**
     * 
     * @returns {DS3DBUFFER} 
     */
    GetAllParameters() {
        pDs3dBuffer := DS3DBUFFER()
        result := ComCall(3, this, "ptr", pDs3dBuffer, "HRESULT")
        return pDs3dBuffer
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwInsideConeAngle 
     * @param {Pointer<Integer>} pdwOutsideConeAngle 
     * @returns {HRESULT} 
     */
    GetConeAngles(pdwInsideConeAngle, pdwOutsideConeAngle) {
        pdwInsideConeAngleMarshal := pdwInsideConeAngle is VarRef ? "uint*" : "ptr"
        pdwOutsideConeAngleMarshal := pdwOutsideConeAngle is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwInsideConeAngleMarshal, pdwInsideConeAngle, pdwOutsideConeAngleMarshal, pdwOutsideConeAngle, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {D3DVECTOR} 
     */
    GetConeOrientation() {
        pvOrientation := D3DVECTOR()
        result := ComCall(5, this, "ptr", pvOrientation, "HRESULT")
        return pvOrientation
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetConeOutsideVolume() {
        result := ComCall(6, this, "int*", &plConeOutsideVolume := 0, "HRESULT")
        return plConeOutsideVolume
    }

    /**
     * 
     * @returns {Float} 
     */
    GetMaxDistance() {
        result := ComCall(7, this, "float*", &pflMaxDistance := 0, "HRESULT")
        return pflMaxDistance
    }

    /**
     * 
     * @returns {Float} 
     */
    GetMinDistance() {
        result := ComCall(8, this, "float*", &pflMinDistance := 0, "HRESULT")
        return pflMinDistance
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMode() {
        result := ComCall(9, this, "uint*", &pdwMode := 0, "HRESULT")
        return pdwMode
    }

    /**
     * 
     * @returns {D3DVECTOR} 
     */
    GetPosition() {
        pvPosition := D3DVECTOR()
        result := ComCall(10, this, "ptr", pvPosition, "HRESULT")
        return pvPosition
    }

    /**
     * 
     * @returns {D3DVECTOR} 
     */
    GetVelocity() {
        pvVelocity := D3DVECTOR()
        result := ComCall(11, this, "ptr", pvVelocity, "HRESULT")
        return pvVelocity
    }

    /**
     * 
     * @param {Pointer<DS3DBUFFER>} pcDs3dBuffer 
     * @param {Integer} dwApply 
     * @returns {HRESULT} 
     */
    SetAllParameters(pcDs3dBuffer, dwApply) {
        result := ComCall(12, this, "ptr", pcDs3dBuffer, "uint", dwApply, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInsideConeAngle 
     * @param {Integer} dwOutsideConeAngle 
     * @param {Integer} dwApply 
     * @returns {HRESULT} 
     */
    SetConeAngles(dwInsideConeAngle, dwOutsideConeAngle, dwApply) {
        result := ComCall(13, this, "uint", dwInsideConeAngle, "uint", dwOutsideConeAngle, "uint", dwApply, "HRESULT")
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
    SetConeOrientation(x, y, z, dwApply) {
        result := ComCall(14, this, "float", x, "float", y, "float", z, "uint", dwApply, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lConeOutsideVolume 
     * @param {Integer} dwApply 
     * @returns {HRESULT} 
     */
    SetConeOutsideVolume(lConeOutsideVolume, dwApply) {
        result := ComCall(15, this, "int", lConeOutsideVolume, "uint", dwApply, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} flMaxDistance 
     * @param {Integer} dwApply 
     * @returns {HRESULT} 
     */
    SetMaxDistance(flMaxDistance, dwApply) {
        result := ComCall(16, this, "float", flMaxDistance, "uint", dwApply, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} flMinDistance 
     * @param {Integer} dwApply 
     * @returns {HRESULT} 
     */
    SetMinDistance(flMinDistance, dwApply) {
        result := ComCall(17, this, "float", flMinDistance, "uint", dwApply, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMode 
     * @param {Integer} dwApply 
     * @returns {HRESULT} 
     */
    SetMode(dwMode, dwApply) {
        result := ComCall(18, this, "uint", dwMode, "uint", dwApply, "HRESULT")
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
        result := ComCall(19, this, "float", x, "float", y, "float", z, "uint", dwApply, "HRESULT")
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
        result := ComCall(20, this, "float", x, "float", y, "float", z, "uint", dwApply, "HRESULT")
        return result
    }
}

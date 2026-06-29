#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Graphics\Direct3D\D3DVECTOR.ahk" { D3DVECTOR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DS3DBUFFER.ahk" { DS3DBUFFER }

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
export default struct IDirectSound3DBuffer extends IUnknown {
    /**
     * The interface identifier for IDirectSound3DBuffer
     * @type {Guid}
     */
    static IID := Guid("{279afa86-4981-11ce-a521-0020af0be560}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectSound3DBuffer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetAllParameters     : IntPtr
        GetConeAngles        : IntPtr
        GetConeOrientation   : IntPtr
        GetConeOutsideVolume : IntPtr
        GetMaxDistance       : IntPtr
        GetMinDistance       : IntPtr
        GetMode              : IntPtr
        GetPosition          : IntPtr
        GetVelocity          : IntPtr
        SetAllParameters     : IntPtr
        SetConeAngles        : IntPtr
        SetConeOrientation   : IntPtr
        SetConeOutsideVolume : IntPtr
        SetMaxDistance       : IntPtr
        SetMinDistance       : IntPtr
        SetMode              : IntPtr
        SetPosition          : IntPtr
        SetVelocity          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectSound3DBuffer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {DS3DBUFFER} 
     */
    GetAllParameters() {
        pDs3dBuffer := DS3DBUFFER()
        result := ComCall(3, this, DS3DBUFFER.Ptr, pDs3dBuffer, "HRESULT")
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
        result := ComCall(5, this, D3DVECTOR.Ptr, pvOrientation, "HRESULT")
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
        result := ComCall(10, this, D3DVECTOR.Ptr, pvPosition, "HRESULT")
        return pvPosition
    }

    /**
     * 
     * @returns {D3DVECTOR} 
     */
    GetVelocity() {
        pvVelocity := D3DVECTOR()
        result := ComCall(11, this, D3DVECTOR.Ptr, pvVelocity, "HRESULT")
        return pvVelocity
    }

    /**
     * 
     * @param {Pointer<DS3DBUFFER>} pcDs3dBuffer 
     * @param {Integer} dwApply 
     * @returns {HRESULT} 
     */
    SetAllParameters(pcDs3dBuffer, dwApply) {
        result := ComCall(12, this, DS3DBUFFER.Ptr, pcDs3dBuffer, "uint", dwApply, "HRESULT")
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

    Query(iid) {
        if (IDirectSound3DBuffer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAllParameters := CallbackCreate(GetMethod(implObj, "GetAllParameters"), flags, 2)
        this.vtbl.GetConeAngles := CallbackCreate(GetMethod(implObj, "GetConeAngles"), flags, 3)
        this.vtbl.GetConeOrientation := CallbackCreate(GetMethod(implObj, "GetConeOrientation"), flags, 2)
        this.vtbl.GetConeOutsideVolume := CallbackCreate(GetMethod(implObj, "GetConeOutsideVolume"), flags, 2)
        this.vtbl.GetMaxDistance := CallbackCreate(GetMethod(implObj, "GetMaxDistance"), flags, 2)
        this.vtbl.GetMinDistance := CallbackCreate(GetMethod(implObj, "GetMinDistance"), flags, 2)
        this.vtbl.GetMode := CallbackCreate(GetMethod(implObj, "GetMode"), flags, 2)
        this.vtbl.GetPosition := CallbackCreate(GetMethod(implObj, "GetPosition"), flags, 2)
        this.vtbl.GetVelocity := CallbackCreate(GetMethod(implObj, "GetVelocity"), flags, 2)
        this.vtbl.SetAllParameters := CallbackCreate(GetMethod(implObj, "SetAllParameters"), flags, 3)
        this.vtbl.SetConeAngles := CallbackCreate(GetMethod(implObj, "SetConeAngles"), flags, 4)
        this.vtbl.SetConeOrientation := CallbackCreate(GetMethod(implObj, "SetConeOrientation"), flags, 5)
        this.vtbl.SetConeOutsideVolume := CallbackCreate(GetMethod(implObj, "SetConeOutsideVolume"), flags, 3)
        this.vtbl.SetMaxDistance := CallbackCreate(GetMethod(implObj, "SetMaxDistance"), flags, 3)
        this.vtbl.SetMinDistance := CallbackCreate(GetMethod(implObj, "SetMinDistance"), flags, 3)
        this.vtbl.SetMode := CallbackCreate(GetMethod(implObj, "SetMode"), flags, 3)
        this.vtbl.SetPosition := CallbackCreate(GetMethod(implObj, "SetPosition"), flags, 5)
        this.vtbl.SetVelocity := CallbackCreate(GetMethod(implObj, "SetVelocity"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAllParameters)
        CallbackFree(this.vtbl.GetConeAngles)
        CallbackFree(this.vtbl.GetConeOrientation)
        CallbackFree(this.vtbl.GetConeOutsideVolume)
        CallbackFree(this.vtbl.GetMaxDistance)
        CallbackFree(this.vtbl.GetMinDistance)
        CallbackFree(this.vtbl.GetMode)
        CallbackFree(this.vtbl.GetPosition)
        CallbackFree(this.vtbl.GetVelocity)
        CallbackFree(this.vtbl.SetAllParameters)
        CallbackFree(this.vtbl.SetConeAngles)
        CallbackFree(this.vtbl.SetConeOrientation)
        CallbackFree(this.vtbl.SetConeOutsideVolume)
        CallbackFree(this.vtbl.SetMaxDistance)
        CallbackFree(this.vtbl.SetMinDistance)
        CallbackFree(this.vtbl.SetMode)
        CallbackFree(this.vtbl.SetPosition)
        CallbackFree(this.vtbl.SetVelocity)
    }
}

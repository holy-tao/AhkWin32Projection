#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Graphics\Direct3D\D3DVECTOR.ahk" { D3DVECTOR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DS3DLISTENER.ahk" { DS3DLISTENER }

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
export default struct IDirectSound3DListener extends IUnknown {
    /**
     * The interface identifier for IDirectSound3DListener
     * @type {Guid}
     */
    static IID := Guid("{279afa84-4981-11ce-a521-0020af0be560}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectSound3DListener interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetAllParameters       : IntPtr
        GetDistanceFactor      : IntPtr
        GetDopplerFactor       : IntPtr
        GetOrientation         : IntPtr
        GetPosition            : IntPtr
        GetRolloffFactor       : IntPtr
        GetVelocity            : IntPtr
        SetAllParameters       : IntPtr
        SetDistanceFactor      : IntPtr
        SetDopplerFactor       : IntPtr
        SetOrientation         : IntPtr
        SetPosition            : IntPtr
        SetRolloffFactor       : IntPtr
        SetVelocity            : IntPtr
        CommitDeferredSettings : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectSound3DListener.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {DS3DLISTENER} 
     */
    GetAllParameters() {
        pListener := DS3DLISTENER()
        result := ComCall(3, this, DS3DLISTENER.Ptr, pListener, "HRESULT")
        return pListener
    }

    /**
     * 
     * @returns {Float} 
     */
    GetDistanceFactor() {
        result := ComCall(4, this, "float*", &pflDistanceFactor := 0, "HRESULT")
        return pflDistanceFactor
    }

    /**
     * 
     * @returns {Float} 
     */
    GetDopplerFactor() {
        result := ComCall(5, this, "float*", &pflDopplerFactor := 0, "HRESULT")
        return pflDopplerFactor
    }

    /**
     * 
     * @param {Pointer<D3DVECTOR>} pvOrientFront 
     * @param {Pointer<D3DVECTOR>} pvOrientTop 
     * @returns {HRESULT} 
     */
    GetOrientation(pvOrientFront, pvOrientTop) {
        result := ComCall(6, this, D3DVECTOR.Ptr, pvOrientFront, D3DVECTOR.Ptr, pvOrientTop, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {D3DVECTOR} 
     */
    GetPosition() {
        pvPosition := D3DVECTOR()
        result := ComCall(7, this, D3DVECTOR.Ptr, pvPosition, "HRESULT")
        return pvPosition
    }

    /**
     * 
     * @returns {Float} 
     */
    GetRolloffFactor() {
        result := ComCall(8, this, "float*", &pflRolloffFactor := 0, "HRESULT")
        return pflRolloffFactor
    }

    /**
     * 
     * @returns {D3DVECTOR} 
     */
    GetVelocity() {
        pvVelocity := D3DVECTOR()
        result := ComCall(9, this, D3DVECTOR.Ptr, pvVelocity, "HRESULT")
        return pvVelocity
    }

    /**
     * 
     * @param {Pointer<DS3DLISTENER>} pcListener 
     * @param {Integer} dwApply 
     * @returns {HRESULT} 
     */
    SetAllParameters(pcListener, dwApply) {
        result := ComCall(10, this, DS3DLISTENER.Ptr, pcListener, "uint", dwApply, "HRESULT")
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

    Query(iid) {
        if (IDirectSound3DListener.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAllParameters := CallbackCreate(GetMethod(implObj, "GetAllParameters"), flags, 2)
        this.vtbl.GetDistanceFactor := CallbackCreate(GetMethod(implObj, "GetDistanceFactor"), flags, 2)
        this.vtbl.GetDopplerFactor := CallbackCreate(GetMethod(implObj, "GetDopplerFactor"), flags, 2)
        this.vtbl.GetOrientation := CallbackCreate(GetMethod(implObj, "GetOrientation"), flags, 3)
        this.vtbl.GetPosition := CallbackCreate(GetMethod(implObj, "GetPosition"), flags, 2)
        this.vtbl.GetRolloffFactor := CallbackCreate(GetMethod(implObj, "GetRolloffFactor"), flags, 2)
        this.vtbl.GetVelocity := CallbackCreate(GetMethod(implObj, "GetVelocity"), flags, 2)
        this.vtbl.SetAllParameters := CallbackCreate(GetMethod(implObj, "SetAllParameters"), flags, 3)
        this.vtbl.SetDistanceFactor := CallbackCreate(GetMethod(implObj, "SetDistanceFactor"), flags, 3)
        this.vtbl.SetDopplerFactor := CallbackCreate(GetMethod(implObj, "SetDopplerFactor"), flags, 3)
        this.vtbl.SetOrientation := CallbackCreate(GetMethod(implObj, "SetOrientation"), flags, 8)
        this.vtbl.SetPosition := CallbackCreate(GetMethod(implObj, "SetPosition"), flags, 5)
        this.vtbl.SetRolloffFactor := CallbackCreate(GetMethod(implObj, "SetRolloffFactor"), flags, 3)
        this.vtbl.SetVelocity := CallbackCreate(GetMethod(implObj, "SetVelocity"), flags, 5)
        this.vtbl.CommitDeferredSettings := CallbackCreate(GetMethod(implObj, "CommitDeferredSettings"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAllParameters)
        CallbackFree(this.vtbl.GetDistanceFactor)
        CallbackFree(this.vtbl.GetDopplerFactor)
        CallbackFree(this.vtbl.GetOrientation)
        CallbackFree(this.vtbl.GetPosition)
        CallbackFree(this.vtbl.GetRolloffFactor)
        CallbackFree(this.vtbl.GetVelocity)
        CallbackFree(this.vtbl.SetAllParameters)
        CallbackFree(this.vtbl.SetDistanceFactor)
        CallbackFree(this.vtbl.SetDopplerFactor)
        CallbackFree(this.vtbl.SetOrientation)
        CallbackFree(this.vtbl.SetPosition)
        CallbackFree(this.vtbl.SetRolloffFactor)
        CallbackFree(this.vtbl.SetVelocity)
        CallbackFree(this.vtbl.CommitDeferredSettings)
    }
}

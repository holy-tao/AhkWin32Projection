#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\SPAUDIOSTATE.ahk" { SPAUDIOSTATE }
#Import ".\ISpStreamFormat.ahk" { ISpStreamFormat }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Audio\WAVEFORMATEX.ahk" { WAVEFORMATEX }
#Import ".\SPAUDIOSTATUS.ahk" { SPAUDIOSTATUS }
#Import ".\SPAUDIOBUFFERINFO.ahk" { SPAUDIOBUFFERINFO }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpAudio extends ISpStreamFormat {
    /**
     * The interface identifier for ISpAudio
     * @type {Guid}
     */
    static IID := Guid("{c05c768f-fae8-4ec2-8e07-338321c12452}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpAudio interfaces
    */
    struct Vtbl extends ISpStreamFormat.Vtbl {
        SetState            : IntPtr
        SetFormat           : IntPtr
        GetStatus           : IntPtr
        SetBufferInfo       : IntPtr
        GetBufferInfo       : IntPtr
        GetDefaultFormat    : IntPtr
        EventHandle         : IntPtr
        GetVolumeLevel      : IntPtr
        SetVolumeLevel      : IntPtr
        GetBufferNotifySize : IntPtr
        SetBufferNotifySize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpAudio.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {SPAUDIOSTATE} NewState 
     * @param {Integer} ullReserved 
     * @returns {HRESULT} 
     */
    SetState(NewState, ullReserved) {
        result := ComCall(15, this, SPAUDIOSTATE, NewState, "uint", ullReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidFmtId 
     * @param {Pointer<WAVEFORMATEX>} pWaveFormatEx 
     * @returns {HRESULT} 
     */
    SetFormat(rguidFmtId, pWaveFormatEx) {
        result := ComCall(16, this, Guid.Ptr, rguidFmtId, WAVEFORMATEX.Ptr, pWaveFormatEx, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPAUDIOSTATUS>} pStatus 
     * @returns {HRESULT} 
     */
    GetStatus(pStatus) {
        result := ComCall(17, this, SPAUDIOSTATUS.Ptr, pStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPAUDIOBUFFERINFO>} pBuffInfo 
     * @returns {HRESULT} 
     */
    SetBufferInfo(pBuffInfo) {
        result := ComCall(18, this, SPAUDIOBUFFERINFO.Ptr, pBuffInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPAUDIOBUFFERINFO>} pBuffInfo 
     * @returns {HRESULT} 
     */
    GetBufferInfo(pBuffInfo) {
        result := ComCall(19, this, SPAUDIOBUFFERINFO.Ptr, pBuffInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pFormatId 
     * @param {Pointer<Pointer<WAVEFORMATEX>>} ppCoMemWaveFormatEx 
     * @returns {HRESULT} 
     */
    GetDefaultFormat(pFormatId, ppCoMemWaveFormatEx) {
        ppCoMemWaveFormatExMarshal := ppCoMemWaveFormatEx is VarRef ? "ptr*" : "ptr"

        result := ComCall(20, this, Guid.Ptr, pFormatId, ppCoMemWaveFormatExMarshal, ppCoMemWaveFormatEx, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HANDLE} 
     */
    EventHandle() {
        result := ComCall(21, this, HANDLE.Owned)
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pLevel 
     * @returns {HRESULT} 
     */
    GetVolumeLevel(pLevel) {
        pLevelMarshal := pLevel is VarRef ? "uint*" : "ptr"

        result := ComCall(22, this, pLevelMarshal, pLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Level 
     * @returns {HRESULT} 
     */
    SetVolumeLevel(Level) {
        result := ComCall(23, this, "uint", Level, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcbSize 
     * @returns {HRESULT} 
     */
    GetBufferNotifySize(pcbSize) {
        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

        result := ComCall(24, this, pcbSizeMarshal, pcbSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbSize 
     * @returns {HRESULT} 
     */
    SetBufferNotifySize(cbSize) {
        result := ComCall(25, this, "uint", cbSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpAudio.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetState := CallbackCreate(GetMethod(implObj, "SetState"), flags, 3)
        this.vtbl.SetFormat := CallbackCreate(GetMethod(implObj, "SetFormat"), flags, 3)
        this.vtbl.GetStatus := CallbackCreate(GetMethod(implObj, "GetStatus"), flags, 2)
        this.vtbl.SetBufferInfo := CallbackCreate(GetMethod(implObj, "SetBufferInfo"), flags, 2)
        this.vtbl.GetBufferInfo := CallbackCreate(GetMethod(implObj, "GetBufferInfo"), flags, 2)
        this.vtbl.GetDefaultFormat := CallbackCreate(GetMethod(implObj, "GetDefaultFormat"), flags, 3)
        this.vtbl.EventHandle := CallbackCreate(GetMethod(implObj, "EventHandle"), flags, 1)
        this.vtbl.GetVolumeLevel := CallbackCreate(GetMethod(implObj, "GetVolumeLevel"), flags, 2)
        this.vtbl.SetVolumeLevel := CallbackCreate(GetMethod(implObj, "SetVolumeLevel"), flags, 2)
        this.vtbl.GetBufferNotifySize := CallbackCreate(GetMethod(implObj, "GetBufferNotifySize"), flags, 2)
        this.vtbl.SetBufferNotifySize := CallbackCreate(GetMethod(implObj, "SetBufferNotifySize"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetState)
        CallbackFree(this.vtbl.SetFormat)
        CallbackFree(this.vtbl.GetStatus)
        CallbackFree(this.vtbl.SetBufferInfo)
        CallbackFree(this.vtbl.GetBufferInfo)
        CallbackFree(this.vtbl.GetDefaultFormat)
        CallbackFree(this.vtbl.EventHandle)
        CallbackFree(this.vtbl.GetVolumeLevel)
        CallbackFree(this.vtbl.SetVolumeLevel)
        CallbackFree(this.vtbl.GetBufferNotifySize)
        CallbackFree(this.vtbl.SetBufferNotifySize)
    }
}

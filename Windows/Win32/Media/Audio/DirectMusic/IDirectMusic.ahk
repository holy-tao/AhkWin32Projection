#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DMUS_PORTCAPS.ahk" { DMUS_PORTCAPS }
#Import ".\IDirectMusicPort.ahk" { IDirectMusicPort }
#Import ".\IDirectMusicBuffer.ahk" { IDirectMusicBuffer }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import ".\DMUS_CLOCKINFO8.ahk" { DMUS_CLOCKINFO8 }
#Import ".\DMUS_PORTPARAMS8.ahk" { DMUS_PORTPARAMS8 }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\IReferenceClock.ahk" { IReferenceClock }
#Import "..\DirectSound\IDirectSound.ahk" { IDirectSound }
#Import ".\DMUS_BUFFERDESC.ahk" { DMUS_BUFFERDESC }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct IDirectMusic extends IUnknown {
    /**
     * The interface identifier for IDirectMusic
     * @type {Guid}
     */
    static IID := Guid("{6536115a-7b2d-11d2-ba18-0000f875ac12}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectMusic interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EnumPort          : IntPtr
        CreateMusicBuffer : IntPtr
        CreatePort        : IntPtr
        EnumMasterClock   : IntPtr
        GetMasterClock    : IntPtr
        SetMasterClock    : IntPtr
        Activate          : IntPtr
        GetDefaultPort    : IntPtr
        SetDirectSound    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectMusic.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<DMUS_PORTCAPS>} pPortCaps 
     * @returns {HRESULT} 
     */
    EnumPort(dwIndex, pPortCaps) {
        result := ComCall(3, this, "uint", dwIndex, DMUS_PORTCAPS.Ptr, pPortCaps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DMUS_BUFFERDESC>} pBufferDesc 
     * @param {IUnknown} pUnkOuter 
     * @returns {IDirectMusicBuffer} 
     */
    CreateMusicBuffer(pBufferDesc, pUnkOuter) {
        result := ComCall(4, this, DMUS_BUFFERDESC.Ptr, pBufferDesc, "ptr*", &ppBuffer := 0, "ptr", pUnkOuter, "HRESULT")
        return IDirectMusicBuffer(ppBuffer)
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsidPort 
     * @param {Pointer<DMUS_PORTPARAMS8>} pPortParams 
     * @param {IUnknown} pUnkOuter 
     * @returns {IDirectMusicPort} 
     */
    CreatePort(rclsidPort, pPortParams, pUnkOuter) {
        result := ComCall(5, this, Guid.Ptr, rclsidPort, DMUS_PORTPARAMS8.Ptr, pPortParams, "ptr*", &ppPort := 0, "ptr", pUnkOuter, "HRESULT")
        return IDirectMusicPort(ppPort)
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<DMUS_CLOCKINFO8>} lpClockInfo 
     * @returns {HRESULT} 
     */
    EnumMasterClock(dwIndex, lpClockInfo) {
        result := ComCall(6, this, "uint", dwIndex, DMUS_CLOCKINFO8.Ptr, lpClockInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidClock 
     * @returns {IReferenceClock} 
     */
    GetMasterClock(pguidClock) {
        result := ComCall(7, this, Guid.Ptr, pguidClock, "ptr*", &ppReferenceClock := 0, "HRESULT")
        return IReferenceClock(ppReferenceClock)
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidClock 
     * @returns {HRESULT} 
     */
    SetMasterClock(rguidClock) {
        result := ComCall(8, this, Guid.Ptr, rguidClock, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     */
    Activate(fEnable) {
        result := ComCall(9, this, BOOL, fEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidPort 
     * @returns {HRESULT} 
     */
    GetDefaultPort(pguidPort) {
        result := ComCall(10, this, Guid.Ptr, pguidPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectSound} pDirectSound 
     * @param {HWND} _hWnd 
     * @returns {HRESULT} 
     */
    SetDirectSound(pDirectSound, _hWnd) {
        result := ComCall(11, this, "ptr", pDirectSound, HWND, _hWnd, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectMusic.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumPort := CallbackCreate(GetMethod(implObj, "EnumPort"), flags, 3)
        this.vtbl.CreateMusicBuffer := CallbackCreate(GetMethod(implObj, "CreateMusicBuffer"), flags, 4)
        this.vtbl.CreatePort := CallbackCreate(GetMethod(implObj, "CreatePort"), flags, 5)
        this.vtbl.EnumMasterClock := CallbackCreate(GetMethod(implObj, "EnumMasterClock"), flags, 3)
        this.vtbl.GetMasterClock := CallbackCreate(GetMethod(implObj, "GetMasterClock"), flags, 3)
        this.vtbl.SetMasterClock := CallbackCreate(GetMethod(implObj, "SetMasterClock"), flags, 2)
        this.vtbl.Activate := CallbackCreate(GetMethod(implObj, "Activate"), flags, 2)
        this.vtbl.GetDefaultPort := CallbackCreate(GetMethod(implObj, "GetDefaultPort"), flags, 2)
        this.vtbl.SetDirectSound := CallbackCreate(GetMethod(implObj, "SetDirectSound"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumPort)
        CallbackFree(this.vtbl.CreateMusicBuffer)
        CallbackFree(this.vtbl.CreatePort)
        CallbackFree(this.vtbl.EnumMasterClock)
        CallbackFree(this.vtbl.GetMasterClock)
        CallbackFree(this.vtbl.SetMasterClock)
        CallbackFree(this.vtbl.Activate)
        CallbackFree(this.vtbl.GetDefaultPort)
        CallbackFree(this.vtbl.SetDirectSound)
    }
}

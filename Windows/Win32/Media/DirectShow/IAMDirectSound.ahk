#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\Audio\DirectSound\IDirectSound.ahk" { IDirectSound }
#Import "..\Audio\DirectSound\IDirectSoundBuffer.ahk" { IDirectSoundBuffer }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAMDirectSound interface specifies which window has focus for controlling DirectSound audio playback.
 * @see https://learn.microsoft.com/windows/win32/api/amaudio/nn-amaudio-iamdirectsound
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMDirectSound extends IUnknown {
    /**
     * The interface identifier for IAMDirectSound
     * @type {Guid}
     */
    static IID := Guid("{546f4260-d53e-11cf-b3f0-00aa003761c5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMDirectSound interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDirectSoundInterface         : IntPtr
        GetPrimaryBufferInterface       : IntPtr
        GetSecondaryBufferInterface     : IntPtr
        ReleaseDirectSoundInterface     : IntPtr
        ReleasePrimaryBufferInterface   : IntPtr
        ReleaseSecondaryBufferInterface : IntPtr
        SetFocusWindow                  : IntPtr
        GetFocusWindow                  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMDirectSound.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetDirectSoundInterface method is not implemented.
     * @returns {IDirectSound} 
     * @see https://learn.microsoft.com/windows/win32/api/amaudio/nf-amaudio-iamdirectsound-getdirectsoundinterface
     */
    GetDirectSoundInterface() {
        result := ComCall(3, this, "ptr*", &lplpds := 0, "HRESULT")
        return IDirectSound(lplpds)
    }

    /**
     * The GetPrimaryBufferInterface method is not implemented.
     * @returns {IDirectSoundBuffer} 
     * @see https://learn.microsoft.com/windows/win32/api/amaudio/nf-amaudio-iamdirectsound-getprimarybufferinterface
     */
    GetPrimaryBufferInterface() {
        result := ComCall(4, this, "ptr*", &lplpdsb := 0, "HRESULT")
        return IDirectSoundBuffer(lplpdsb)
    }

    /**
     * The GetSecondaryBufferInterface method is not implemented.
     * @returns {IDirectSoundBuffer} 
     * @see https://learn.microsoft.com/windows/win32/api/amaudio/nf-amaudio-iamdirectsound-getsecondarybufferinterface
     */
    GetSecondaryBufferInterface() {
        result := ComCall(5, this, "ptr*", &lplpdsb := 0, "HRESULT")
        return IDirectSoundBuffer(lplpdsb)
    }

    /**
     * The ReleaseDirectSoundInterface method is not implemented.
     * @param {IDirectSound} lpds 
     * @returns {HRESULT} Returns E_NOTIMPL.
     * @see https://learn.microsoft.com/windows/win32/api/amaudio/nf-amaudio-iamdirectsound-releasedirectsoundinterface
     */
    ReleaseDirectSoundInterface(lpds) {
        result := ComCall(6, this, "ptr", lpds, "HRESULT")
        return result
    }

    /**
     * The ReleasePrimaryBufferInterface method is not implemented.
     * @param {IDirectSoundBuffer} lpdsb 
     * @returns {HRESULT} Returns E_NOTIMPL.
     * @see https://learn.microsoft.com/windows/win32/api/amaudio/nf-amaudio-iamdirectsound-releaseprimarybufferinterface
     */
    ReleasePrimaryBufferInterface(lpdsb) {
        result := ComCall(7, this, "ptr", lpdsb, "HRESULT")
        return result
    }

    /**
     * The ReleaseSecondaryBufferInterface method is not implemented.
     * @param {IDirectSoundBuffer} lpdsb 
     * @returns {HRESULT} Returns E_NOTIMPL.
     * @see https://learn.microsoft.com/windows/win32/api/amaudio/nf-amaudio-iamdirectsound-releasesecondarybufferinterface
     */
    ReleaseSecondaryBufferInterface(lpdsb) {
        result := ComCall(8, this, "ptr", lpdsb, "HRESULT")
        return result
    }

    /**
     * The SetFocusWindow method specifies a window to handle sound playback.
     * @param {HWND} param0 
     * @param {BOOL} param1 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/amaudio/nf-amaudio-iamdirectsound-setfocuswindow
     */
    SetFocusWindow(param0, param1) {
        result := ComCall(9, this, HWND, param0, BOOL, param1, "HRESULT")
        return result
    }

    /**
     * The GetFocusWindow method retrieves the window that is handling sound playback.
     * @param {Pointer<HWND>} param0 
     * @param {Pointer<BOOL>} param1 
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/amaudio/nf-amaudio-iamdirectsound-getfocuswindow
     */
    GetFocusWindow(param0, param1) {
        param1Marshal := param1 is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, HWND.Ptr, param0, param1Marshal, param1, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMDirectSound.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDirectSoundInterface := CallbackCreate(GetMethod(implObj, "GetDirectSoundInterface"), flags, 2)
        this.vtbl.GetPrimaryBufferInterface := CallbackCreate(GetMethod(implObj, "GetPrimaryBufferInterface"), flags, 2)
        this.vtbl.GetSecondaryBufferInterface := CallbackCreate(GetMethod(implObj, "GetSecondaryBufferInterface"), flags, 2)
        this.vtbl.ReleaseDirectSoundInterface := CallbackCreate(GetMethod(implObj, "ReleaseDirectSoundInterface"), flags, 2)
        this.vtbl.ReleasePrimaryBufferInterface := CallbackCreate(GetMethod(implObj, "ReleasePrimaryBufferInterface"), flags, 2)
        this.vtbl.ReleaseSecondaryBufferInterface := CallbackCreate(GetMethod(implObj, "ReleaseSecondaryBufferInterface"), flags, 2)
        this.vtbl.SetFocusWindow := CallbackCreate(GetMethod(implObj, "SetFocusWindow"), flags, 3)
        this.vtbl.GetFocusWindow := CallbackCreate(GetMethod(implObj, "GetFocusWindow"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDirectSoundInterface)
        CallbackFree(this.vtbl.GetPrimaryBufferInterface)
        CallbackFree(this.vtbl.GetSecondaryBufferInterface)
        CallbackFree(this.vtbl.ReleaseDirectSoundInterface)
        CallbackFree(this.vtbl.ReleasePrimaryBufferInterface)
        CallbackFree(this.vtbl.ReleaseSecondaryBufferInterface)
        CallbackFree(this.vtbl.SetFocusWindow)
        CallbackFree(this.vtbl.GetFocusWindow)
    }
}

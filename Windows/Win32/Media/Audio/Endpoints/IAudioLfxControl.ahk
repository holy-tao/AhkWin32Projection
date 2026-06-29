#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAudioLfxControl interface allows the client to apply or remove local effects from the offloaded audio stream.
 * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nn-audioengineendpoint-iaudiolfxcontrol
 * @namespace Windows.Win32.Media.Audio.Endpoints
 */
export default struct IAudioLfxControl extends IUnknown {
    /**
     * The interface identifier for IAudioLfxControl
     * @type {Guid}
     */
    static IID := Guid("{076a6922-d802-4f83-baf6-409d9ca11bfe}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioLfxControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetLocalEffectsState : IntPtr
        GetLocalEffectsState : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioLfxControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetLocalEffectsState method sets the local effects state that is to be applied to the offloaded audio stream.
     * @param {BOOL} bEnabled Indicates the local effects state that is to be applied to the offloaded audio stream. A value of <b>TRUE</b> enables  local effects, and the local effects in the audio graph are applied to the stream. A value of <b>FALSE</b> disables local effects, so that the  local effects in the audio graph are not applied to the audio stream.
     * @returns {HRESULT} The <b>SetLocalEffectsState</b> method returns <b>S_OK</b> to indicate that it has completed successfully. Otherwise it returns an appropriate error code.
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudiolfxcontrol-setlocaleffectsstate
     */
    SetLocalEffectsState(bEnabled) {
        result := ComCall(3, this, BOOL, bEnabled, "HRESULT")
        return result
    }

    /**
     * The GetLocalEffectsState method retrieves the local effects state that is currently applied to the offloaded audio stream.
     * @returns {BOOL} A pointer to the Boolean variable that indicates the state of the local effects that have been applied to the offloaded audio stream. A value of <b>TRUE</b> indicates that local effects have been enabled and applied to the stream. A value of <b>FALSE</b> indicates that local effects have been disabled.
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudiolfxcontrol-getlocaleffectsstate
     */
    GetLocalEffectsState() {
        result := ComCall(4, this, BOOL.Ptr, &pbEnabled := 0, "HRESULT")
        return pbEnabled
    }

    Query(iid) {
        if (IAudioLfxControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetLocalEffectsState := CallbackCreate(GetMethod(implObj, "SetLocalEffectsState"), flags, 2)
        this.vtbl.GetLocalEffectsState := CallbackCreate(GetMethod(implObj, "GetLocalEffectsState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetLocalEffectsState)
        CallbackFree(this.vtbl.GetLocalEffectsState)
    }
}

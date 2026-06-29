#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAudioEndpointOffloadStreamMute interface allows a client to manipulate the mute status of the offloaded audio stream.
 * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nn-audioengineendpoint-iaudioendpointoffloadstreammute
 * @namespace Windows.Win32.Media.Audio.Endpoints
 */
export default struct IAudioEndpointOffloadStreamMute extends IUnknown {
    /**
     * The interface identifier for IAudioEndpointOffloadStreamMute
     * @type {Guid}
     */
    static IID := Guid("{dfe21355-5ec2-40e0-8d6b-710ac3c00249}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioEndpointOffloadStreamMute interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetMute : IntPtr
        GetMute : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioEndpointOffloadStreamMute.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetMute method sets the mute status of the offloaded audio stream.
     * @param {Integer} bMuted Indicates whether or not the offloaded audio stream is to be muted. A value of <b>TRUE</b> mutes the stream, and a value of <b>FALSE</b> sets the stream to a non-muted state.
     * @returns {HRESULT} The <b>SetMute</b> method returns <b>S_OK</b> to indicate that it has completed successfully. Otherwise it returns an appropriate error code.
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpointoffloadstreammute-setmute
     */
    SetMute(bMuted) {
        result := ComCall(3, this, "char", bMuted, "HRESULT")
        return result
    }

    /**
     * The GetMute method retrieves the mute status of the offloaded audio stream.
     * @returns {Integer} Indicates whether or not the offloaded audio stream is muted. A value of <b>TRUE</b> indicates that the stream is muted, and a value of <b>FALSE</b> indicates that the stream is not muted.
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpointoffloadstreammute-getmute
     */
    GetMute() {
        result := ComCall(4, this, "char*", &pbMuted := 0, "HRESULT")
        return pbMuted
    }

    Query(iid) {
        if (IAudioEndpointOffloadStreamMute.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetMute := CallbackCreate(GetMethod(implObj, "SetMute"), flags, 2)
        this.vtbl.GetMute := CallbackCreate(GetMethod(implObj, "GetMute"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetMute)
        CallbackFree(this.vtbl.GetMute)
    }
}

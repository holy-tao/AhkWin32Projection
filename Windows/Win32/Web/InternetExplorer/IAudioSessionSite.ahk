#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IAudioSessionSite extends IUnknown {
    /**
     * The interface identifier for IAudioSessionSite
     * @type {Guid}
     */
    static IID := Guid("{d7d8b684-d02d-4517-b6b7-19e3dfe29c45}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioSessionSite interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetAudioSessionGuid    : IntPtr
        OnAudioStreamCreated   : IntPtr
        OnAudioStreamDestroyed : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioSessionSite.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Guid} 
     */
    GetAudioSessionGuid() {
        audioSessionGuid := Guid()
        result := ComCall(3, this, Guid.Ptr, audioSessionGuid, "HRESULT")
        return audioSessionGuid
    }

    /**
     * 
     * @param {PWSTR} endpointID 
     * @returns {HRESULT} 
     */
    OnAudioStreamCreated(endpointID) {
        endpointID := endpointID is String ? StrPtr(endpointID) : endpointID

        result := ComCall(4, this, "ptr", endpointID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} endpointID 
     * @returns {HRESULT} 
     */
    OnAudioStreamDestroyed(endpointID) {
        endpointID := endpointID is String ? StrPtr(endpointID) : endpointID

        result := ComCall(5, this, "ptr", endpointID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAudioSessionSite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAudioSessionGuid := CallbackCreate(GetMethod(implObj, "GetAudioSessionGuid"), flags, 2)
        this.vtbl.OnAudioStreamCreated := CallbackCreate(GetMethod(implObj, "OnAudioStreamCreated"), flags, 2)
        this.vtbl.OnAudioStreamDestroyed := CallbackCreate(GetMethod(implObj, "OnAudioStreamDestroyed"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAudioSessionGuid)
        CallbackFree(this.vtbl.OnAudioStreamCreated)
        CallbackFree(this.vtbl.OnAudioStreamDestroyed)
    }
}

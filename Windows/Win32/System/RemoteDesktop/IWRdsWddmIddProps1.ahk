#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWRdsWddmIddProps1 extends IUnknown {
    /**
     * The interface identifier for IWRdsWddmIddProps1
     * @type {Guid}
     */
    static IID := Guid("{60f71b1a-3682-4bc7-997e-4e4f02a08148}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWRdsWddmIddProps1 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetHardwareId  : IntPtr
        OnDriverLoad   : IntPtr
        OnDriverUnload : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWRdsWddmIddProps1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pDisplayDriverHardwareId 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     */
    GetHardwareId(pDisplayDriverHardwareId, Count) {
        pDisplayDriverHardwareId := pDisplayDriverHardwareId is String ? StrPtr(pDisplayDriverHardwareId) : pDisplayDriverHardwareId

        result := ComCall(3, this, "ptr", pDisplayDriverHardwareId, "uint", Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SessionId 
     * @param {PWSTR} DeviceInstance 
     * @returns {HRESULT} 
     */
    OnDriverLoad(SessionId, DeviceInstance) {
        DeviceInstance := DeviceInstance is String ? StrPtr(DeviceInstance) : DeviceInstance

        result := ComCall(4, this, "uint", SessionId, "ptr", DeviceInstance, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SessionId 
     * @returns {HRESULT} 
     */
    OnDriverUnload(SessionId) {
        result := ComCall(5, this, "uint", SessionId, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWRdsWddmIddProps1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetHardwareId := CallbackCreate(GetMethod(implObj, "GetHardwareId"), flags, 3)
        this.vtbl.OnDriverLoad := CallbackCreate(GetMethod(implObj, "OnDriverLoad"), flags, 3)
        this.vtbl.OnDriverUnload := CallbackCreate(GetMethod(implObj, "OnDriverUnload"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetHardwareId)
        CallbackFree(this.vtbl.OnDriverLoad)
        CallbackFree(this.vtbl.OnDriverUnload)
    }
}

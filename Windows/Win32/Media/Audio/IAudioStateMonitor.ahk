#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\AudioStateMonitorSoundLevel.ahk" { AudioStateMonitorSoundLevel }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Audio
 */
export default struct IAudioStateMonitor extends IUnknown {
    /**
     * The interface identifier for IAudioStateMonitor
     * @type {Guid}
     */
    static IID := Guid("{63bd8738-e30d-4c77-bf5c-834e87c657e2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioStateMonitor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RegisterCallback   : IntPtr
        UnregisterCallback : IntPtr
        GetSoundLevel      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioStateMonitor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<PAudioStateMonitorCallback>} callback 
     * @param {Pointer<Void>} _context 
     * @returns {Integer} 
     */
    RegisterCallback(callback, _context) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", callback, _contextMarshal, _context, "int64*", &registration := 0, "HRESULT")
        return registration
    }

    /**
     * 
     * @param {Integer} registration 
     * @returns {String} Nothing - always returns an empty string
     */
    UnregisterCallback(registration) {
        ComCall(4, this, "int64", registration)
    }

    /**
     * 
     * @returns {AudioStateMonitorSoundLevel} 
     */
    GetSoundLevel() {
        result := ComCall(5, this, AudioStateMonitorSoundLevel)
        return result
    }

    Query(iid) {
        if (IAudioStateMonitor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterCallback := CallbackCreate(GetMethod(implObj, "RegisterCallback"), flags, 4)
        this.vtbl.UnregisterCallback := CallbackCreate(GetMethod(implObj, "UnregisterCallback"), flags, 2)
        this.vtbl.GetSoundLevel := CallbackCreate(GetMethod(implObj, "GetSoundLevel"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterCallback)
        CallbackFree(this.vtbl.UnregisterCallback)
        CallbackFree(this.vtbl.GetSoundLevel)
    }
}

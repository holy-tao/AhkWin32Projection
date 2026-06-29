#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IActiveScriptProfilerControl extends IUnknown {
    /**
     * The interface identifier for IActiveScriptProfilerControl
     * @type {Guid}
     */
    static IID := Guid("{784b5ff0-69b0-47d1-a7dc-2518f4230e90}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveScriptProfilerControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        StartProfiling       : IntPtr
        SetProfilerEventMask : IntPtr
        StopProfiling        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveScriptProfilerControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Guid>} clsidProfilerObject 
     * @param {Integer} dwEventMask 
     * @param {Integer} dwContext 
     * @returns {HRESULT} 
     */
    StartProfiling(clsidProfilerObject, dwEventMask, dwContext) {
        result := ComCall(3, this, Guid.Ptr, clsidProfilerObject, "uint", dwEventMask, "uint", dwContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwEventMask 
     * @returns {HRESULT} 
     */
    SetProfilerEventMask(dwEventMask) {
        result := ComCall(4, this, "uint", dwEventMask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hrShutdownReason 
     * @returns {HRESULT} 
     */
    StopProfiling(hrShutdownReason) {
        result := ComCall(5, this, "int", hrShutdownReason, "HRESULT")
        return result
    }

    Query(iid) {
        if (IActiveScriptProfilerControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StartProfiling := CallbackCreate(GetMethod(implObj, "StartProfiling"), flags, 4)
        this.vtbl.SetProfilerEventMask := CallbackCreate(GetMethod(implObj, "SetProfilerEventMask"), flags, 2)
        this.vtbl.StopProfiling := CallbackCreate(GetMethod(implObj, "StopProfiling"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StartProfiling)
        CallbackFree(this.vtbl.SetProfilerEventMask)
        CallbackFree(this.vtbl.StopProfiling)
    }
}

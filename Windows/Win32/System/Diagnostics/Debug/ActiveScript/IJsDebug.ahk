#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IJsDebugProcess.ahk" { IJsDebugProcess }
#Import ".\IJsDebugDataTarget.ahk" { IJsDebugDataTarget }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IJsDebug extends IUnknown {
    /**
     * The interface identifier for IJsDebug
     * @type {Guid}
     */
    static IID := Guid("{be0e89da-2ac5-4c04-ac5e-59956aae3613}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IJsDebug interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OpenVirtualProcess : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IJsDebug.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} processId 
     * @param {Integer} runtimeJsBaseAddress 
     * @param {IJsDebugDataTarget} pDataTarget 
     * @returns {IJsDebugProcess} 
     */
    OpenVirtualProcess(processId, runtimeJsBaseAddress, pDataTarget) {
        result := ComCall(3, this, "uint", processId, "uint", runtimeJsBaseAddress, "ptr", pDataTarget, "ptr*", &ppProcess := 0, "HRESULT")
        return IJsDebugProcess(ppProcess)
    }

    Query(iid) {
        if (IJsDebug.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OpenVirtualProcess := CallbackCreate(GetMethod(implObj, "OpenVirtualProcess"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OpenVirtualProcess)
    }
}

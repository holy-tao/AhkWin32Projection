#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISvcProcess.ahk" { ISvcProcess }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISvcThread.ahk" { ISvcThread }
#Import ".\IDebugServiceManager.ahk" { IDebugServiceManager }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostContextTargetComposition extends IUnknown {
    /**
     * The interface identifier for IDebugHostContextTargetComposition
     * @type {Guid}
     */
    static IID := Guid("{3d06878f-97ab-4c5b-955e-fa647d3b137c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostContextTargetComposition interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetServiceManager : IntPtr
        GetServiceProcess : IntPtr
        GetServiceThread  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostContextTargetComposition.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Pointer<IDebugServiceManager>} 
     */
    GetServiceManager() {
        result := ComCall(3, this, "ptr*", &ppServiceManager := 0, "HRESULT")
        return ppServiceManager
    }

    /**
     * 
     * @returns {Pointer<ISvcProcess>} 
     */
    GetServiceProcess() {
        result := ComCall(4, this, "ptr*", &ppProcess := 0, "HRESULT")
        return ppProcess
    }

    /**
     * 
     * @returns {Pointer<ISvcThread>} 
     */
    GetServiceThread() {
        result := ComCall(5, this, "ptr*", &ppThread := 0, "HRESULT")
        return ppThread
    }

    Query(iid) {
        if (IDebugHostContextTargetComposition.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetServiceManager := CallbackCreate(GetMethod(implObj, "GetServiceManager"), flags, 2)
        this.vtbl.GetServiceProcess := CallbackCreate(GetMethod(implObj, "GetServiceProcess"), flags, 2)
        this.vtbl.GetServiceThread := CallbackCreate(GetMethod(implObj, "GetServiceThread"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetServiceManager)
        CallbackFree(this.vtbl.GetServiceProcess)
        CallbackFree(this.vtbl.GetServiceThread)
    }
}

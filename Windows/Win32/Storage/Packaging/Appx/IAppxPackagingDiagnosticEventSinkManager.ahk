#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAppxPackagingDiagnosticEventSink.ahk" { IAppxPackagingDiagnosticEventSink }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxPackagingDiagnosticEventSinkManager extends IUnknown {
    /**
     * The interface identifier for IAppxPackagingDiagnosticEventSinkManager
     * @type {Guid}
     */
    static IID := Guid("{369648fa-a7eb-4909-a15d-6954a078f18a}")

    /**
     * The class identifier for AppxPackagingDiagnosticEventSinkManager
     * @type {Guid}
     */
    static CLSID := Guid("{50ca0a46-1588-4161-8ed2-ef9e469ced5d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxPackagingDiagnosticEventSinkManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetSinkForProcess : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxPackagingDiagnosticEventSinkManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IAppxPackagingDiagnosticEventSink} sink 
     * @returns {HRESULT} 
     */
    SetSinkForProcess(sink) {
        result := ComCall(3, this, "ptr", sink, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAppxPackagingDiagnosticEventSinkManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetSinkForProcess := CallbackCreate(GetMethod(implObj, "SetSinkForProcess"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetSinkForProcess)
    }
}

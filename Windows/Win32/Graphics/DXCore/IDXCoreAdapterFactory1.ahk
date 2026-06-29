#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DXCoreRuntimeFilterFlags.ahk" { DXCoreRuntimeFilterFlags }
#Import ".\DXCoreHardwareTypeFilterFlags.ahk" { DXCoreHardwareTypeFilterFlags }
#Import ".\IDXCoreAdapterFactory.ahk" { IDXCoreAdapterFactory }
#Import ".\DXCoreWorkload.ahk" { DXCoreWorkload }

/**
 * @namespace Windows.Win32.Graphics.DXCore
 */
export default struct IDXCoreAdapterFactory1 extends IDXCoreAdapterFactory {
    /**
     * The interface identifier for IDXCoreAdapterFactory1
     * @type {Guid}
     */
    static IID := Guid("{d5682e19-6d21-401c-827a-9a51a4ea35d7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDXCoreAdapterFactory1 interfaces
    */
    struct Vtbl extends IDXCoreAdapterFactory.Vtbl {
        CreateAdapterListByWorkload : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDXCoreAdapterFactory1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {DXCoreWorkload} workload 
     * @param {DXCoreRuntimeFilterFlags} runtimeFilter 
     * @param {DXCoreHardwareTypeFilterFlags} hardwareTypeFilter 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CreateAdapterListByWorkload(workload, runtimeFilter, hardwareTypeFilter, riid) {
        result := ComCall(8, this, DXCoreWorkload, workload, DXCoreRuntimeFilterFlags, runtimeFilter, DXCoreHardwareTypeFilterFlags, hardwareTypeFilter, Guid.Ptr, riid, "ptr*", &ppvAdapterList := 0, "HRESULT")
        return ppvAdapterList
    }

    Query(iid) {
        if (IDXCoreAdapterFactory1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateAdapterListByWorkload := CallbackCreate(GetMethod(implObj, "CreateAdapterListByWorkload"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateAdapterListByWorkload)
    }
}

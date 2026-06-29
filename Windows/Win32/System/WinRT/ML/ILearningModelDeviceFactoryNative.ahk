#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Graphics\Direct3D12\ID3D12CommandQueue.ahk" { ID3D12CommandQueue }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WinRT.ML
 */
export default struct ILearningModelDeviceFactoryNative extends IUnknown {
    /**
     * The interface identifier for ILearningModelDeviceFactoryNative
     * @type {Guid}
     */
    static IID := Guid("{1e9b31a1-662e-4ae0-af67-f63bb337e634}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILearningModelDeviceFactoryNative interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateFromD3D12CommandQueue : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILearningModelDeviceFactoryNative.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {ID3D12CommandQueue} value 
     * @returns {IUnknown} 
     */
    CreateFromD3D12CommandQueue(value) {
        result := ComCall(3, this, "ptr", value, "ptr*", &result := 0, "HRESULT")
        return IUnknown(result)
    }

    Query(iid) {
        if (ILearningModelDeviceFactoryNative.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateFromD3D12CommandQueue := CallbackCreate(GetMethod(implObj, "CreateFromD3D12CommandQueue"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateFromD3D12CommandQueue)
    }
}

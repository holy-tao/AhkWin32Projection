#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DXCoreAdapterProperty.ahk" { DXCoreAdapterProperty }
#Import ".\IDXCoreAdapter.ahk" { IDXCoreAdapter }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.DXCore
 */
export default struct IDXCoreAdapter1 extends IDXCoreAdapter {
    /**
     * The interface identifier for IDXCoreAdapter1
     * @type {Guid}
     */
    static IID := Guid("{a0783366-cfa3-43be-9d79-55b2da97c63c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDXCoreAdapter1 interfaces
    */
    struct Vtbl extends IDXCoreAdapter.Vtbl {
        GetPropertyWithInput : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDXCoreAdapter1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {DXCoreAdapterProperty} _property 
     * @param {Pointer} inputPropertyDetailsSize 
     * @param {Integer} inputPropertyDetails 
     * @param {Pointer} outputBufferSize 
     * @param {Integer} outputBuffer 
     * @returns {HRESULT} 
     */
    GetPropertyWithInput(_property, inputPropertyDetailsSize, inputPropertyDetails, outputBufferSize, outputBuffer) {
        result := ComCall(13, this, DXCoreAdapterProperty, _property, "ptr", inputPropertyDetailsSize, "ptr", inputPropertyDetails, "ptr", outputBufferSize, "ptr", outputBuffer, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDXCoreAdapter1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPropertyWithInput := CallbackCreate(GetMethod(implObj, "GetPropertyWithInput"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPropertyWithInput)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D12Device.ahk" { ID3D12Device }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12DSRDeviceFactory extends IUnknown {
    /**
     * The interface identifier for ID3D12DSRDeviceFactory
     * @type {Guid}
     */
    static IID := Guid("{f343d1a0-afe3-439f-b13d-cd87a43b70ca}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12DSRDeviceFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateDSRDevice : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12DSRDeviceFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {ID3D12Device} pD3D12Device 
     * @param {Integer} NodeMask 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CreateDSRDevice(pD3D12Device, NodeMask, riid) {
        result := ComCall(3, this, "ptr", pD3D12Device, "uint", NodeMask, Guid.Ptr, riid, "ptr*", &ppvDSRDevice := 0, "HRESULT")
        return ppvDSRDevice
    }

    Query(iid) {
        if (ID3D12DSRDeviceFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateDSRDevice := CallbackCreate(GetMethod(implObj, "CreateDSRDevice"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateDSRDevice)
    }
}

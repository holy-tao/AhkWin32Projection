#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12Object.ahk" { ID3D12Object }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * An interface from which other core interfaces inherit from, including (but not limited to) ID3D12PipelineLibrary, ID3D12CommandList, ID3D12Pageable, and ID3D12RootSignature. It provides a method to get back to the device object it was created against.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12devicechild
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12DeviceChild extends ID3D12Object {
    /**
     * The interface identifier for ID3D12DeviceChild
     * @type {Guid}
     */
    static IID := Guid("{905db94b-a00c-4140-9df5-2b64ca9ea357}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12DeviceChild interfaces
    */
    struct Vtbl extends ID3D12Object.Vtbl {
        GetDevice : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12DeviceChild.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a pointer to the device that created this interface.
     * @remarks
     * Any returned interfaces have their reference count incremented by one, so be sure to call ::release() on the returned pointers before they are freed or else you will have a memory leak.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The globally unique identifier (<b>GUID</b>) for the device interface.
     *             The <b>REFIID</b>, or <b>GUID</b>, of the interface to the device can be obtained by using the __uuidof() macro.
     *             For example, __uuidof(<a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12device">ID3D12Device</a>) will get the <b>GUID</b> of the interface to a device.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12device">ID3D12Device</a> interface for the device.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12devicechild-getdevice
     */
    GetDevice(riid) {
        result := ComCall(7, this, Guid.Ptr, riid, "ptr*", &ppvDevice := 0, "HRESULT")
        return ppvDevice
    }

    Query(iid) {
        if (ID3D12DeviceChild.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDevice := CallbackCreate(GetMethod(implObj, "GetDevice"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDevice)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12Fence.ahk" { ID3D12Fence }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ID3D12DeviceChild.ahk" { ID3D12DeviceChild }

/**
 * TBD
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12virtualizationguestdevice
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12VirtualizationGuestDevice extends IUnknown {
    /**
     * The interface identifier for ID3D12VirtualizationGuestDevice
     * @type {Guid}
     */
    static IID := Guid("{bc66d368-7373-4943-8757-fc87dc79e476}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12VirtualizationGuestDevice interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ShareWithHost : IntPtr
        CreateFenceFd : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12VirtualizationGuestDevice.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * TBD
     * @param {ID3D12DeviceChild} pObject 
     * @returns {HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12virtualizationguestdevice-sharewithhost
     */
    ShareWithHost(pObject) {
        pHandle := HANDLE.Owned()
        result := ComCall(3, this, "ptr", pObject, HANDLE.Ptr, pHandle, "HRESULT")
        return pHandle
    }

    /**
     * TBD
     * @param {ID3D12Fence} pFence 
     * @param {Integer} FenceValue 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12virtualizationguestdevice-createfencefd
     */
    CreateFenceFd(pFence, FenceValue) {
        result := ComCall(4, this, "ptr", pFence, "uint", FenceValue, "int*", &pFenceFd := 0, "HRESULT")
        return pFenceFd
    }

    Query(iid) {
        if (ID3D12VirtualizationGuestDevice.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ShareWithHost := CallbackCreate(GetMethod(implObj, "ShareWithHost"), flags, 3)
        this.vtbl.CreateFenceFd := CallbackCreate(GetMethod(implObj, "CreateFenceFd"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ShareWithHost)
        CallbackFree(this.vtbl.CreateFenceFd)
    }
}

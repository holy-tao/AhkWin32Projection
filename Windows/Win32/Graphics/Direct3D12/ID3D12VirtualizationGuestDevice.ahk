#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12virtualizationguestdevice
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12VirtualizationGuestDevice extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12VirtualizationGuestDevice
     * @type {Guid}
     */
    static IID => Guid("{bc66d368-7373-4943-8757-fc87dc79e476}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShareWithHost", "CreateFenceFd"]

    /**
     * 
     * @param {ID3D12DeviceChild} pObject 
     * @param {Pointer<HANDLE>} pHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12virtualizationguestdevice-sharewithhost
     */
    ShareWithHost(pObject, pHandle) {
        result := ComCall(3, this, "ptr", pObject, "ptr", pHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D12Fence} pFence 
     * @param {Integer} FenceValue 
     * @param {Pointer<Integer>} pFenceFd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12virtualizationguestdevice-createfencefd
     */
    CreateFenceFd(pFence, FenceValue, pFenceFd) {
        pFenceFdMarshal := pFenceFd is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pFence, "uint", FenceValue, pFenceFdMarshal, pFenceFd, "HRESULT")
        return result
    }
}

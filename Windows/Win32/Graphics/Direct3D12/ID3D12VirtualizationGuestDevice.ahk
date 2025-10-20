#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12VirtualizationGuestDevice extends IUnknown{
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
     * 
     * @param {Pointer<ID3D12DeviceChild>} pObject 
     * @param {Pointer<HANDLE>} pHandle 
     * @returns {HRESULT} 
     */
    ShareWithHost(pObject, pHandle) {
        result := ComCall(3, this, "ptr", pObject, "ptr", pHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Fence>} pFence 
     * @param {Integer} FenceValue 
     * @param {Pointer<Int32>} pFenceFd 
     * @returns {HRESULT} 
     */
    CreateFenceFd(pFence, FenceValue, pFenceFd) {
        result := ComCall(4, this, "ptr", pFence, "uint", FenceValue, "int*", pFenceFd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

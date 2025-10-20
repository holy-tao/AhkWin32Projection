#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12PageableTools extends IUnknown{
    /**
     * The interface identifier for ID3D12PageableTools
     * @type {Guid}
     */
    static IID => Guid("{8f1359db-d8d1-42f9-b5cf-79f4cbad0d3d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<D3D12_GPU_VIRTUAL_ADDRESS_RANGE>} pAllocation 
     * @returns {HRESULT} 
     */
    GetAllocation(pAllocation) {
        result := ComCall(3, this, "ptr", pAllocation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

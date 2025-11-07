#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D12_GPU_VIRTUAL_ADDRESS_RANGE.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12PageableTools extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAllocation"]

    /**
     * 
     * @returns {D3D12_GPU_VIRTUAL_ADDRESS_RANGE} 
     */
    GetAllocation() {
        pAllocation := D3D12_GPU_VIRTUAL_ADDRESS_RANGE()
        result := ComCall(3, this, "ptr", pAllocation, "HRESULT")
        return pAllocation
    }
}

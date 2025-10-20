#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Tools.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Tools1 extends ID3D12Tools{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Tools1
     * @type {Guid}
     */
    static IID => Guid("{e4fbc019-dd3c-43e1-8f32-7f649575f0a0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReserveGPUVARangesAtCreate", "ClearReservedGPUVARangesList"]

    /**
     * 
     * @param {Pointer<D3D12_GPU_VIRTUAL_ADDRESS_RANGE>} pRanges 
     * @param {Integer} uiNumRanges 
     * @returns {HRESULT} 
     */
    ReserveGPUVARangesAtCreate(pRanges, uiNumRanges) {
        result := ComCall(5, this, "ptr", pRanges, "uint", uiNumRanges, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    ClearReservedGPUVARangesList() {
        ComCall(6, this)
    }
}

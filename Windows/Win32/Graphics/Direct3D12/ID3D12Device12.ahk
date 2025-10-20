#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Device11.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Device12 extends ID3D12Device11{
    /**
     * The interface identifier for ID3D12Device12
     * @type {Guid}
     */
    static IID => Guid("{5af5c532-4c91-4cd0-b541-15a405395fc5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 80

    /**
     * 
     * @param {Integer} visibleMask 
     * @param {Integer} numResourceDescs 
     * @param {Pointer<D3D12_RESOURCE_DESC1>} pResourceDescs 
     * @param {Pointer<UInt32>} pNumCastableFormats 
     * @param {Pointer<Int32>} ppCastableFormats 
     * @param {Pointer<D3D12_RESOURCE_ALLOCATION_INFO1>} pResourceAllocationInfo1 
     * @returns {D3D12_RESOURCE_ALLOCATION_INFO} 
     */
    GetResourceAllocationInfo3(visibleMask, numResourceDescs, pResourceDescs, pNumCastableFormats, ppCastableFormats, pResourceAllocationInfo1) {
        result := ComCall(80, this, "uint", visibleMask, "uint", numResourceDescs, "ptr", pResourceDescs, "uint*", pNumCastableFormats, "int*", ppCastableFormats, "ptr", pResourceAllocationInfo1, "ptr")
        return result
    }
}

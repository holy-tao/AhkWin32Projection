#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12GraphicsCommandList6.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12GraphicsCommandList7 extends ID3D12GraphicsCommandList6{
    /**
     * The interface identifier for ID3D12GraphicsCommandList7
     * @type {Guid}
     */
    static IID => Guid("{dd171223-8b61-4769-90e3-160ccde4e2c1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 80

    /**
     * 
     * @param {Integer} NumBarrierGroups 
     * @param {Pointer<D3D12_BARRIER_GROUP>} pBarrierGroups 
     * @returns {String} Nothing - always returns an empty string
     */
    Barrier(NumBarrierGroups, pBarrierGroups) {
        ComCall(80, this, "uint", NumBarrierGroups, "ptr", pBarrierGroups)
        return result
    }
}

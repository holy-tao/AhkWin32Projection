#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12GraphicsCommandList8.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12GraphicsCommandList9 extends ID3D12GraphicsCommandList8{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12GraphicsCommandList9
     * @type {Guid}
     */
    static IID => Guid("{34ed2808-ffe6-4c2b-b11a-cabd2b0c59e1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 82

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RSSetDepthBias", "IASetIndexBufferStripCutValue"]

    /**
     * 
     * @param {Float} DepthBias 
     * @param {Float} DepthBiasClamp 
     * @param {Float} SlopeScaledDepthBias 
     * @returns {String} Nothing - always returns an empty string
     */
    RSSetDepthBias(DepthBias, DepthBiasClamp, SlopeScaledDepthBias) {
        ComCall(82, this, "float", DepthBias, "float", DepthBiasClamp, "float", SlopeScaledDepthBias)
    }

    /**
     * 
     * @param {Integer} IBStripCutValue 
     * @returns {String} Nothing - always returns an empty string
     */
    IASetIndexBufferStripCutValue(IBStripCutValue) {
        ComCall(83, this, "int", IBStripCutValue)
    }
}

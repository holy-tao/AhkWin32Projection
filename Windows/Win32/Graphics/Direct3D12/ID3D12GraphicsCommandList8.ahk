#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12GraphicsCommandList7.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12GraphicsCommandList8 extends ID3D12GraphicsCommandList7{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12GraphicsCommandList8
     * @type {Guid}
     */
    static IID => Guid("{ee936ef9-599d-4d28-938e-23c4ad05ce51}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 81

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OMSetFrontAndBackStencilRef"]

    /**
     * 
     * @param {Integer} FrontStencilRef 
     * @param {Integer} BackStencilRef 
     * @returns {String} Nothing - always returns an empty string
     */
    OMSetFrontAndBackStencilRef(FrontStencilRef, BackStencilRef) {
        ComCall(81, this, "uint", FrontStencilRef, "uint", BackStencilRef)
    }
}

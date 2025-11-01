#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12GraphicsCommandList4.ahk

/**
 * Encapsulates a list of graphics commands for rendering, extending the interface to support variable-rate shading (VRS).
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12graphicscommandlist5
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12GraphicsCommandList5 extends ID3D12GraphicsCommandList4{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12GraphicsCommandList5
     * @type {Guid}
     */
    static IID => Guid("{55050859-4024-474c-87f5-6472eaee44ea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 77

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RSSetShadingRate", "RSSetShadingRateImage"]

    /**
     * 
     * @param {Integer} baseShadingRate 
     * @param {Pointer<Integer>} combiners 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist5-rssetshadingrate
     */
    RSSetShadingRate(baseShadingRate, combiners) {
        combinersMarshal := combiners is VarRef ? "int*" : "ptr"

        ComCall(77, this, "int", baseShadingRate, combinersMarshal, combiners)
    }

    /**
     * 
     * @param {ID3D12Resource} shadingRateImage 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist5-rssetshadingrateimage
     */
    RSSetShadingRateImage(shadingRateImage) {
        ComCall(78, this, "ptr", shadingRateImage)
    }
}

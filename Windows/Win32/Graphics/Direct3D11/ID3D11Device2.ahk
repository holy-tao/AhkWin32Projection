#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11DeviceContext2.ahk
#Include .\ID3D11Device1.ahk

/**
 * The device interface represents a virtual adapter; it is used to create resources. ID3D11Device2 adds new methods to those in ID3D11Device1.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_2/nn-d3d11_2-id3d11device2
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11Device2 extends ID3D11Device1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11Device2
     * @type {Guid}
     */
    static IID => Guid("{9d06dffa-d1e5-4d07-83a8-1bb123f2f841}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 50

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetImmediateContext2", "CreateDeferredContext2", "GetResourceTiling", "CheckMultisampleQualityLevels1"]

    /**
     * 
     * @param {Pointer<ID3D11DeviceContext2>} ppImmediateContext 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_2/nf-d3d11_2-id3d11device2-getimmediatecontext2
     */
    GetImmediateContext2(ppImmediateContext) {
        ComCall(50, this, "ptr*", ppImmediateContext)
    }

    /**
     * 
     * @param {Integer} ContextFlags 
     * @returns {ID3D11DeviceContext2} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_2/nf-d3d11_2-id3d11device2-createdeferredcontext2
     */
    CreateDeferredContext2(ContextFlags) {
        result := ComCall(51, this, "uint", ContextFlags, "ptr*", &ppDeferredContext := 0, "HRESULT")
        return ID3D11DeviceContext2(ppDeferredContext)
    }

    /**
     * 
     * @param {ID3D11Resource} pTiledResource 
     * @param {Pointer<Integer>} pNumTilesForEntireResource 
     * @param {Pointer<D3D11_PACKED_MIP_DESC>} pPackedMipDesc 
     * @param {Pointer<D3D11_TILE_SHAPE>} pStandardTileShapeForNonPackedMips 
     * @param {Pointer<Integer>} pNumSubresourceTilings 
     * @param {Integer} FirstSubresourceTilingToGet 
     * @param {Pointer<D3D11_SUBRESOURCE_TILING>} pSubresourceTilingsForNonPackedMips 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_2/nf-d3d11_2-id3d11device2-getresourcetiling
     */
    GetResourceTiling(pTiledResource, pNumTilesForEntireResource, pPackedMipDesc, pStandardTileShapeForNonPackedMips, pNumSubresourceTilings, FirstSubresourceTilingToGet, pSubresourceTilingsForNonPackedMips) {
        pNumTilesForEntireResourceMarshal := pNumTilesForEntireResource is VarRef ? "uint*" : "ptr"
        pNumSubresourceTilingsMarshal := pNumSubresourceTilings is VarRef ? "uint*" : "ptr"

        ComCall(52, this, "ptr", pTiledResource, pNumTilesForEntireResourceMarshal, pNumTilesForEntireResource, "ptr", pPackedMipDesc, "ptr", pStandardTileShapeForNonPackedMips, pNumSubresourceTilingsMarshal, pNumSubresourceTilings, "uint", FirstSubresourceTilingToGet, "ptr", pSubresourceTilingsForNonPackedMips)
    }

    /**
     * 
     * @param {Integer} Format 
     * @param {Integer} SampleCount 
     * @param {Integer} Flags 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_2/nf-d3d11_2-id3d11device2-checkmultisamplequalitylevels1
     */
    CheckMultisampleQualityLevels1(Format, SampleCount, Flags) {
        result := ComCall(53, this, "int", Format, "uint", SampleCount, "uint", Flags, "uint*", &pNumQualityLevels := 0, "HRESULT")
        return pNumQualityLevels
    }
}

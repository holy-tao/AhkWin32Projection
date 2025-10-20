#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11Device1.ahk

/**
 * The device interface represents a virtual adapter; it is used to create resources. ID3D11Device2 adds new methods to those in ID3D11Device1.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_2/nn-d3d11_2-id3d11device2
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11Device2 extends ID3D11Device1{
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
     * 
     * @param {Pointer<ID3D11DeviceContext2>} ppImmediateContext 
     * @returns {String} Nothing - always returns an empty string
     */
    GetImmediateContext2(ppImmediateContext) {
        ComCall(50, this, "ptr", ppImmediateContext)
        return result
    }

    /**
     * 
     * @param {Integer} ContextFlags 
     * @param {Pointer<ID3D11DeviceContext2>} ppDeferredContext 
     * @returns {HRESULT} 
     */
    CreateDeferredContext2(ContextFlags, ppDeferredContext) {
        result := ComCall(51, this, "uint", ContextFlags, "ptr", ppDeferredContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Resource>} pTiledResource 
     * @param {Pointer<UInt32>} pNumTilesForEntireResource 
     * @param {Pointer<D3D11_PACKED_MIP_DESC>} pPackedMipDesc 
     * @param {Pointer<D3D11_TILE_SHAPE>} pStandardTileShapeForNonPackedMips 
     * @param {Pointer<UInt32>} pNumSubresourceTilings 
     * @param {Integer} FirstSubresourceTilingToGet 
     * @param {Pointer<D3D11_SUBRESOURCE_TILING>} pSubresourceTilingsForNonPackedMips 
     * @returns {String} Nothing - always returns an empty string
     */
    GetResourceTiling(pTiledResource, pNumTilesForEntireResource, pPackedMipDesc, pStandardTileShapeForNonPackedMips, pNumSubresourceTilings, FirstSubresourceTilingToGet, pSubresourceTilingsForNonPackedMips) {
        ComCall(52, this, "ptr", pTiledResource, "uint*", pNumTilesForEntireResource, "ptr", pPackedMipDesc, "ptr", pStandardTileShapeForNonPackedMips, "uint*", pNumSubresourceTilings, "uint", FirstSubresourceTilingToGet, "ptr", pSubresourceTilingsForNonPackedMips)
        return result
    }

    /**
     * 
     * @param {Integer} Format 
     * @param {Integer} SampleCount 
     * @param {Integer} Flags 
     * @param {Pointer<UInt32>} pNumQualityLevels 
     * @returns {HRESULT} 
     */
    CheckMultisampleQualityLevels1(Format, SampleCount, Flags, pNumQualityLevels) {
        result := ComCall(53, this, "int", Format, "uint", SampleCount, "uint", Flags, "uint*", pNumQualityLevels, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

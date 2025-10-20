#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11DeviceContext1.ahk

/**
 * The device context interface represents a device context; it is used to render commands. ID3D11DeviceContext2 adds new methods to those in ID3D11DeviceContext1.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_2/nn-d3d11_2-id3d11devicecontext2
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11DeviceContext2 extends ID3D11DeviceContext1{
    /**
     * The interface identifier for ID3D11DeviceContext2
     * @type {Guid}
     */
    static IID => Guid("{420d5b32-b90c-4da4-bef0-359f6a24a83a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 134

    /**
     * 
     * @param {Pointer<ID3D11Resource>} pTiledResource 
     * @param {Integer} NumTiledResourceRegions 
     * @param {Pointer<D3D11_TILED_RESOURCE_COORDINATE>} pTiledResourceRegionStartCoordinates 
     * @param {Pointer<D3D11_TILE_REGION_SIZE>} pTiledResourceRegionSizes 
     * @param {Pointer<ID3D11Buffer>} pTilePool 
     * @param {Integer} NumRanges 
     * @param {Pointer<UInt32>} pRangeFlags 
     * @param {Pointer<UInt32>} pTilePoolStartOffsets 
     * @param {Pointer<UInt32>} pRangeTileCounts 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    UpdateTileMappings(pTiledResource, NumTiledResourceRegions, pTiledResourceRegionStartCoordinates, pTiledResourceRegionSizes, pTilePool, NumRanges, pRangeFlags, pTilePoolStartOffsets, pRangeTileCounts, Flags) {
        result := ComCall(134, this, "ptr", pTiledResource, "uint", NumTiledResourceRegions, "ptr", pTiledResourceRegionStartCoordinates, "ptr", pTiledResourceRegionSizes, "ptr", pTilePool, "uint", NumRanges, "uint*", pRangeFlags, "uint*", pTilePoolStartOffsets, "uint*", pRangeTileCounts, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Resource>} pDestTiledResource 
     * @param {Pointer<D3D11_TILED_RESOURCE_COORDINATE>} pDestRegionStartCoordinate 
     * @param {Pointer<ID3D11Resource>} pSourceTiledResource 
     * @param {Pointer<D3D11_TILED_RESOURCE_COORDINATE>} pSourceRegionStartCoordinate 
     * @param {Pointer<D3D11_TILE_REGION_SIZE>} pTileRegionSize 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    CopyTileMappings(pDestTiledResource, pDestRegionStartCoordinate, pSourceTiledResource, pSourceRegionStartCoordinate, pTileRegionSize, Flags) {
        result := ComCall(135, this, "ptr", pDestTiledResource, "ptr", pDestRegionStartCoordinate, "ptr", pSourceTiledResource, "ptr", pSourceRegionStartCoordinate, "ptr", pTileRegionSize, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Resource>} pTiledResource 
     * @param {Pointer<D3D11_TILED_RESOURCE_COORDINATE>} pTileRegionStartCoordinate 
     * @param {Pointer<D3D11_TILE_REGION_SIZE>} pTileRegionSize 
     * @param {Pointer<ID3D11Buffer>} pBuffer 
     * @param {Integer} BufferStartOffsetInBytes 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     */
    CopyTiles(pTiledResource, pTileRegionStartCoordinate, pTileRegionSize, pBuffer, BufferStartOffsetInBytes, Flags) {
        ComCall(136, this, "ptr", pTiledResource, "ptr", pTileRegionStartCoordinate, "ptr", pTileRegionSize, "ptr", pBuffer, "uint", BufferStartOffsetInBytes, "uint", Flags)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Resource>} pDestTiledResource 
     * @param {Pointer<D3D11_TILED_RESOURCE_COORDINATE>} pDestTileRegionStartCoordinate 
     * @param {Pointer<D3D11_TILE_REGION_SIZE>} pDestTileRegionSize 
     * @param {Pointer<Void>} pSourceTileData 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     */
    UpdateTiles(pDestTiledResource, pDestTileRegionStartCoordinate, pDestTileRegionSize, pSourceTileData, Flags) {
        ComCall(137, this, "ptr", pDestTiledResource, "ptr", pDestTileRegionStartCoordinate, "ptr", pDestTileRegionSize, "ptr", pSourceTileData, "uint", Flags)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Buffer>} pTilePool 
     * @param {Integer} NewSizeInBytes 
     * @returns {HRESULT} 
     */
    ResizeTilePool(pTilePool, NewSizeInBytes) {
        result := ComCall(138, this, "ptr", pTilePool, "uint", NewSizeInBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11DeviceChild>} pTiledResourceOrViewAccessBeforeBarrier 
     * @param {Pointer<ID3D11DeviceChild>} pTiledResourceOrViewAccessAfterBarrier 
     * @returns {String} Nothing - always returns an empty string
     */
    TiledResourceBarrier(pTiledResourceOrViewAccessBeforeBarrier, pTiledResourceOrViewAccessAfterBarrier) {
        ComCall(139, this, "ptr", pTiledResourceOrViewAccessBeforeBarrier, "ptr", pTiledResourceOrViewAccessAfterBarrier)
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsAnnotationEnabled() {
        result := ComCall(140, this, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} pLabel 
     * @param {Integer} Data 
     * @returns {String} Nothing - always returns an empty string
     */
    SetMarkerInt(pLabel, Data) {
        pLabel := pLabel is String ? StrPtr(pLabel) : pLabel

        ComCall(141, this, "ptr", pLabel, "int", Data)
        return result
    }

    /**
     * 
     * @param {PWSTR} pLabel 
     * @param {Integer} Data 
     * @returns {String} Nothing - always returns an empty string
     */
    BeginEventInt(pLabel, Data) {
        pLabel := pLabel is String ? StrPtr(pLabel) : pLabel

        ComCall(142, this, "ptr", pLabel, "int", Data)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    EndEvent() {
        ComCall(143, this)
        return result
    }
}

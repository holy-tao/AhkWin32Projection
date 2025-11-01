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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UpdateTileMappings", "CopyTileMappings", "CopyTiles", "UpdateTiles", "ResizeTilePool", "TiledResourceBarrier", "IsAnnotationEnabled", "SetMarkerInt", "BeginEventInt", "EndEvent"]

    /**
     * 
     * @param {ID3D11Resource} pTiledResource 
     * @param {Integer} NumTiledResourceRegions 
     * @param {Pointer<D3D11_TILED_RESOURCE_COORDINATE>} pTiledResourceRegionStartCoordinates 
     * @param {Pointer<D3D11_TILE_REGION_SIZE>} pTiledResourceRegionSizes 
     * @param {ID3D11Buffer} pTilePool 
     * @param {Integer} NumRanges 
     * @param {Pointer<Integer>} pRangeFlags 
     * @param {Pointer<Integer>} pTilePoolStartOffsets 
     * @param {Pointer<Integer>} pRangeTileCounts 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_2/nf-d3d11_2-id3d11devicecontext2-updatetilemappings
     */
    UpdateTileMappings(pTiledResource, NumTiledResourceRegions, pTiledResourceRegionStartCoordinates, pTiledResourceRegionSizes, pTilePool, NumRanges, pRangeFlags, pTilePoolStartOffsets, pRangeTileCounts, Flags) {
        result := ComCall(134, this, "ptr", pTiledResource, "uint", NumTiledResourceRegions, "ptr", pTiledResourceRegionStartCoordinates, "ptr", pTiledResourceRegionSizes, "ptr", pTilePool, "uint", NumRanges, "uint*", pRangeFlags, "uint*", pTilePoolStartOffsets, "uint*", pRangeTileCounts, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11Resource} pDestTiledResource 
     * @param {Pointer<D3D11_TILED_RESOURCE_COORDINATE>} pDestRegionStartCoordinate 
     * @param {ID3D11Resource} pSourceTiledResource 
     * @param {Pointer<D3D11_TILED_RESOURCE_COORDINATE>} pSourceRegionStartCoordinate 
     * @param {Pointer<D3D11_TILE_REGION_SIZE>} pTileRegionSize 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_2/nf-d3d11_2-id3d11devicecontext2-copytilemappings
     */
    CopyTileMappings(pDestTiledResource, pDestRegionStartCoordinate, pSourceTiledResource, pSourceRegionStartCoordinate, pTileRegionSize, Flags) {
        result := ComCall(135, this, "ptr", pDestTiledResource, "ptr", pDestRegionStartCoordinate, "ptr", pSourceTiledResource, "ptr", pSourceRegionStartCoordinate, "ptr", pTileRegionSize, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11Resource} pTiledResource 
     * @param {Pointer<D3D11_TILED_RESOURCE_COORDINATE>} pTileRegionStartCoordinate 
     * @param {Pointer<D3D11_TILE_REGION_SIZE>} pTileRegionSize 
     * @param {ID3D11Buffer} pBuffer 
     * @param {Integer} BufferStartOffsetInBytes 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_2/nf-d3d11_2-id3d11devicecontext2-copytiles
     */
    CopyTiles(pTiledResource, pTileRegionStartCoordinate, pTileRegionSize, pBuffer, BufferStartOffsetInBytes, Flags) {
        ComCall(136, this, "ptr", pTiledResource, "ptr", pTileRegionStartCoordinate, "ptr", pTileRegionSize, "ptr", pBuffer, "uint", BufferStartOffsetInBytes, "uint", Flags)
    }

    /**
     * 
     * @param {ID3D11Resource} pDestTiledResource 
     * @param {Pointer<D3D11_TILED_RESOURCE_COORDINATE>} pDestTileRegionStartCoordinate 
     * @param {Pointer<D3D11_TILE_REGION_SIZE>} pDestTileRegionSize 
     * @param {Pointer<Void>} pSourceTileData 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_2/nf-d3d11_2-id3d11devicecontext2-updatetiles
     */
    UpdateTiles(pDestTiledResource, pDestTileRegionStartCoordinate, pDestTileRegionSize, pSourceTileData, Flags) {
        ComCall(137, this, "ptr", pDestTiledResource, "ptr", pDestTileRegionStartCoordinate, "ptr", pDestTileRegionSize, "ptr", pSourceTileData, "uint", Flags)
    }

    /**
     * 
     * @param {ID3D11Buffer} pTilePool 
     * @param {Integer} NewSizeInBytes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_2/nf-d3d11_2-id3d11devicecontext2-resizetilepool
     */
    ResizeTilePool(pTilePool, NewSizeInBytes) {
        result := ComCall(138, this, "ptr", pTilePool, "uint", NewSizeInBytes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11DeviceChild} pTiledResourceOrViewAccessBeforeBarrier 
     * @param {ID3D11DeviceChild} pTiledResourceOrViewAccessAfterBarrier 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_2/nf-d3d11_2-id3d11devicecontext2-tiledresourcebarrier
     */
    TiledResourceBarrier(pTiledResourceOrViewAccessBeforeBarrier, pTiledResourceOrViewAccessAfterBarrier) {
        ComCall(139, this, "ptr", pTiledResourceOrViewAccessBeforeBarrier, "ptr", pTiledResourceOrViewAccessAfterBarrier)
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_2/nf-d3d11_2-id3d11devicecontext2-isannotationenabled
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_2/nf-d3d11_2-id3d11devicecontext2-setmarkerint
     */
    SetMarkerInt(pLabel, Data) {
        pLabel := pLabel is String ? StrPtr(pLabel) : pLabel

        ComCall(141, this, "ptr", pLabel, "int", Data)
    }

    /**
     * 
     * @param {PWSTR} pLabel 
     * @param {Integer} Data 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_2/nf-d3d11_2-id3d11devicecontext2-begineventint
     */
    BeginEventInt(pLabel, Data) {
        pLabel := pLabel is String ? StrPtr(pLabel) : pLabel

        ComCall(142, this, "ptr", pLabel, "int", Data)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_2/nf-d3d11_2-id3d11devicecontext2-endevent
     */
    EndEvent() {
        ComCall(143, this)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12GraphicsCommandList.ahk

/**
 * Encapsulates a list of graphics commands for rendering, extending the interface to support programmable sample positions, atomic copies for implementing late-latch techniques, and optional depth-bounds testing.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12graphicscommandlist1
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12GraphicsCommandList1 extends ID3D12GraphicsCommandList{
    /**
     * The interface identifier for ID3D12GraphicsCommandList1
     * @type {Guid}
     */
    static IID => Guid("{553103fb-1fe7-4557-bb38-946d7d0e7ca7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 60

    /**
     * 
     * @param {Pointer<ID3D12Resource>} pDstBuffer 
     * @param {Integer} DstOffset 
     * @param {Pointer<ID3D12Resource>} pSrcBuffer 
     * @param {Integer} SrcOffset 
     * @param {Integer} Dependencies 
     * @param {Pointer<ID3D12Resource>} ppDependentResources 
     * @param {Pointer<D3D12_SUBRESOURCE_RANGE_UINT64>} pDependentSubresourceRanges 
     * @returns {String} Nothing - always returns an empty string
     */
    AtomicCopyBufferUINT(pDstBuffer, DstOffset, pSrcBuffer, SrcOffset, Dependencies, ppDependentResources, pDependentSubresourceRanges) {
        ComCall(60, this, "ptr", pDstBuffer, "uint", DstOffset, "ptr", pSrcBuffer, "uint", SrcOffset, "uint", Dependencies, "ptr", ppDependentResources, "ptr", pDependentSubresourceRanges)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Resource>} pDstBuffer 
     * @param {Integer} DstOffset 
     * @param {Pointer<ID3D12Resource>} pSrcBuffer 
     * @param {Integer} SrcOffset 
     * @param {Integer} Dependencies 
     * @param {Pointer<ID3D12Resource>} ppDependentResources 
     * @param {Pointer<D3D12_SUBRESOURCE_RANGE_UINT64>} pDependentSubresourceRanges 
     * @returns {String} Nothing - always returns an empty string
     */
    AtomicCopyBufferUINT64(pDstBuffer, DstOffset, pSrcBuffer, SrcOffset, Dependencies, ppDependentResources, pDependentSubresourceRanges) {
        ComCall(61, this, "ptr", pDstBuffer, "uint", DstOffset, "ptr", pSrcBuffer, "uint", SrcOffset, "uint", Dependencies, "ptr", ppDependentResources, "ptr", pDependentSubresourceRanges)
        return result
    }

    /**
     * 
     * @param {Float} Min 
     * @param {Float} Max 
     * @returns {String} Nothing - always returns an empty string
     */
    OMSetDepthBounds(Min, Max) {
        ComCall(62, this, "float", Min, "float", Max)
        return result
    }

    /**
     * 
     * @param {Integer} NumSamplesPerPixel 
     * @param {Integer} NumPixels 
     * @param {Pointer<D3D12_SAMPLE_POSITION>} pSamplePositions 
     * @returns {String} Nothing - always returns an empty string
     */
    SetSamplePositions(NumSamplesPerPixel, NumPixels, pSamplePositions) {
        ComCall(63, this, "uint", NumSamplesPerPixel, "uint", NumPixels, "ptr", pSamplePositions)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Resource>} pDstResource 
     * @param {Integer} DstSubresource 
     * @param {Integer} DstX 
     * @param {Integer} DstY 
     * @param {Pointer<ID3D12Resource>} pSrcResource 
     * @param {Integer} SrcSubresource 
     * @param {Pointer<RECT>} pSrcRect 
     * @param {Integer} Format 
     * @param {Integer} ResolveMode 
     * @returns {String} Nothing - always returns an empty string
     */
    ResolveSubresourceRegion(pDstResource, DstSubresource, DstX, DstY, pSrcResource, SrcSubresource, pSrcRect, Format, ResolveMode) {
        ComCall(64, this, "ptr", pDstResource, "uint", DstSubresource, "uint", DstX, "uint", DstY, "ptr", pSrcResource, "uint", SrcSubresource, "ptr", pSrcRect, "int", Format, "int", ResolveMode)
        return result
    }

    /**
     * 
     * @param {Integer} Mask 
     * @returns {String} Nothing - always returns an empty string
     */
    SetViewInstanceMask(Mask) {
        ComCall(65, this, "uint", Mask)
        return result
    }
}

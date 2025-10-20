#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11DeviceContext.ahk

/**
 * The device context interface represents a device context; it is used to render commands. ID3D11DeviceContext1 adds new methods to those in ID3D11DeviceContext.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nn-d3d11_1-id3d11devicecontext1
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11DeviceContext1 extends ID3D11DeviceContext{
    /**
     * The interface identifier for ID3D11DeviceContext1
     * @type {Guid}
     */
    static IID => Guid("{bb2c6faa-b5fb-4082-8e6b-388b8cfa90e1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 115

    /**
     * 
     * @param {Pointer<ID3D11Resource>} pDstResource 
     * @param {Integer} DstSubresource 
     * @param {Integer} DstX 
     * @param {Integer} DstY 
     * @param {Integer} DstZ 
     * @param {Pointer<ID3D11Resource>} pSrcResource 
     * @param {Integer} SrcSubresource 
     * @param {Pointer<D3D11_BOX>} pSrcBox 
     * @param {Integer} CopyFlags 
     * @returns {String} Nothing - always returns an empty string
     */
    CopySubresourceRegion1(pDstResource, DstSubresource, DstX, DstY, DstZ, pSrcResource, SrcSubresource, pSrcBox, CopyFlags) {
        ComCall(115, this, "ptr", pDstResource, "uint", DstSubresource, "uint", DstX, "uint", DstY, "uint", DstZ, "ptr", pSrcResource, "uint", SrcSubresource, "ptr", pSrcBox, "uint", CopyFlags)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Resource>} pDstResource 
     * @param {Integer} DstSubresource 
     * @param {Pointer<D3D11_BOX>} pDstBox 
     * @param {Pointer<Void>} pSrcData 
     * @param {Integer} SrcRowPitch 
     * @param {Integer} SrcDepthPitch 
     * @param {Integer} CopyFlags 
     * @returns {String} Nothing - always returns an empty string
     */
    UpdateSubresource1(pDstResource, DstSubresource, pDstBox, pSrcData, SrcRowPitch, SrcDepthPitch, CopyFlags) {
        ComCall(116, this, "ptr", pDstResource, "uint", DstSubresource, "ptr", pDstBox, "ptr", pSrcData, "uint", SrcRowPitch, "uint", SrcDepthPitch, "uint", CopyFlags)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Resource>} pResource 
     * @returns {String} Nothing - always returns an empty string
     */
    DiscardResource(pResource) {
        ComCall(117, this, "ptr", pResource)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11View>} pResourceView 
     * @returns {String} Nothing - always returns an empty string
     */
    DiscardView(pResourceView) {
        ComCall(118, this, "ptr", pResourceView)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @param {Pointer<UInt32>} pFirstConstant 
     * @param {Pointer<UInt32>} pNumConstants 
     * @returns {String} Nothing - always returns an empty string
     */
    VSSetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        ComCall(119, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppConstantBuffers, "uint*", pFirstConstant, "uint*", pNumConstants)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @param {Pointer<UInt32>} pFirstConstant 
     * @param {Pointer<UInt32>} pNumConstants 
     * @returns {String} Nothing - always returns an empty string
     */
    HSSetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        ComCall(120, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppConstantBuffers, "uint*", pFirstConstant, "uint*", pNumConstants)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @param {Pointer<UInt32>} pFirstConstant 
     * @param {Pointer<UInt32>} pNumConstants 
     * @returns {String} Nothing - always returns an empty string
     */
    DSSetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        ComCall(121, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppConstantBuffers, "uint*", pFirstConstant, "uint*", pNumConstants)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @param {Pointer<UInt32>} pFirstConstant 
     * @param {Pointer<UInt32>} pNumConstants 
     * @returns {String} Nothing - always returns an empty string
     */
    GSSetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        ComCall(122, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppConstantBuffers, "uint*", pFirstConstant, "uint*", pNumConstants)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @param {Pointer<UInt32>} pFirstConstant 
     * @param {Pointer<UInt32>} pNumConstants 
     * @returns {String} Nothing - always returns an empty string
     */
    PSSetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        ComCall(123, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppConstantBuffers, "uint*", pFirstConstant, "uint*", pNumConstants)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @param {Pointer<UInt32>} pFirstConstant 
     * @param {Pointer<UInt32>} pNumConstants 
     * @returns {String} Nothing - always returns an empty string
     */
    CSSetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        ComCall(124, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppConstantBuffers, "uint*", pFirstConstant, "uint*", pNumConstants)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @param {Pointer<UInt32>} pFirstConstant 
     * @param {Pointer<UInt32>} pNumConstants 
     * @returns {String} Nothing - always returns an empty string
     */
    VSGetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        ComCall(125, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppConstantBuffers, "uint*", pFirstConstant, "uint*", pNumConstants)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @param {Pointer<UInt32>} pFirstConstant 
     * @param {Pointer<UInt32>} pNumConstants 
     * @returns {String} Nothing - always returns an empty string
     */
    HSGetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        ComCall(126, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppConstantBuffers, "uint*", pFirstConstant, "uint*", pNumConstants)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @param {Pointer<UInt32>} pFirstConstant 
     * @param {Pointer<UInt32>} pNumConstants 
     * @returns {String} Nothing - always returns an empty string
     */
    DSGetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        ComCall(127, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppConstantBuffers, "uint*", pFirstConstant, "uint*", pNumConstants)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @param {Pointer<UInt32>} pFirstConstant 
     * @param {Pointer<UInt32>} pNumConstants 
     * @returns {String} Nothing - always returns an empty string
     */
    GSGetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        ComCall(128, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppConstantBuffers, "uint*", pFirstConstant, "uint*", pNumConstants)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @param {Pointer<UInt32>} pFirstConstant 
     * @param {Pointer<UInt32>} pNumConstants 
     * @returns {String} Nothing - always returns an empty string
     */
    PSGetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        ComCall(129, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppConstantBuffers, "uint*", pFirstConstant, "uint*", pNumConstants)
        return result
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @param {Pointer<UInt32>} pFirstConstant 
     * @param {Pointer<UInt32>} pNumConstants 
     * @returns {String} Nothing - always returns an empty string
     */
    CSGetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        ComCall(130, this, "uint", StartSlot, "uint", NumBuffers, "ptr", ppConstantBuffers, "uint*", pFirstConstant, "uint*", pNumConstants)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3DDeviceContextState>} pState 
     * @param {Pointer<ID3DDeviceContextState>} ppPreviousState 
     * @returns {String} Nothing - always returns an empty string
     */
    SwapDeviceContextState(pState, ppPreviousState) {
        ComCall(131, this, "ptr", pState, "ptr", ppPreviousState)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11View>} pView 
     * @param {Pointer<Single>} Color 
     * @param {Pointer<RECT>} pRect 
     * @param {Integer} NumRects 
     * @returns {String} Nothing - always returns an empty string
     */
    ClearView(pView, Color, pRect, NumRects) {
        ComCall(132, this, "ptr", pView, "float*", Color, "ptr", pRect, "uint", NumRects)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11View>} pResourceView 
     * @param {Pointer<RECT>} pRects 
     * @param {Integer} NumRects 
     * @returns {String} Nothing - always returns an empty string
     */
    DiscardView1(pResourceView, pRects, NumRects) {
        ComCall(133, this, "ptr", pResourceView, "ptr", pRects, "uint", NumRects)
        return result
    }
}

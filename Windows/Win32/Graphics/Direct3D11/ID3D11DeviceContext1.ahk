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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CopySubresourceRegion1", "UpdateSubresource1", "DiscardResource", "DiscardView", "VSSetConstantBuffers1", "HSSetConstantBuffers1", "DSSetConstantBuffers1", "GSSetConstantBuffers1", "PSSetConstantBuffers1", "CSSetConstantBuffers1", "VSGetConstantBuffers1", "HSGetConstantBuffers1", "DSGetConstantBuffers1", "GSGetConstantBuffers1", "PSGetConstantBuffers1", "CSGetConstantBuffers1", "SwapDeviceContextState", "ClearView", "DiscardView1"]

    /**
     * 
     * @param {ID3D11Resource} pDstResource 
     * @param {Integer} DstSubresource 
     * @param {Integer} DstX 
     * @param {Integer} DstY 
     * @param {Integer} DstZ 
     * @param {ID3D11Resource} pSrcResource 
     * @param {Integer} SrcSubresource 
     * @param {Pointer<D3D11_BOX>} pSrcBox 
     * @param {Integer} CopyFlags 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-copysubresourceregion1
     */
    CopySubresourceRegion1(pDstResource, DstSubresource, DstX, DstY, DstZ, pSrcResource, SrcSubresource, pSrcBox, CopyFlags) {
        ComCall(115, this, "ptr", pDstResource, "uint", DstSubresource, "uint", DstX, "uint", DstY, "uint", DstZ, "ptr", pSrcResource, "uint", SrcSubresource, "ptr", pSrcBox, "uint", CopyFlags)
    }

    /**
     * 
     * @param {ID3D11Resource} pDstResource 
     * @param {Integer} DstSubresource 
     * @param {Pointer<D3D11_BOX>} pDstBox 
     * @param {Pointer<Void>} pSrcData 
     * @param {Integer} SrcRowPitch 
     * @param {Integer} SrcDepthPitch 
     * @param {Integer} CopyFlags 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-updatesubresource1
     */
    UpdateSubresource1(pDstResource, DstSubresource, pDstBox, pSrcData, SrcRowPitch, SrcDepthPitch, CopyFlags) {
        ComCall(116, this, "ptr", pDstResource, "uint", DstSubresource, "ptr", pDstBox, "ptr", pSrcData, "uint", SrcRowPitch, "uint", SrcDepthPitch, "uint", CopyFlags)
    }

    /**
     * 
     * @param {ID3D11Resource} pResource 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-discardresource
     */
    DiscardResource(pResource) {
        ComCall(117, this, "ptr", pResource)
    }

    /**
     * 
     * @param {ID3D11View} pResourceView 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-discardview
     */
    DiscardView(pResourceView) {
        ComCall(118, this, "ptr", pResourceView)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @param {Pointer<Integer>} pFirstConstant 
     * @param {Pointer<Integer>} pNumConstants 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-vssetconstantbuffers1
     */
    VSSetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        ComCall(119, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers, "uint*", pFirstConstant, "uint*", pNumConstants)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @param {Pointer<Integer>} pFirstConstant 
     * @param {Pointer<Integer>} pNumConstants 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-hssetconstantbuffers1
     */
    HSSetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        ComCall(120, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers, "uint*", pFirstConstant, "uint*", pNumConstants)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @param {Pointer<Integer>} pFirstConstant 
     * @param {Pointer<Integer>} pNumConstants 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-dssetconstantbuffers1
     */
    DSSetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        ComCall(121, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers, "uint*", pFirstConstant, "uint*", pNumConstants)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @param {Pointer<Integer>} pFirstConstant 
     * @param {Pointer<Integer>} pNumConstants 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-gssetconstantbuffers1
     */
    GSSetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        ComCall(122, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers, "uint*", pFirstConstant, "uint*", pNumConstants)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @param {Pointer<Integer>} pFirstConstant 
     * @param {Pointer<Integer>} pNumConstants 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-pssetconstantbuffers1
     */
    PSSetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        ComCall(123, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers, "uint*", pFirstConstant, "uint*", pNumConstants)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @param {Pointer<Integer>} pFirstConstant 
     * @param {Pointer<Integer>} pNumConstants 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-cssetconstantbuffers1
     */
    CSSetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        ComCall(124, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers, "uint*", pFirstConstant, "uint*", pNumConstants)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @param {Pointer<Integer>} pFirstConstant 
     * @param {Pointer<Integer>} pNumConstants 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-vsgetconstantbuffers1
     */
    VSGetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        ComCall(125, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers, "uint*", pFirstConstant, "uint*", pNumConstants)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @param {Pointer<Integer>} pFirstConstant 
     * @param {Pointer<Integer>} pNumConstants 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-hsgetconstantbuffers1
     */
    HSGetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        ComCall(126, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers, "uint*", pFirstConstant, "uint*", pNumConstants)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @param {Pointer<Integer>} pFirstConstant 
     * @param {Pointer<Integer>} pNumConstants 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-dsgetconstantbuffers1
     */
    DSGetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        ComCall(127, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers, "uint*", pFirstConstant, "uint*", pNumConstants)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @param {Pointer<Integer>} pFirstConstant 
     * @param {Pointer<Integer>} pNumConstants 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-gsgetconstantbuffers1
     */
    GSGetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        ComCall(128, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers, "uint*", pFirstConstant, "uint*", pNumConstants)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @param {Pointer<Integer>} pFirstConstant 
     * @param {Pointer<Integer>} pNumConstants 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-psgetconstantbuffers1
     */
    PSGetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        ComCall(129, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers, "uint*", pFirstConstant, "uint*", pNumConstants)
    }

    /**
     * 
     * @param {Integer} StartSlot 
     * @param {Integer} NumBuffers 
     * @param {Pointer<ID3D11Buffer>} ppConstantBuffers 
     * @param {Pointer<Integer>} pFirstConstant 
     * @param {Pointer<Integer>} pNumConstants 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-csgetconstantbuffers1
     */
    CSGetConstantBuffers1(StartSlot, NumBuffers, ppConstantBuffers, pFirstConstant, pNumConstants) {
        ComCall(130, this, "uint", StartSlot, "uint", NumBuffers, "ptr*", ppConstantBuffers, "uint*", pFirstConstant, "uint*", pNumConstants)
    }

    /**
     * 
     * @param {ID3DDeviceContextState} pState 
     * @param {Pointer<ID3DDeviceContextState>} ppPreviousState 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-swapdevicecontextstate
     */
    SwapDeviceContextState(pState, ppPreviousState) {
        ComCall(131, this, "ptr", pState, "ptr*", ppPreviousState)
    }

    /**
     * 
     * @param {ID3D11View} pView 
     * @param {Pointer<Float>} Color 
     * @param {Pointer<RECT>} pRect 
     * @param {Integer} NumRects 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-clearview
     */
    ClearView(pView, Color, pRect, NumRects) {
        ComCall(132, this, "ptr", pView, "float*", Color, "ptr", pRect, "uint", NumRects)
    }

    /**
     * 
     * @param {ID3D11View} pResourceView 
     * @param {Pointer<RECT>} pRects 
     * @param {Integer} NumRects 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-discardview1
     */
    DiscardView1(pResourceView, pRects, NumRects) {
        ComCall(133, this, "ptr", pResourceView, "ptr", pRects, "uint", NumRects)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11BlendState.ahk

/**
 * The blend-state interface holds a description for blending state that you can bind to the output-merger stage. This blend-state interface supports logical operations as well as blending operations.
 * @remarks
 * 
  * Blending applies a simple function to combine output values from a pixel shader with data in a render target. You have control over how the pixels are blended by using a predefined set of blending operations and preblending operations.
  * 
  * To create a blend-state object, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11device1-createblendstate1">ID3D11Device1::CreateBlendState1</a>. To bind the blend-state object to the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage">output-merger stage</a>, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-omsetblendstate">ID3D11DeviceContext::OMSetBlendState</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nn-d3d11_1-id3d11blendstate1
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11BlendState1 extends ID3D11BlendState{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11BlendState1
     * @type {Guid}
     */
    static IID => Guid("{cc86fabe-da55-401d-85e7-e3c9de2877e9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc1"]

    /**
     * 
     * @param {Pointer<D3D11_BLEND_DESC1>} pDesc 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11blendstate1-getdesc1
     */
    GetDesc1(pDesc) {
        ComCall(8, this, "ptr", pDesc)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10DeviceChild.ahk

/**
 * This blend-state interface accesses blending state for a Direct3D 10.0 device for the output-merger stage.
 * @remarks
 * 
  * Blending combines two pixel values. You have control over how the pixels are blended by using a predefined set of blending operations, as well as preblending operations. The <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-output-merger-stage">Blending Block Diagram</a> shows conceptually how blending works.
  * 
  * To create a blend-state interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createblendstate">ID3D10Device::CreateBlendState</a>. To initialize the blend state, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-omsetblendstate">ID3D10Device::OMSetBlendState</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/nn-d3d10-id3d10blendstate
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10BlendState extends ID3D10DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10BlendState
     * @type {Guid}
     */
    static IID => Guid("{edad8d19-8a35-4d6d-8566-2ea276cde161}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc"]

    /**
     * 
     * @param {Pointer<D3D10_BLEND_DESC>} pDesc 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10blendstate-getdesc
     */
    GetDesc(pDesc) {
        ComCall(7, this, "ptr", pDesc)
    }
}

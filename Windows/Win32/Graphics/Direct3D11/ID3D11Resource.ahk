#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11DeviceChild.ahk

/**
 * A resource interface provides common actions on all resources.
 * @remarks
 * 
  * You don't directly create a resource interface; instead, you create buffers and textures that inherit from a resource interface. For more info,  see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-buffers-vertex-how-to">How to: Create a Vertex Buffer</a>, <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-buffers-index-how-to">How to: Create an Index Buffer</a>, <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-buffers-constant-how-to">How to: Create a Constant Buffer</a>, and <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-textures-create">How to: Create a Texture</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/nn-d3d11-id3d11resource
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11Resource extends ID3D11DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11Resource
     * @type {Guid}
     */
    static IID => Guid("{dc8e63f3-d12b-4952-b47b-5e45026a862d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetType", "SetEvictionPriority", "GetEvictionPriority"]

    /**
     * 
     * @param {Pointer<Integer>} pResourceDimension 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11resource-gettype
     */
    GetType(pResourceDimension) {
        ComCall(7, this, "int*", pResourceDimension)
    }

    /**
     * 
     * @param {Integer} EvictionPriority 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11resource-setevictionpriority
     */
    SetEvictionPriority(EvictionPriority) {
        ComCall(8, this, "uint", EvictionPriority)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11resource-getevictionpriority
     */
    GetEvictionPriority() {
        result := ComCall(9, this, "uint")
        return result
    }
}

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
     * Get the type of the resource.
     * @remarks
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * 
     * 
     * @param {Pointer<Integer>} pResourceDimension Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_resource_dimension">D3D11_RESOURCE_DIMENSION</a>*</b>
     * 
     * Pointer to the resource type (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_resource_dimension">D3D11_RESOURCE_DIMENSION</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11resource-gettype
     */
    GetType(pResourceDimension) {
        pResourceDimensionMarshal := pResourceDimension is VarRef ? "int*" : "ptr"

        ComCall(7, this, pResourceDimensionMarshal, pResourceDimension)
    }

    /**
     * Set the eviction priority of a resource.
     * @remarks
     * 
     * Resource priorities determine which resource to evict from video memory when the system has run out of video memory. The resource will not be lost; it will be removed from video memory and placed into system memory, or possibly placed onto the hard drive. The resource will be loaded back into video memory when it is required.
     * 
     * A resource that is set to the maximum priority, DXGI_RESOURCE_PRIORITY_MAXIMUM, is only evicted if there is no other way of resolving the incoming memory request. The Windows Display Driver Model (WDDM) tries to split an incoming memory request to its minimum size and evict lower-priority resources before evicting a resource with maximum priority.
     * 
     * Changing the priorities of resources should be done carefully. The wrong eviction priorities could be a detriment to performance rather than an improvement.
     * 
     * 
     * @param {Integer} EvictionPriority Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11resource-setevictionpriority
     */
    SetEvictionPriority(EvictionPriority) {
        ComCall(8, this, "uint", EvictionPriority)
    }

    /**
     * Get the eviction priority of a resource.
     * @returns {Integer} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * One of the following values, which specifies the eviction priority for the resource:
     * 
     * <ul>
     * <li>DXGI_RESOURCE_PRIORITY_MINIMUM</li>
     * <li>DXGI_RESOURCE_PRIORITY_LOW</li>
     * <li>DXGI_RESOURCE_PRIORITY_NORMAL</li>
     * <li>DXGI_RESOURCE_PRIORITY_HIGH</li>
     * <li>DXGI_RESOURCE_PRIORITY_MAXIMUM</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11resource-getevictionpriority
     */
    GetEvictionPriority() {
        result := ComCall(9, this, "uint")
        return result
    }
}

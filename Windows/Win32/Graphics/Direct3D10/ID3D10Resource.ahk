#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10DeviceChild.ahk

/**
 * A resource interface provides common actions on all resources.
 * @remarks
 * 
 * A resource interface cannot be created directly; instead, <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">buffers</a> and textures are created that inherit from a resource interface (see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-creating">Creating Buffer Resources</a> or <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-creating-textures">Creating Texture Resources</a>).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/nn-d3d10-id3d10resource
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10Resource extends ID3D10DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10Resource
     * @type {Guid}
     */
    static IID => Guid("{9b7e4c01-342c-4106-a19f-4f2704f689f0}")

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
     * @param {Pointer<Integer>} rType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_resource_dimension">D3D10_RESOURCE_DIMENSION</a>*</b>
     * 
     * Pointer to the resource type (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_resource_dimension">D3D10_RESOURCE_DIMENSION</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10resource-gettype
     */
    GetType(rType) {
        rTypeMarshal := rType is VarRef ? "int*" : "ptr"

        ComCall(7, this, rTypeMarshal, rType)
    }

    /**
     * Set the eviction priority of a resource.
     * @remarks
     * 
     * Resource priorities determine which resource to evict from video memory when the system has run out of video memory. The resource will not be lost; it will be removed from video memory and placed into system memory, or possibly placed onto the hard drive. The resource will be loaded back into video memory when it is required.
     * 
     * A resource that is set to the maximum priority, DXGI_RESOURCE_PRIORITY_MAXIMUM, is only evicted if there is no other way of resolving the incoming memory request. The Windows Display Driver Model (WDDM) tries to split an incoming memory request to its minimum size and evict lower-priority resources before evicting a resource with maximum priority.
     * 
     * Changing the priorities of resources should be done carefully. The wrong eviction priorities could be a detriment to performance rather than an improvement. See <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgidevice-queryresourceresidency">QueryResourceResidency</a> for additional information.
     * 
     * This method is a wrapper for <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiresource-setevictionpriority">SetEvictionPriority</a> and is provided in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10resource">ID3D10Resource Interface</a> interface for convenience.
     * 
     * 
     * @param {Integer} EvictionPriority Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10resource-setevictionpriority
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
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10resource-getevictionpriority
     */
    GetEvictionPriority() {
        result := ComCall(9, this, "uint")
        return result
    }
}

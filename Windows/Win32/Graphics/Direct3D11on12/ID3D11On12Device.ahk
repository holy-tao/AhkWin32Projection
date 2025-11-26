#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Handles the creation, wrapping, and releasing of D3D11 resources for Direct3D11on12.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11on12/nn-d3d11on12-id3d11on12device
 * @namespace Windows.Win32.Graphics.Direct3D11on12
 * @version v4.0.30319
 */
class ID3D11On12Device extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11On12Device
     * @type {Guid}
     */
    static IID => Guid("{85611e73-70a9-490e-9614-a9e302777904}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWrappedResource", "ReleaseWrappedResources", "AcquireWrappedResources"]

    /**
     * This method creates D3D11 resources for use with D3D 11on12.
     * @param {IUnknown} pResource12 Type: <b>IUnknown*</b>
     * 
     * A pointer to an already-created D3D12 resource or heap.
     * @param {Pointer<D3D11_RESOURCE_FLAGS>} pFlags11 Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11on12/ns-d3d11on12-d3d11_resource_flags">D3D11_RESOURCE_FLAGS</a>*</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11on12/ns-d3d11on12-d3d11_resource_flags">D3D11_RESOURCE_FLAGS</a> structure that enables an application to override flags that would be inferred by the resource/heap properties.
     *               The D3D11_RESOURCE_FLAGS structure contains bind flags, misc flags, and CPU access flags.
     * @param {Integer} InState Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATES</a></b>
     * 
     * The use of the resource on input, as a bitwise-OR'd combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATES</a> enumeration constants.
     * @param {Integer} OutState Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATES</a></b>
     * 
     * The use of the resource on output, as a bitwise-OR'd combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATES</a> enumeration constants.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The globally unique identifier (<b>GUID</b>) for the wrapped resource interface.
     *             The <b>REFIID</b>, or <b>GUID</b>, of the interface to the wrapped resource can be obtained by using the __uuidof() macro.
     *             For example, __uuidof(<a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a>) will get the <b>GUID</b> of the interface to a wrapped resource.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * After the method returns, points to the newly created wrapped D3D11 resource or heap.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11on12/nf-d3d11on12-id3d11on12device-createwrappedresource
     */
    CreateWrappedResource(pResource12, pFlags11, InState, OutState, riid) {
        result := ComCall(3, this, "ptr", pResource12, "ptr", pFlags11, "int", InState, "int", OutState, "ptr", riid, "ptr*", &ppResource11 := 0, "HRESULT")
        return ppResource11
    }

    /**
     * Releases D3D11 resources that were wrapped for D3D 11on12.
     * @remarks
     * 
     * Call this method prior to calling Flush, to insert resource barriers to the appropriate "out" state, and to mark that they should then be expected to be in the "in" state.
     *           If no resource list is provided, all wrapped resources are transitioned.
     *           These resources will be marked as “not acquired” in hazard tracking until <a href="https://docs.microsoft.com/windows/desktop/api/d3d11on12/nf-d3d11on12-id3d11on12device-acquirewrappedresources">ID3D11On12Device::AcquireWrappedResources</a> is called.
     *         
     * 
     * Keyed mutex resources cannot be provided to this method; use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgikeyedmutex-releasesync">IDXGIKeyedMutex::ReleaseSync</a> instead.
     *         
     * 
     * 
     * 
     * @param {Pointer<ID3D11Resource>} ppResources Type: <b>ID3D11Resource*</b>
     * 
     * Specifies a pointer to a set of D3D11 resources, defined by <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>.
     * @param {Integer} NumResources Type: <b>UINT</b>
     * 
     * Count of the number of resources.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11on12/nf-d3d11on12-id3d11on12device-releasewrappedresources
     */
    ReleaseWrappedResources(ppResources, NumResources) {
        ComCall(4, this, "ptr*", ppResources, "uint", NumResources)
    }

    /**
     * Acquires D3D11 resources for use with D3D 11on12. Indicates that rendering to the wrapped resources can begin again.
     * @remarks
     * 
     * This method marks the resources as "acquired" in hazard tracking.
     *         
     * 
     * Keyed mutex resources cannot be provided to this method; use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgikeyedmutex-acquiresync">IDXGIKeyedMutex::AcquireSync</a> instead.
     *         
     * 
     * 
     * 
     * @param {Pointer<ID3D11Resource>} ppResources Type: <b>ID3D11Resource*</b>
     * 
     * Specifies a pointer to a set of D3D11 resources, defined by <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>.
     * @param {Integer} NumResources Type: <b>UINT</b>
     * 
     * Count of the number of resources.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11on12/nf-d3d11on12-id3d11on12device-acquirewrappedresources
     */
    AcquireWrappedResources(ppResources, NumResources) {
        ComCall(5, this, "ptr*", ppResources, "uint", NumResources)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Direct3D11\ID3D11Resource.ahk" { ID3D11Resource }
#Import ".\D3D11_RESOURCE_FLAGS.ahk" { D3D11_RESOURCE_FLAGS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Direct3D12\D3D12_RESOURCE_STATES.ahk" { D3D12_RESOURCE_STATES }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Handles the creation, wrapping, and releasing of D3D11 resources for Direct3D11on12.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11on12/nn-d3d11on12-id3d11on12device
 * @namespace Windows.Win32.Graphics.Direct3D11on12
 */
export default struct ID3D11On12Device extends IUnknown {
    /**
     * The interface identifier for ID3D11On12Device
     * @type {Guid}
     */
    static IID := Guid("{85611e73-70a9-490e-9614-a9e302777904}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11On12Device interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateWrappedResource   : IntPtr
        ReleaseWrappedResources : IntPtr
        AcquireWrappedResources : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11On12Device.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This method creates D3D11 resources for use with D3D 11on12.
     * @param {IUnknown} pResource12 Type: <b>IUnknown*</b>
     * 
     * A pointer to an already-created D3D12 resource or heap.
     * @param {Pointer<D3D11_RESOURCE_FLAGS>} pFlags11 Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11on12/ns-d3d11on12-d3d11_resource_flags">D3D11_RESOURCE_FLAGS</a>*</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11on12/ns-d3d11on12-d3d11_resource_flags">D3D11_RESOURCE_FLAGS</a> structure that enables an application to override flags that would be inferred by the resource/heap properties.
     *               The D3D11_RESOURCE_FLAGS structure contains bind flags, misc flags, and CPU access flags.
     * @param {D3D12_RESOURCE_STATES} InState Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATES</a></b>
     * 
     * The use of the resource on input, as a bitwise-OR'd combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATES</a> enumeration constants.
     * @param {D3D12_RESOURCE_STATES} OutState Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATES</a></b>
     * 
     * The use of the resource on output, as a bitwise-OR'd combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATES</a> enumeration constants.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The globally unique identifier (<b>GUID</b>) for the wrapped resource interface.
     *             The <b>REFIID</b>, or <b>GUID</b>, of the interface to the wrapped resource can be obtained by using the __uuidof() macro.
     *             For example, __uuidof(<a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>) will get the <b>GUID</b> of the interface to a wrapped resource.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * After the method returns, points to the newly created wrapped D3D11 resource or heap.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11on12/nf-d3d11on12-id3d11on12device-createwrappedresource
     */
    CreateWrappedResource(pResource12, pFlags11, InState, OutState, riid) {
        result := ComCall(3, this, "ptr", pResource12, D3D11_RESOURCE_FLAGS.Ptr, pFlags11, D3D12_RESOURCE_STATES, InState, D3D12_RESOURCE_STATES, OutState, Guid.Ptr, riid, "ptr*", &ppResource11 := 0, "HRESULT")
        return ppResource11
    }

    /**
     * Releases D3D11 resources that were wrapped for D3D 11on12.
     * @remarks
     * Call this method prior to calling Flush, to insert resource barriers to the appropriate "out" state, and to mark that they should then be expected to be in the "in" state.
     *           If no resource list is provided, all wrapped resources are transitioned.
     *           These resources will be marked as “not acquired” in hazard tracking until <a href="https://docs.microsoft.com/windows/desktop/api/d3d11on12/nf-d3d11on12-id3d11on12device-acquirewrappedresources">ID3D11On12Device::AcquireWrappedResources</a> is called.
     *         
     * 
     * Keyed mutex resources cannot be provided to this method; use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgikeyedmutex-releasesync">IDXGIKeyedMutex::ReleaseSync</a> instead.
     * @param {Pointer<ID3D11Resource>} ppResources Type: <b>ID3D11Resource*</b>
     * 
     * Specifies a pointer to a set of D3D11 resources, defined by <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>.
     * @param {Integer} NumResources Type: <b>UINT</b>
     * 
     * Count of the number of resources.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11on12/nf-d3d11on12-id3d11on12device-releasewrappedresources
     */
    ReleaseWrappedResources(ppResources, NumResources) {
        ComCall(4, this, ID3D11Resource.Ptr, ppResources, "uint", NumResources)
    }

    /**
     * Acquires D3D11 resources for use with D3D 11on12. Indicates that rendering to the wrapped resources can begin again.
     * @remarks
     * This method marks the resources as "acquired" in hazard tracking.
     *         
     * 
     * Keyed mutex resources cannot be provided to this method; use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgikeyedmutex-acquiresync">IDXGIKeyedMutex::AcquireSync</a> instead.
     * @param {Pointer<ID3D11Resource>} ppResources Type: <b>ID3D11Resource*</b>
     * 
     * Specifies a pointer to a set of D3D11 resources, defined by <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>.
     * @param {Integer} NumResources Type: <b>UINT</b>
     * 
     * Count of the number of resources.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11on12/nf-d3d11on12-id3d11on12device-acquirewrappedresources
     */
    AcquireWrappedResources(ppResources, NumResources) {
        ComCall(5, this, ID3D11Resource.Ptr, ppResources, "uint", NumResources)
    }

    Query(iid) {
        if (ID3D11On12Device.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateWrappedResource := CallbackCreate(GetMethod(implObj, "CreateWrappedResource"), flags, 7)
        this.vtbl.ReleaseWrappedResources := CallbackCreate(GetMethod(implObj, "ReleaseWrappedResources"), flags, 3)
        this.vtbl.AcquireWrappedResources := CallbackCreate(GetMethod(implObj, "AcquireWrappedResources"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateWrappedResource)
        CallbackFree(this.vtbl.ReleaseWrappedResources)
        CallbackFree(this.vtbl.AcquireWrappedResources)
    }
}

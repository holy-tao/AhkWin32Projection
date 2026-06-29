#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_DEBUG_FEATURE.ahk" { D3D12_DEBUG_FEATURE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * Provides methods to monitor and debug a command list.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debugcommandlist
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12DebugCommandList extends IUnknown {
    /**
     * The interface identifier for ID3D12DebugCommandList
     * @type {Guid}
     */
    static IID := Guid("{09e0bf36-54ac-484f-8847-4baeeab6053f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12DebugCommandList interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AssertResourceState : IntPtr
        SetFeatureMask      : IntPtr
        GetFeatureMask      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12DebugCommandList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Checks whether a resource, or subresource, is in a specified state, or not. (ID3D12DebugCommandList.AssertResourceState)
     * @param {ID3D12Resource} pResource Type: <b>ID3D12Resource*</b>
     * 
     * Specifies the  <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a> to check.
     * @param {Integer} Subresource Type: <b>UINT</b>
     * 
     * The index of the subresource to check. This can be set to an index, or D3D12_RESOURCE_BARRIER_ALL_SUBRESOURCES.
     * @param {Integer} State Type: <b>UINT</b>
     * 
     * Specifies the state to check for. This can be one or more D3D12_RESOURCE_STATES flags Or'ed together.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * This method returns true if the resource or subresource is in the specified state, false otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugcommandlist-assertresourcestate
     */
    AssertResourceState(pResource, Subresource, State) {
        result := ComCall(3, this, "ptr", pResource, "uint", Subresource, "uint", State, BOOL)
        return result
    }

    /**
     * Turns the debug features for a command list on or off.
     * @param {D3D12_DEBUG_FEATURE} Mask Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_feature">D3D12_DEBUG_FEATURE</a></b>
     * 
     * A combination of feature-mask flags that are combined by using a bitwise OR operation. If a flag is present, that feature will be set to on, otherwise the feature will be set to off.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="https://docs.microsoft.com/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugcommandlist-setfeaturemask
     */
    SetFeatureMask(Mask) {
        result := ComCall(4, this, D3D12_DEBUG_FEATURE, Mask, "HRESULT")
        return result
    }

    /**
     * Returns the debug feature flags that have been set on a command list.
     * @returns {D3D12_DEBUG_FEATURE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_feature">D3D12_DEBUG_FEATURE</a></b>
     * 
     * A bit mask containing the set debug features.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugcommandlist-getfeaturemask
     */
    GetFeatureMask() {
        result := ComCall(5, this, D3D12_DEBUG_FEATURE)
        return result
    }

    Query(iid) {
        if (ID3D12DebugCommandList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AssertResourceState := CallbackCreate(GetMethod(implObj, "AssertResourceState"), flags, 4)
        this.vtbl.SetFeatureMask := CallbackCreate(GetMethod(implObj, "SetFeatureMask"), flags, 2)
        this.vtbl.GetFeatureMask := CallbackCreate(GetMethod(implObj, "GetFeatureMask"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AssertResourceState)
        CallbackFree(this.vtbl.SetFeatureMask)
        CallbackFree(this.vtbl.GetFeatureMask)
    }
}

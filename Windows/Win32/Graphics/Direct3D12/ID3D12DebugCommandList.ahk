#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to monitor and debug a command list.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nn-d3d12sdklayers-id3d12debugcommandlist
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12DebugCommandList extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12DebugCommandList
     * @type {Guid}
     */
    static IID => Guid("{09e0bf36-54ac-484f-8847-4baeeab6053f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AssertResourceState", "SetFeatureMask", "GetFeatureMask"]

    /**
     * Checks whether a resource, or subresource, is in a specified state, or not.
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
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12debugcommandlist-assertresourcestate
     */
    AssertResourceState(pResource, Subresource, State) {
        result := ComCall(3, this, "ptr", pResource, "uint", Subresource, "uint", State, "int")
        return result
    }

    /**
     * Turns the debug features for a command list on or off.
     * @param {Integer} Mask Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_feature">D3D12_DEBUG_FEATURE</a></b>
     * 
     * A combination of feature-mask flags that are combined by using a bitwise OR operation. If a flag is present, that feature will be set to on, otherwise the feature will be set to off.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12debugcommandlist-setfeaturemask
     */
    SetFeatureMask(Mask) {
        result := ComCall(4, this, "int", Mask, "HRESULT")
        return result
    }

    /**
     * Returns the debug feature flags that have been set on a command list.
     * @returns {Integer} Type: <b><a href="/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_feature">D3D12_DEBUG_FEATURE</a></b>
     * 
     * A bit mask containing the set debug features.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12debugcommandlist-getfeaturemask
     */
    GetFeatureMask() {
        result := ComCall(5, this, "int")
        return result
    }
}

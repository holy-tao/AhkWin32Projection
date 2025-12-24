#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface enables modification of additional command list debug layer settings.
 * @remarks
 * 
 * This interface is currently in Preview mode.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nn-d3d12sdklayers-id3d12debugcommandlist1
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12DebugCommandList1 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12DebugCommandList1
     * @type {Guid}
     */
    static IID => Guid("{102ca951-311b-4b01-b11f-ecb83e061b37}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AssertResourceState", "SetDebugParameter", "GetDebugParameter"]

    /**
     * Validates that the given state matches the state of the subresource, assuming the state of the given subresource is known during recording of a command list (e.g.
     * @param {ID3D12Resource} pResource Type: <b>ID3D12Resource*</b>
     * 
     * Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a> to check.
     * @param {Integer} Subresource Type: <b>UINT</b>
     * 
     * The index of the subresource to check. This can be set to an index, or D3D12_RESOURCE_BARRIER_ALL_SUBRESOURCES.
     * @param {Integer} State Type: <b>UINT</b>
     * 
     * Specifies the state to check for. This can be one or more <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATES</a> flags Or'ed together.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * This method returns <b>true</b> if the tracked state of the resource or subresource matches the specified state, <b>false</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12debugcommandlist1-assertresourcestate
     */
    AssertResourceState(pResource, Subresource, State) {
        result := ComCall(3, this, "ptr", pResource, "uint", Subresource, "uint", State, "int")
        return result
    }

    /**
     * Modifies optional Debug Layer settings of a command list.
     * @param {Integer} Type Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_command_list_parameter_type">D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE</a></b>
     * 
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_command_list_parameter_type">D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE</a> value that indicates which debug parameter data to set.
     * @param {Pointer} pData Type: <b>const void*</b>
     * 
     * Pointer to debug parameter data to set.  The interpretation of this data depends on the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_command_list_parameter_type">D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE</a> given in the <i>Type</i> parameter.
     * @param {Integer} DataSize Type: <b>UINT</b>
     * 
     * Specifies the size in bytes of the debug parameter <i>pData</i>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12debugcommandlist1-setdebugparameter
     */
    SetDebugParameter(Type, pData, DataSize) {
        result := ComCall(4, this, "int", Type, "ptr", pData, "uint", DataSize, "HRESULT")
        return result
    }

    /**
     * Gets optional Command List Debug Layer settings.
     * @param {Integer} Type Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_command_list_parameter_type">D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE</a></b>
     * 
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_command_list_parameter_type">D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE</a> value that determines which debug parameter data to copy to the memory pointed to by <i>pData</i>.
     * @param {Pointer} pData Type: <b>void*</b>
     * 
     * Points to the memory that will be filled with a copy of the debug parameter data. The interpretation of this data depends on the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_command_list_parameter_type">D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE</a> given in the <i>Type</i> parameter.
     * @param {Integer} DataSize Type: <b>UINT</b>
     * 
     * Size in bytes of the memory buffer pointed to by <i>pData</i>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if successful, otherwise E_INVALIDARG.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12debugcommandlist1-getdebugparameter
     */
    GetDebugParameter(Type, pData, DataSize) {
        result := ComCall(5, this, "int", Type, "ptr", pData, "uint", DataSize, "HRESULT")
        return result
    }
}

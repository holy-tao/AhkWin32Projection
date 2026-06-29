#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE.ahk" { D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * This interface enables modification of additional command list debug layer settings.
 * @remarks
 * This interface is currently in Preview mode.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debugcommandlist1
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12DebugCommandList1 extends IUnknown {
    /**
     * The interface identifier for ID3D12DebugCommandList1
     * @type {Guid}
     */
    static IID := Guid("{102ca951-311b-4b01-b11f-ecb83e061b37}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12DebugCommandList1 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AssertResourceState : IntPtr
        SetDebugParameter   : IntPtr
        GetDebugParameter   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12DebugCommandList1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Validates that the given state matches the state of the subresource, assuming the state of the given subresource is known during recording of a command list (e.g.
     * @remarks
     * Since execution of command lists occurs sometime after recording, the state of a resource often cannot be known during command list recording.  <b>AssertResourceState</b> gives an application developer the ability to impose an assumed state on a resource or subresource at a fixed recording point in a command list.
     * 
     * Often the state of a resource or subresource can either be known due to a previous barrier or inferred-by-use (for example, was used in an earlier call to <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-copybufferregion">CopyBufferRegion</a>) during command list recording.  In such cases <b>AssertResourceState</b> can produce a debug message if the given state does not match the known or assumed state.
     * 
     * This API is for debug validation only and does not affect the actual runtime or GPU state of the resource.
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugcommandlist1-assertresourcestate
     */
    AssertResourceState(pResource, Subresource, State) {
        result := ComCall(3, this, "ptr", pResource, "uint", Subresource, "uint", State, BOOL)
        return result
    }

    /**
     * Modifies optional Debug Layer settings of a command list.
     * @remarks
     * Certain debug behaviors of D3D12 Debug Layer can be modified by setting debug parameters.  These can be used to toggle extra validation or expose experimental debug features.
     * 
     * <b>ID3D12DebugCommandList1::SetDebugParameter</b> only impacts debug settings for the associated command list.  For device-wide debug parameters see the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugdevice1-setdebugparameter">ID3D12DebugDevice1::SetDebugParameter</a> method.
     * 
     * Resetting a command list restores the debug parameters to the default values.  This is because a command list reset is treated as equivalent to creating a new command list.
     * @param {D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE} Type Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_command_list_parameter_type">D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE</a></b>
     * 
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_command_list_parameter_type">D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE</a> value that indicates which debug parameter data to set.
     * @param {Integer} pData Type: <b>const void*</b>
     * 
     * Pointer to debug parameter data to set.  The interpretation of this data depends on the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_command_list_parameter_type">D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE</a> given in the <i>Type</i> parameter.
     * @param {Integer} DataSize Type: <b>UINT</b>
     * 
     * Specifies the size in bytes of the debug parameter <i>pData</i>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="https://docs.microsoft.com/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugcommandlist1-setdebugparameter
     */
    SetDebugParameter(Type, pData, DataSize) {
        result := ComCall(4, this, D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE, Type, "ptr", pData, "uint", DataSize, "HRESULT")
        return result
    }

    /**
     * Gets optional Command List Debug Layer settings.
     * @param {D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE} Type Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_command_list_parameter_type">D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE</a></b>
     * 
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_command_list_parameter_type">D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE</a> value that determines which debug parameter data to copy to the memory pointed to by <i>pData</i>.
     * @param {Integer} pData Type: <b>void*</b>
     * 
     * Points to the memory that will be filled with a copy of the debug parameter data. The interpretation of this data depends on the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_command_list_parameter_type">D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE</a> given in the <i>Type</i> parameter.
     * @param {Integer} DataSize Type: <b>UINT</b>
     * 
     * Size in bytes of the memory buffer pointed to by <i>pData</i>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if successful, otherwise E_INVALIDARG.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugcommandlist1-getdebugparameter
     */
    GetDebugParameter(Type, pData, DataSize) {
        result := ComCall(5, this, D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE, Type, "ptr", pData, "uint", DataSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3D12DebugCommandList1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AssertResourceState := CallbackCreate(GetMethod(implObj, "AssertResourceState"), flags, 4)
        this.vtbl.SetDebugParameter := CallbackCreate(GetMethod(implObj, "SetDebugParameter"), flags, 4)
        this.vtbl.GetDebugParameter := CallbackCreate(GetMethod(implObj, "GetDebugParameter"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AssertResourceState)
        CallbackFree(this.vtbl.SetDebugParameter)
        CallbackFree(this.vtbl.GetDebugParameter)
    }
}

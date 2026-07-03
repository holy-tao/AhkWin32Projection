#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_COMMAND_LIST_TYPE.ahk" { D3D12_COMMAND_LIST_TYPE }
#Import ".\ID3D12DeviceChild.ahk" { ID3D12DeviceChild }

/**
 * An interface from which ID3D12GraphicsCommandList inherits from. It represents an ordered set of commands that the GPU executes, while allowing for extension to support other command lists than just those for graphics (such as compute and copy).
 * @remarks
 * Use <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createcommandlist">ID3D12Device::CreateCommandList</a> to create a command list object.
 *       
 * 
 * See also <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12graphicscommandlist">ID3D12GraphicsCommandList</a>, which derives from ID3D12CommandList.
 *       
 * 
 * A command list corresponds to a set of commands that the graphics processing unit (GPU) executes.  Commands set state, draw, clear, copy, and so on.  
 * 
 * Direct3D 12 command lists only support these 2 levels of indirection:
 *           
 * 
 * <ul>
 * <li>A direct command list corresponds to a command buffer that the GPU can execute.
 *           </li>
 * <li>A bundle can be executed only directly via a direct command list.
 *           </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12commandlist
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12CommandList extends ID3D12DeviceChild {
    /**
     * The interface identifier for ID3D12CommandList
     * @type {Guid}
     */
    static IID := Guid("{7116d91c-e7e4-47ce-b8c6-ec8168f437e5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12CommandList interfaces
    */
    struct Vtbl extends ID3D12DeviceChild.Vtbl {
        GetType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12CommandList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the type of the command list, such as direct, bundle, compute, or copy.
     * @returns {D3D12_COMMAND_LIST_TYPE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_command_list_type">D3D12_COMMAND_LIST_TYPE</a></b>
     * 
     * This method returns the type of the command list, 
     *             as a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_command_list_type">D3D12_COMMAND_LIST_TYPE</a> enumeration constant, 
     *             such as direct, bundle, compute, or copy.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12commandlist-gettype
     */
    GetType() {
        result := ComCall(8, this, D3D12_COMMAND_LIST_TYPE)
        return result
    }

    Query(iid) {
        if (ID3D12CommandList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetType := CallbackCreate(GetMethod(implObj, "GetType"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetType)
    }
}

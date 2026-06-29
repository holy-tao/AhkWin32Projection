#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_META_COMMAND_PARAMETER_STAGE.ahk" { D3D12_META_COMMAND_PARAMETER_STAGE }
#Import ".\ID3D12Pageable.ahk" { ID3D12Pageable }

/**
 * Represents a meta command. A meta command is a Direct3D 12 object representing an algorithm that is accelerated by independent hardware vendors (IHVs). It's an opaque reference to a command generator that is implemented by the driver.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12metacommand
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12MetaCommand extends ID3D12Pageable {
    /**
     * The interface identifier for ID3D12MetaCommand
     * @type {Guid}
     */
    static IID := Guid("{dbb84c27-36ce-4fc9-b801-f048c46ac570}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12MetaCommand interfaces
    */
    struct Vtbl extends ID3D12Pageable.Vtbl {
        GetRequiredParameterResourceSize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12MetaCommand.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the amount of memory required for the specified runtime parameter resource for a meta command, for the specified stage.
     * @param {D3D12_META_COMMAND_PARAMETER_STAGE} Stage Type: <b>D3D12_META_COMMAND_PARAMETER_STAGE</b>
     * 
     * A <b>D3D12_META_COMMAND_PARAMETER_STAGE</b> specifying the stage to which the parameter belongs.
     * @param {Integer} ParameterIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The zero-based index of the parameter within the stage.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * The number of bytes required for the  specified  runtime parameter resource.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12metacommand-getrequiredparameterresourcesize
     */
    GetRequiredParameterResourceSize(Stage, ParameterIndex) {
        result := ComCall(8, this, D3D12_META_COMMAND_PARAMETER_STAGE, Stage, "uint", ParameterIndex, Int64)
        return result
    }

    Query(iid) {
        if (ID3D12MetaCommand.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRequiredParameterResourceSize := CallbackCreate(GetMethod(implObj, "GetRequiredParameterResourceSize"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRequiredParameterResourceSize)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_WRITEBUFFERIMMEDIATE_PARAMETER.ahk" { D3D12_WRITEBUFFERIMMEDIATE_PARAMETER }
#Import ".\ID3D12GraphicsCommandList1.ahk" { ID3D12GraphicsCommandList1 }
#Import ".\D3D12_WRITEBUFFERIMMEDIATE_MODE.ahk" { D3D12_WRITEBUFFERIMMEDIATE_MODE }

/**
 * Encapsulates a list of graphics commands for rendering, extending the interface to support writing immediate values directly to a buffer.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12graphicscommandlist2
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12GraphicsCommandList2 extends ID3D12GraphicsCommandList1 {
    /**
     * The interface identifier for ID3D12GraphicsCommandList2
     * @type {Guid}
     */
    static IID := Guid("{38c3e585-ff17-412c-9150-4fc6f9d72a28}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12GraphicsCommandList2 interfaces
    */
    struct Vtbl extends ID3D12GraphicsCommandList1.Vtbl {
        WriteBufferImmediate : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12GraphicsCommandList2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Writes a number of 32-bit immediate values to the specified buffer locations directly from the command stream. (ID3D12GraphicsCommandList2.WriteBufferImmediate)
     * @remarks
     * <b>WriteBufferImmediate</b> performs <i>Count</i> number of 32-bit writes: one for each value and destination specified in <i>pParams</i>.
     * 
     * The receiving buffer (resource) must be in the <b>D3D12_RESOURCE_STATE_COPY_DEST</b> state to be a valid destination for <b>WriteBufferImmediate</b>.
     * @param {Integer} Count The number of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_writebufferimmediate_parameter">D3D12_WRITEBUFFERIMMEDIATE_PARAMETER</a> structures that are pointed to by <i>pParams</i> and <i>pModes</i>.
     * @param {Pointer<D3D12_WRITEBUFFERIMMEDIATE_PARAMETER>} pParams The address of an array containing a number of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_writebufferimmediate_parameter">D3D12_WRITEBUFFERIMMEDIATE_PARAMETER</a> structures equal to <i>Count</i>.
     * @param {Pointer<D3D12_WRITEBUFFERIMMEDIATE_MODE>} pModes The address of an array containing a number of  <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_writebufferimmediate_mode">D3D12_WRITEBUFFERIMMEDIATE_MODE</a> structures equal to <i>Count</i>. The default value is <b>null</b>; passing <b>null</b> causes the system to write all immediate values using <b>D3D12_WRITEBUFFERIMMEDIATE_MODE_DEFAULT</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist2-writebufferimmediate
     */
    WriteBufferImmediate(Count, pParams, pModes) {
        pModesMarshal := pModes is VarRef ? "int*" : "ptr"

        ComCall(66, this, "uint", Count, D3D12_WRITEBUFFERIMMEDIATE_PARAMETER.Ptr, pParams, pModesMarshal, pModes)
    }

    Query(iid) {
        if (ID3D12GraphicsCommandList2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.WriteBufferImmediate := CallbackCreate(GetMethod(implObj, "WriteBufferImmediate"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.WriteBufferImmediate)
    }
}

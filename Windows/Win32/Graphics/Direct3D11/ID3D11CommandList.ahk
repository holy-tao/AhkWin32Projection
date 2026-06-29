#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D11DeviceChild.ahk" { ID3D11DeviceChild }

/**
 * The ID3D11CommandList interface encapsulates a list of graphics commands for play back.
 * @remarks
 * There is no explicit creation method, simply declare an <b>ID3D11CommandList</b> interface, then call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-finishcommandlist">ID3D11DeviceContext::FinishCommandList</a> to record commands or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-executecommandlist">ID3D11DeviceContext::ExecuteCommandList</a> to play back commands.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11commandlist
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11CommandList extends ID3D11DeviceChild {
    /**
     * The interface identifier for ID3D11CommandList
     * @type {Guid}
     */
    static IID := Guid("{a24bc4d1-769e-43f7-8013-98ff566c18e2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11CommandList interfaces
    */
    struct Vtbl extends ID3D11DeviceChild.Vtbl {
        GetContextFlags : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11CommandList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the initialization flags associated with the deferred context that created the command list.
     * @remarks
     * The GetContextFlags method gets the flags that were supplied to the <i>ContextFlags</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createdeferredcontext">ID3D11Device::CreateDeferredContext</a>; however, the context flag is reserved for future use.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The context flag is reserved for future use and is always 0.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11commandlist-getcontextflags
     */
    GetContextFlags() {
        result := ComCall(7, this, UInt32)
        return result
    }

    Query(iid) {
        if (ID3D11CommandList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetContextFlags := CallbackCreate(GetMethod(implObj, "GetContextFlags"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetContextFlags)
    }
}

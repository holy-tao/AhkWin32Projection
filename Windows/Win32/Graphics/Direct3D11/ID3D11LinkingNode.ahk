#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * A linking-node interface is used for shader linking.
 * @remarks
 * To get a linking-node interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nf-d3d11shader-id3d11functionlinkinggraph-setinputsignature">ID3D11FunctionLinkingGraph::SetInputSignature</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nf-d3d11shader-id3d11functionlinkinggraph-setoutputsignature">ID3D11FunctionLinkingGraph::SetOutputSignature</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nf-d3d11shader-id3d11functionlinkinggraph-callfunction">ID3D11FunctionLinkingGraph::CallFunction</a>.
 *       
 * 
 * <div class="alert"><b>Note</b>  <b>ID3D11LinkingNode</b> requires the D3dcompiler_47.dll or a later version of the DLL.
 *       </div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/d3d11shader/nn-d3d11shader-id3d11linkingnode
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11LinkingNode extends IUnknown {
    /**
     * The interface identifier for ID3D11LinkingNode
     * @type {Guid}
     */
    static IID := Guid("{d80dd70c-8d2f-4751-94a1-03c79b3556db}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11LinkingNode interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11LinkingNode.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (ID3D11LinkingNode.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
    }
}

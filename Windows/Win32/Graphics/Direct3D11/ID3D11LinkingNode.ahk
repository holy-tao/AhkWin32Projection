#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A linking-node interface is used for shader linking.
 * @remarks
 * 
 * To get a linking-node interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nf-d3d11shader-id3d11functionlinkinggraph-setinputsignature">ID3D11FunctionLinkingGraph::SetInputSignature</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nf-d3d11shader-id3d11functionlinkinggraph-setoutputsignature">ID3D11FunctionLinkingGraph::SetOutputSignature</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nf-d3d11shader-id3d11functionlinkinggraph-callfunction">ID3D11FunctionLinkingGraph::CallFunction</a>.
 *       
 * 
 * <div class="alert"><b>Note</b>  <b>ID3D11LinkingNode</b> requires the D3dcompiler_47.dll or a later version of the DLL.
 *       </div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nn-d3d11shader-id3d11linkingnode
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11LinkingNode extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11LinkingNode
     * @type {Guid}
     */
    static IID => Guid("{d80dd70c-8d2f-4751-94a1-03c79b3556db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}

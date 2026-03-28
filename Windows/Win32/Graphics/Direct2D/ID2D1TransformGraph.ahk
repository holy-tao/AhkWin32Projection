#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a graph of transform nodes.
 * @remarks
 * This interface allows a graph of transform nodes to be specified. This interface is passed to <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectimpl-initialize">ID2D1EffectImpl::Initialize</a> to allow an effect implementation to specify a graph of transforms or a single transform.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1transformgraph
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1TransformGraph extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1TransformGraph
     * @type {Guid}
     */
    static IID => Guid("{13d29038-c3e6-4034-9081-13b53a417992}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInputCount", "SetSingleTransformNode", "AddNode", "RemoveNode", "SetOutputNode", "ConnectNode", "ConnectToEffectInput", "Clear", "SetPassthroughGraph"]

    /**
     * Returns the number of inputs to the transform graph.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * The number of inputs to this transform graph.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1transformgraph-getinputcount
     */
    GetInputCount() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * Sets a single transform node as being equivalent to the whole graph.
     * @remarks
     * This equivalent to calling <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1transformgraph-clear">ID2D1TransformGraph::Clear</a>, adding a single node, connecting all of the node inputs to the effect inputs in order, and setting the transform not as the graph output.
     * @param {ID2D1TransformNode} _node 
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>No error occurred</td>
     * </tr>
     * <tr>
     * <td>E_OUTOFMEMORY</td>
     * <td>Direct2D could not allocate sufficient memory to complete the call.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1transformgraph-setsingletransformnode
     */
    SetSingleTransformNode(_node) {
        result := ComCall(4, this, "ptr", _node, "HRESULT")
        return result
    }

    /**
     * Adds the provided node to the transform graph.
     * @remarks
     * This adds a transform node to the transform graph. A node must be added to the transform graph before it can be interconnected in any way.
     * 
     * 
     * A transform graph cannot be directly added to another transform graph. 
     * Only interfaces derived from <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1transformnode">ID2D1TransformNode</a> can be added to the transform graph.
     * @param {ID2D1TransformNode} _node 
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>No error occurred</td>
     * </tr>
     * <tr>
     * <td>E_OUTOFMEMORY</td>
     * <td>Direct2D could not allocate sufficient memory to complete the call.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1transformgraph-addnode
     */
    AddNode(_node) {
        result := ComCall(5, this, "ptr", _node, "HRESULT")
        return result
    }

    /**
     * Removes the provided node from the transform graph.
     * @remarks
     * The node must already exist in the graph; otherwise, the call fails with <b>D2DERR_NOT_FOUND</b>.
     * 
     * Any connections to this node will be removed when the node is removed.
     * 
     * After the node is removed, it cannot be used by the interface until it has been added to the graph by <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1transformgraph-addnode">AddNode</a>.
     * @param {ID2D1TransformNode} _node 
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>No error occurred</td>
     * </tr>
     * <tr>
     * <td>D2DERR_NOT_FOUND = (HRESULT_FROM_WIN32(ERROR_NOT_FOUND))</td>
     * <td>Direct2D could not locate the specified node.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1transformgraph-removenode
     */
    RemoveNode(_node) {
        result := ComCall(6, this, "ptr", _node, "HRESULT")
        return result
    }

    /**
     * Sets the output node for the transform graph.
     * @remarks
     * The node must already exist in the graph; otherwise, the call fails with <b>D2DERR_NOT_FOUND</b>.
     * @param {ID2D1TransformNode} _node 
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>No error occurred</td>
     * </tr>
     * <tr>
     * <td>D2DERR_NOT_FOUND = (HRESULT_FROM_WIN32(ERROR_NOT_FOUND))</td>
     * <td>Direct2D could not locate the specified node.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1transformgraph-setoutputnode
     */
    SetOutputNode(_node) {
        result := ComCall(7, this, "ptr", _node, "HRESULT")
        return result
    }

    /**
     * Connects two nodes inside the transform graph.
     * @remarks
     * Both nodes must already exist in the graph; otherwise, the call fails with <b>D2DERR_NOT_FOUND</b>.
     * @param {ID2D1TransformNode} fromNode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1transformnode">ID2D1TransformNode</a>*</b>
     * 
     * The node from which the connection will be made.
     * @param {ID2D1TransformNode} toNode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1transformnode">ID2D1TransformNode</a>*</b>
     * 
     * The node to which the connection will be made.
     * @param {Integer} toNodeInputIndex Type: <b>UINT32</b>
     * 
     * The node input that will be connected.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>No error occurred</td>
     * </tr>
     * <tr>
     * <td>D2DERR_NOT_FOUND = (HRESULT_FROM_WIN32(ERROR_NOT_FOUND))</td>
     * <td>Direct2D could not locate the specified node.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1transformgraph-connectnode
     */
    ConnectNode(fromNode, toNode, toNodeInputIndex) {
        result := ComCall(8, this, "ptr", fromNode, "ptr", toNode, "uint", toNodeInputIndex, "HRESULT")
        return result
    }

    /**
     * Connects a transform node inside the graph to the corresponding effect input of the encapsulating effect.
     * @param {Integer} toEffectInputIndex Type: <b>UINT32</b>
     * 
     * The effect input to which the transform node will be bound.
     * @param {ID2D1TransformNode} _node 
     * @param {Integer} toNodeInputIndex Type: <b>UINT32</b>
     * 
     * The node input that will be connected.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>No error occurred</td>
     * </tr>
     * <tr>
     * <td>D2DERR_NOT_FOUND = (HRESULT_FROM_WIN32(ERROR_NOT_FOUND))</td>
     * <td>Direct2D could not locate the specified node.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1transformgraph-connecttoeffectinput
     */
    ConnectToEffectInput(toEffectInputIndex, _node, toNodeInputIndex) {
        result := ComCall(9, this, "uint", toEffectInputIndex, "ptr", _node, "uint", toNodeInputIndex, "HRESULT")
        return result
    }

    /**
     * Clears the transform nodes and all connections from the transform graph.
     * @remarks
     * Used when enough changes to transfoms would make  editing of the transform graph inefficient.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1transformgraph-clear
     */
    Clear() {
        ComCall(10, this)
    }

    /**
     * Uses the specified input as the effect output.
     * @param {Integer} effectInputIndex The index of the input to the effect.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>No error occurred</td>
     * </tr>
     * <tr>
     * <td>D2DERR_NOT_FOUND = (HRESULT_FROM_WIN32(ERROR_NOT_FOUND))</td>
     * <td>Direct2D could not locate the specified node.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1transformgraph-setpassthroughgraph
     */
    SetPassthroughGraph(effectInputIndex) {
        result := ComCall(11, this, "uint", effectInputIndex, "HRESULT")
        return result
    }
}

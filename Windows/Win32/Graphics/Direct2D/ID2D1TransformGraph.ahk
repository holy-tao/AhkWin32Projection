#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a graph of transform nodes.
 * @remarks
 * 
  * This interface allows a graph of transform nodes to be specified. This interface is passed to <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectimpl-initialize">ID2D1EffectImpl::Initialize</a> to allow an effect implementation to specify a graph of transforms or a single transform.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nn-d2d1effectauthor-id2d1transformgraph
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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1transformgraph-getinputcount
     */
    GetInputCount() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * 
     * @param {ID2D1TransformNode} node 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1transformgraph-setsingletransformnode
     */
    SetSingleTransformNode(node) {
        result := ComCall(4, this, "ptr", node, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1TransformNode} node 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1transformgraph-addnode
     */
    AddNode(node) {
        result := ComCall(5, this, "ptr", node, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1TransformNode} node 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1transformgraph-removenode
     */
    RemoveNode(node) {
        result := ComCall(6, this, "ptr", node, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1TransformNode} node 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1transformgraph-setoutputnode
     */
    SetOutputNode(node) {
        result := ComCall(7, this, "ptr", node, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1TransformNode} fromNode 
     * @param {ID2D1TransformNode} toNode 
     * @param {Integer} toNodeInputIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1transformgraph-connectnode
     */
    ConnectNode(fromNode, toNode, toNodeInputIndex) {
        result := ComCall(8, this, "ptr", fromNode, "ptr", toNode, "uint", toNodeInputIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} toEffectInputIndex 
     * @param {ID2D1TransformNode} node 
     * @param {Integer} toNodeInputIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1transformgraph-connecttoeffectinput
     */
    ConnectToEffectInput(toEffectInputIndex, node, toNodeInputIndex) {
        result := ComCall(9, this, "uint", toEffectInputIndex, "ptr", node, "uint", toNodeInputIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1transformgraph-clear
     */
    Clear() {
        ComCall(10, this)
    }

    /**
     * 
     * @param {Integer} effectInputIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1transformgraph-setpassthroughgraph
     */
    SetPassthroughGraph(effectInputIndex) {
        result := ComCall(11, this, "uint", effectInputIndex, "HRESULT")
        return result
    }
}

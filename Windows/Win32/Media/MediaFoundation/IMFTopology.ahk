#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFTopologyNode.ahk
#Include .\IMFCollection.ahk
#Include .\IMFAttributes.ahk

/**
 * Represents a topology. A topology describes a collection of media sources, sinks, and transforms that are connected in a certain order.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imftopology
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTopology extends IMFAttributes{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFTopology
     * @type {Guid}
     */
    static IID => Guid("{83cf873a-f6da-4bc8-823f-bacfd55dc433}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 33

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTopologyID", "AddNode", "RemoveNode", "GetNodeCount", "GetNode", "Clear", "CloneFrom", "GetNodeByID", "GetSourceNodeCollection", "GetOutputNodeCollection"]

    /**
     * Gets the identifier of the topology.
     * @returns {Integer} Receives the identifier, as a <a href="https://docs.microsoft.com/windows/desktop/medfound/topoid">TOPOID</a> value.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imftopology-gettopologyid
     */
    GetTopologyID() {
        result := ComCall(33, this, "uint*", &pID := 0, "HRESULT")
        return pID
    }

    /**
     * Adds a node to the topology.
     * @param {IMFTopologyNode} pNode Pointer to the node's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopologynode">IMFTopologyNode</a> interface.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pNode</i> is invalid, possibly because the node already exists in the topology.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imftopology-addnode
     */
    AddNode(pNode) {
        result := ComCall(34, this, "ptr", pNode, "HRESULT")
        return result
    }

    /**
     * Removes a node from the topology.
     * @param {IMFTopologyNode} pNode Pointer to the node's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopologynode">IMFTopologyNode</a> interface.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified node is not a member of this topology.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imftopology-removenode
     */
    RemoveNode(pNode) {
        result := ComCall(35, this, "ptr", pNode, "HRESULT")
        return result
    }

    /**
     * Gets the number of nodes in the topology.
     * @returns {Integer} Receives the number of nodes.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imftopology-getnodecount
     */
    GetNodeCount() {
        result := ComCall(36, this, "ushort*", &pwNodes := 0, "HRESULT")
        return pwNodes
    }

    /**
     * Gets a node in the topology, specified by index.
     * @param {Integer} wIndex The zero-based index of the node. To get the number of nodes in the topology, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftopology-getnodecount">IMFTopology::GetNodeCount</a>.
     * @returns {IMFTopologyNode} Receives a pointer to the node's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopologynode">IMFTopologyNode</a> interface. The caller must release the pointer.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imftopology-getnode
     */
    GetNode(wIndex) {
        result := ComCall(37, this, "ushort", wIndex, "ptr*", &ppNode := 0, "HRESULT")
        return IMFTopologyNode(ppNode)
    }

    /**
     * Removes all nodes from the topology.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imftopology-clear
     */
    Clear() {
        result := ComCall(38, this, "HRESULT")
        return result
    }

    /**
     * Converts this topology into a copy of another topology.
     * @param {IMFTopology} pTopology A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopology">IMFTopology</a> interface of the topology to clone.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imftopology-clonefrom
     */
    CloneFrom(pTopology) {
        result := ComCall(39, this, "ptr", pTopology, "HRESULT")
        return result
    }

    /**
     * Gets a node in the topology, specified by node identifier.
     * @param {Integer} qwTopoNodeID The identifier of the node to retrieve. To get a node's identifier, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftopologynode-gettoponodeid">IMFTopologyNode::GetTopoNodeID</a>.
     * @returns {IMFTopologyNode} Receives a pointer to the node's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopologynode">IMFTopologyNode</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imftopology-getnodebyid
     */
    GetNodeByID(qwTopoNodeID) {
        result := ComCall(40, this, "uint", qwTopoNodeID, "ptr*", &ppNode := 0, "HRESULT")
        return IMFTopologyNode(ppNode)
    }

    /**
     * Gets the source nodes in the topology.
     * @returns {IMFCollection} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfcollection">IMFCollection</a> interface. The caller must release the pointer. The collection contains <b>IUnknown</b> pointers to all of the source nodes in the topology. Each pointer can be queried for the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopologynode">IMFTopologyNode</a> interface. The collection might be empty.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imftopology-getsourcenodecollection
     */
    GetSourceNodeCollection() {
        result := ComCall(41, this, "ptr*", &ppCollection := 0, "HRESULT")
        return IMFCollection(ppCollection)
    }

    /**
     * Gets the output nodes in the topology.
     * @returns {IMFCollection} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfcollection">IMFCollection</a> interface. The caller must release the pointer. The collection contains <b>IUnknown</b> pointers to all of the output nodes in the topology. Each pointer can be queried for the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopologynode">IMFTopologyNode</a> interface. The collection might be empty.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imftopology-getoutputnodecollection
     */
    GetOutputNodeCollection() {
        result := ComCall(42, this, "ptr*", &ppCollection := 0, "HRESULT")
        return IMFCollection(ppCollection)
    }
}

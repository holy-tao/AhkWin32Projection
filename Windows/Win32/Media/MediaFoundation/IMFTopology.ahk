#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFCollection.ahk" { IMFCollection }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFAttributes.ahk" { IMFAttributes }
#Import ".\IMFTopologyNode.ahk" { IMFTopologyNode }

/**
 * Represents a topology. A topology describes a collection of media sources, sinks, and transforms that are connected in a certain order.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imftopology
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFTopology extends IMFAttributes {
    /**
     * The interface identifier for IMFTopology
     * @type {Guid}
     */
    static IID := Guid("{83cf873a-f6da-4bc8-823f-bacfd55dc433}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFTopology interfaces
    */
    struct Vtbl extends IMFAttributes.Vtbl {
        GetTopologyID           : IntPtr
        AddNode                 : IntPtr
        RemoveNode              : IntPtr
        GetNodeCount            : IntPtr
        GetNode                 : IntPtr
        Clear                   : IntPtr
        CloneFrom               : IntPtr
        GetNodeByID             : IntPtr
        GetSourceNodeCollection : IntPtr
        GetOutputNodeCollection : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFTopology.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the identifier of the topology.
     * @returns {Integer} Receives the identifier, as a <a href="https://docs.microsoft.com/windows/desktop/medfound/topoid">TOPOID</a> value.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopology-gettopologyid
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopology-addnode
     */
    AddNode(pNode) {
        result := ComCall(34, this, "ptr", pNode, "HRESULT")
        return result
    }

    /**
     * Removes a node from the topology.
     * @remarks
     * This method does not destroy the node, so the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopologynode">IMFTopologyNode</a> pointer is still valid after the method returns.
     * 
     * The method breaks any connections between the specified node and other nodes.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopology-removenode
     */
    RemoveNode(pNode) {
        result := ComCall(35, this, "ptr", pNode, "HRESULT")
        return result
    }

    /**
     * Gets the number of nodes in the topology.
     * @returns {Integer} Receives the number of nodes.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopology-getnodecount
     */
    GetNodeCount() {
        result := ComCall(36, this, "ushort*", &pwNodes := 0, "HRESULT")
        return pwNodes
    }

    /**
     * Gets a node in the topology, specified by index.
     * @param {Integer} wIndex The zero-based index of the node. To get the number of nodes in the topology, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftopology-getnodecount">IMFTopology::GetNodeCount</a>.
     * @returns {IMFTopologyNode} Receives a pointer to the node's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopologynode">IMFTopologyNode</a> interface. The caller must release the pointer.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopology-getnode
     */
    GetNode(wIndex) {
        result := ComCall(37, this, "ushort", wIndex, "ptr*", &ppNode := 0, "HRESULT")
        return IMFTopologyNode(ppNode)
    }

    /**
     * Removes all nodes from the topology.
     * @remarks
     * You do not need to clear a topology before disposing of it. The <b>Clear</b> method is called automatically when the topology is destroyed.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopology-clear
     */
    Clear() {
        result := ComCall(38, this, "HRESULT")
        return result
    }

    /**
     * Converts this topology into a copy of another topology.
     * @remarks
     * This method does the following:
     * 
     * <ul>
     * <li>Removes all of the nodes from this topology.
     *           </li>
     * <li>Clones the nodes from <i>pTopology</i> and adds them to this topology. The cloned nodes have the same node identifiers as the nodes from <i>pTopology</i>.
     *           </li>
     * <li>Connects the cloned nodes to match the connections in <i>pTopology</i>.
     *           </li>
     * <li>Copies the attributes from <i>pTopology</i> to this topology.
     *           </li>
     * <li>Copies the topology identifier from <i>pTopology</i> to this topology.</li>
     * </ul>
     * @param {IMFTopology} pTopology A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopology">IMFTopology</a> interface of the topology to clone.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopology-clonefrom
     */
    CloneFrom(pTopology) {
        result := ComCall(39, this, "ptr", pTopology, "HRESULT")
        return result
    }

    /**
     * Gets a node in the topology, specified by node identifier.
     * @param {Integer} qwTopoNodeID The identifier of the node to retrieve. To get a node's identifier, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftopologynode-gettoponodeid">IMFTopologyNode::GetTopoNodeID</a>.
     * @returns {IMFTopologyNode} Receives a pointer to the node's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopologynode">IMFTopologyNode</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopology-getnodebyid
     */
    GetNodeByID(qwTopoNodeID) {
        result := ComCall(40, this, "uint", qwTopoNodeID, "ptr*", &ppNode := 0, "HRESULT")
        return IMFTopologyNode(ppNode)
    }

    /**
     * Gets the source nodes in the topology.
     * @returns {IMFCollection} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfcollection">IMFCollection</a> interface. The caller must release the pointer. The collection contains <b>IUnknown</b> pointers to all of the source nodes in the topology. Each pointer can be queried for the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopologynode">IMFTopologyNode</a> interface. The collection might be empty.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopology-getsourcenodecollection
     */
    GetSourceNodeCollection() {
        result := ComCall(41, this, "ptr*", &ppCollection := 0, "HRESULT")
        return IMFCollection(ppCollection)
    }

    /**
     * Gets the output nodes in the topology.
     * @returns {IMFCollection} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfcollection">IMFCollection</a> interface. The caller must release the pointer. The collection contains <b>IUnknown</b> pointers to all of the output nodes in the topology. Each pointer can be queried for the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopologynode">IMFTopologyNode</a> interface. The collection might be empty.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopology-getoutputnodecollection
     */
    GetOutputNodeCollection() {
        result := ComCall(42, this, "ptr*", &ppCollection := 0, "HRESULT")
        return IMFCollection(ppCollection)
    }

    Query(iid) {
        if (IMFTopology.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTopologyID := CallbackCreate(GetMethod(implObj, "GetTopologyID"), flags, 2)
        this.vtbl.AddNode := CallbackCreate(GetMethod(implObj, "AddNode"), flags, 2)
        this.vtbl.RemoveNode := CallbackCreate(GetMethod(implObj, "RemoveNode"), flags, 2)
        this.vtbl.GetNodeCount := CallbackCreate(GetMethod(implObj, "GetNodeCount"), flags, 2)
        this.vtbl.GetNode := CallbackCreate(GetMethod(implObj, "GetNode"), flags, 3)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 1)
        this.vtbl.CloneFrom := CallbackCreate(GetMethod(implObj, "CloneFrom"), flags, 2)
        this.vtbl.GetNodeByID := CallbackCreate(GetMethod(implObj, "GetNodeByID"), flags, 3)
        this.vtbl.GetSourceNodeCollection := CallbackCreate(GetMethod(implObj, "GetSourceNodeCollection"), flags, 2)
        this.vtbl.GetOutputNodeCollection := CallbackCreate(GetMethod(implObj, "GetOutputNodeCollection"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTopologyID)
        CallbackFree(this.vtbl.AddNode)
        CallbackFree(this.vtbl.RemoveNode)
        CallbackFree(this.vtbl.GetNodeCount)
        CallbackFree(this.vtbl.GetNode)
        CallbackFree(this.vtbl.Clear)
        CallbackFree(this.vtbl.CloneFrom)
        CallbackFree(this.vtbl.GetNodeByID)
        CallbackFree(this.vtbl.GetSourceNodeCollection)
        CallbackFree(this.vtbl.GetOutputNodeCollection)
    }
}

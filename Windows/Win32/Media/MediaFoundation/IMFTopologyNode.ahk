#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IMFMediaType.ahk
#Include .\IMFAttributes.ahk

/**
 * Represents a node in a topology.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imftopologynode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTopologyNode extends IMFAttributes{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFTopologyNode
     * @type {Guid}
     */
    static IID => Guid("{83cf873a-f6da-4bc8-823f-bacfd55dc430}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 33

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetObject", "GetObject", "GetNodeType", "GetTopoNodeID", "SetTopoNodeID", "GetInputCount", "GetOutputCount", "ConnectOutput", "DisconnectOutput", "GetInput", "GetOutput", "SetOutputPrefType", "GetOutputPrefType", "SetInputPrefType", "GetInputPrefType", "CloneFrom"]

    /**
     * Sets the object associated with this node.
     * @remarks
     * All node types support this method, but the object pointer is not used by every node type.
     * 
     * <table>
     * <tr>
     * <th>Node type</th>
     * <th>Object pointer</th>
     * </tr>
     * <tr>
     * <td>Source node.</td>
     * <td>Not used.</td>
     * </tr>
     * <tr>
     * <td>Transform node.</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nn-mftransform-imftransform">IMFTransform</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface.</td>
     * </tr>
     * <tr>
     * <td>Output node</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfstreamsink">IMFStreamSink</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface.</td>
     * </tr>
     * <tr>
     * <td>Tee node.</td>
     * <td>Not used.</td>
     * </tr>
     * </table>
     *  
     * 
     * If the object supports <b>IPersist</b>, <b>IPersistStorage</b>, or <b>IPersistPropertyBag</b>, the method gets the object's CLSID and sets the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-toponode-transform-objectid-attribute">MF_TOPONODE_TRANSFORM_OBJECTID</a> attribute on the node.
     * @param {IUnknown} pObject A pointer to the object's <b>IUnknown</b> interface. Use the value <b>NULL</b> to clear an object that was previous set.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynode-setobject
     */
    SetObject(pObject) {
        result := ComCall(33, this, "ptr", pObject, "HRESULT")
        return result
    }

    /**
     * Gets the object associated with this node.
     * @returns {IUnknown} Receives a pointer to the object's <b>IUnknown</b> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynode-getobject
     */
    GetObject() {
        result := ComCall(34, this, "ptr*", &ppObject := 0, "HRESULT")
        return IUnknown(ppObject)
    }

    /**
     * Retrieves the node type.
     * @returns {Integer} Receives the node type, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mf_topology_type">MF_TOPOLOGY_TYPE</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynode-getnodetype
     */
    GetNodeType() {
        result := ComCall(35, this, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * Retrieves the identifier of the node.
     * @remarks
     * When a node is first created, it is assigned an identifier. Node identifiers are unique within a topology, but can be reused across several topologies. The topology loader uses the identifier to look up nodes in the previous topology, so that it can reuse objects from the previous topology.
     *       
     * 
     * To find a node in a topology by its identifier, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftopology-getnodebyid">IMFTopology::GetNodeByID</a>.
     * @returns {Integer} Receives the identifier.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynode-gettoponodeid
     */
    GetTopoNodeID() {
        result := ComCall(36, this, "uint*", &pID := 0, "HRESULT")
        return pID
    }

    /**
     * Sets the identifier for the node.
     * @remarks
     * When a node is first created, it is assigned an identifier. Typically there is no reason for an application to override the identifier. Within a topology, each node identifier should be unique.
     * @param {Integer} ullTopoID The identifier for the node.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/medfound/topoid">TOPOID</a> has already been set for this object.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynode-settoponodeid
     */
    SetTopoNodeID(ullTopoID) {
        result := ComCall(37, this, "uint", ullTopoID, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of input streams that currently exist on this node.
     * @remarks
     * The input streams may or may not be connected to output streams on other nodes. To get the node that is connected to a specified input stream, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftopologynode-getinput">IMFTopologyNode::GetInput</a>.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftopologynode-connectoutput">IMFTopologyNode::ConnectOutput</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftopologynode-setinputpreftype">IMFTopologyNode::SetInputPrefType</a> methods add new input streams as needed.
     * @returns {Integer} Receives the number of input streams.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynode-getinputcount
     */
    GetInputCount() {
        result := ComCall(38, this, "uint*", &pcInputs := 0, "HRESULT")
        return pcInputs
    }

    /**
     * Retrieves the number of output streams that currently exist on this node.
     * @remarks
     * The output streams may or may not be connected to input streams on other nodes. To get the node that is connected to a specific output stream on this node, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftopologynode-getoutput">IMFTopologyNode::GetOutput</a>.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftopologynode-connectoutput">IMFTopologyNode::ConnectOutput</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftopologynode-setoutputpreftype">IMFTopologyNode::SetOutputPrefType</a> methods add new input streams as needed.
     * @returns {Integer} Receives the number of output streams.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynode-getoutputcount
     */
    GetOutputCount() {
        result := ComCall(39, this, "uint*", &pcOutputs := 0, "HRESULT")
        return pcOutputs
    }

    /**
     * Connects an output stream from this node to the input stream of another node.
     * @remarks
     * Node connections represent data flow from one node to the next. The streams are logical, and are specified by index.
     * 
     * If the node is already connected at the specified output, the method breaks the existing connection. If <i>dwOutputIndex</i> or <i>dwInputIndexOnDownstreamNode</i> specify streams that do not exist yet, the method adds as many streams as needed.
     * 
     * This method checks for certain invalid conditions:
     * 
     * <ul>
     * <li>
     * An output node cannot have any output connections. If you call this method on an output node, the method returns E_FAIL.
     * 
     * </li>
     * <li>
     * A node cannot be connected to itself. If <i>pDownstreamNode</i> specifies the same node as the method call, the method returns E_INVALIDARG.
     * 
     * </li>
     * </ul>
     * However, if the method succeeds, it does not guarantee that the node connection is valid. It is possible to create a partial topology that the topology loader cannot resolve. If so, the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftopoloader-load">IMFTopoLoader::Load</a> method will fail.
     * 
     * To break an existing node connection, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftopologynode-disconnectoutput">IMFTopologyNode::DisconnectOutput</a>.
     * @param {Integer} dwOutputIndex Zero-based index of the output stream on this node.
     * @param {IMFTopologyNode} pDownstreamNode Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopologynode">IMFTopologyNode</a> interface of the node to connect to.
     * @param {Integer} dwInputIndexOnDownstreamNode Zero-based index of the input stream on the other node.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed.
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
     * Invalid parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynode-connectoutput
     */
    ConnectOutput(dwOutputIndex, pDownstreamNode, dwInputIndexOnDownstreamNode) {
        result := ComCall(40, this, "uint", dwOutputIndex, "ptr", pDownstreamNode, "uint", dwInputIndexOnDownstreamNode, "HRESULT")
        return result
    }

    /**
     * Disconnects an output stream on this node.
     * @remarks
     * If the specified output stream is connected to another node, this method breaks the connection.
     * @param {Integer} dwOutputIndex Zero-based index of the output stream to disconnect.
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
     * The <i>dwOutputIndex</i> parameter is out of range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified output stream is not connected to another node.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynode-disconnectoutput
     */
    DisconnectOutput(dwOutputIndex) {
        result := ComCall(41, this, "uint", dwOutputIndex, "HRESULT")
        return result
    }

    /**
     * Retrieves the node that is connected to a specified input stream on this node.
     * @param {Integer} dwInputIndex Zero-based index of an input stream on this node.
     * @param {Pointer<IMFTopologyNode>} ppUpstreamNode Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopologynode">IMFTopologyNode</a> interface of the node that is connected to the specified input stream. The caller must release the interface.
     * @param {Pointer<Integer>} pdwOutputIndexOnUpstreamNode Receives the index of the output stream that is connected to this node's input stream.
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
     * The index is out of range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified input stream is not connected to another node.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynode-getinput
     */
    GetInput(dwInputIndex, ppUpstreamNode, pdwOutputIndexOnUpstreamNode) {
        pdwOutputIndexOnUpstreamNodeMarshal := pdwOutputIndexOnUpstreamNode is VarRef ? "uint*" : "ptr"

        result := ComCall(42, this, "uint", dwInputIndex, "ptr*", ppUpstreamNode, pdwOutputIndexOnUpstreamNodeMarshal, pdwOutputIndexOnUpstreamNode, "HRESULT")
        return result
    }

    /**
     * Retrieves the node that is connected to a specified output stream on this node.
     * @param {Integer} dwOutputIndex Zero-based index of an output stream on this node.
     * @param {Pointer<IMFTopologyNode>} ppDownstreamNode Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopologynode">IMFTopologyNode</a> interface of the node that is connected to the specified output stream. The caller must release the interface.
     * @param {Pointer<Integer>} pdwInputIndexOnDownstreamNode Receives the index of the input stream that is connected to this node's output stream.
     * @returns {HRESULT} The method returns an HRESULT. Possible values include, but are not limited to, those in the following table.
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
     * The index is out of range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified input stream is not connected to another node.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynode-getoutput
     */
    GetOutput(dwOutputIndex, ppDownstreamNode, pdwInputIndexOnDownstreamNode) {
        pdwInputIndexOnDownstreamNodeMarshal := pdwInputIndexOnDownstreamNode is VarRef ? "uint*" : "ptr"

        result := ComCall(43, this, "uint", dwOutputIndex, "ptr*", ppDownstreamNode, pdwInputIndexOnDownstreamNodeMarshal, pdwInputIndexOnDownstreamNode, "HRESULT")
        return result
    }

    /**
     * Sets the preferred media type for an output stream on this node.
     * @remarks
     * The preferred type is a hint for the topology loader.
     * 
     * Do not call this method after loading a topology or setting a topology on the Media Session. Changing the preferred type on a running topology can cause connection errors.
     * 
     * If no output stream exists at the specified index, the method creates new streams up to and including the specified index number.
     * 
     * Output nodes cannot have outputs. If this method is called on an output node, it returns E_NOTIMPL
     * @param {Integer} dwOutputIndex Zero-based index of the output stream.
     * @param {IMFMediaType} pType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type.
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This node is an output node.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynode-setoutputpreftype
     */
    SetOutputPrefType(dwOutputIndex, pType) {
        result := ComCall(44, this, "uint", dwOutputIndex, "ptr", pType, "HRESULT")
        return result
    }

    /**
     * Retrieves the preferred media type for an output stream on this node.
     * @remarks
     * Output nodes cannot have outputs. If this method is called on an output node, it returns E_NOTIMPL.
     * 
     * The preferred output type provides a hint to the topology loader. In a fully resolved topology, there is no guarantee that every topology node will have a preferred output type. To get the actual media type for a node, you must get a pointer to the node's underlying object. (For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mf_topology_type">MF_TOPOLOGY_TYPE</a> enumeration.)
     * @param {Integer} dwOutputIndex Zero-based index of the output stream.
     * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynode-getoutputpreftype
     */
    GetOutputPrefType(dwOutputIndex) {
        result := ComCall(45, this, "uint", dwOutputIndex, "ptr*", &ppType := 0, "HRESULT")
        return IMFMediaType(ppType)
    }

    /**
     * Sets the preferred media type for an input stream on this node.
     * @remarks
     * The preferred type is a hint for the topology loader.
     * 
     * Do not call this method after loading a topology or setting a topology on the Media Session. Changing the preferred type on a running topology can cause connection errors.
     * 
     * If no input stream exists at the specified index, the method creates new streams up to and including the specified index number.
     * 
     * Source nodes cannot have inputs. If this method is called on a source node, it returns E_NOTIMPL.
     * @param {Integer} dwInputIndex Zero-based index of the input stream.
     * @param {IMFMediaType} pType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type.
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This node is a source node.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynode-setinputpreftype
     */
    SetInputPrefType(dwInputIndex, pType) {
        result := ComCall(46, this, "uint", dwInputIndex, "ptr", pType, "HRESULT")
        return result
    }

    /**
     * Retrieves the preferred media type for an input stream on this node.
     * @remarks
     * Source nodes cannot have inputs. If this method is called on a source node, it returns E_NOTIMPL.
     * 
     * The preferred input type provides a hint to the topology loader. In a fully resolved topology, there is no guarantee that every topology node will have a preferred input type. To get the actual media type for a node, you must get a pointer to the node's underlying object. (For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mf_topology_type">MF_TOPOLOGY_TYPE</a> enumeration.)
     * @param {Integer} dwInputIndex Zero-based index of the input stream.
     * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynode-getinputpreftype
     */
    GetInputPrefType(dwInputIndex) {
        result := ComCall(47, this, "uint", dwInputIndex, "ptr*", &ppType := 0, "HRESULT")
        return IMFMediaType(ppType)
    }

    /**
     * Copies the data from another topology node into this node.
     * @remarks
     * The two nodes must have the same node type. To get the node type, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftopologynode-getnodetype">IMFTopologyNode::GetNodeType</a>.
     *       
     * 
     * This method copies the object pointer, preferred types, and attributes from <i>pNode</i> to this node. It also copies the <a href="https://docs.microsoft.com/windows/desktop/medfound/topoid">TOPOID</a> that uniquely identifies each node in a topology. It does not duplicate any of the connections from <i>pNode</i> to other nodes.
     *       
     * 
     * The purpose of this method is to copy nodes from one topology to another. Do not use duplicate nodes within the same topology.
     * @param {IMFTopologyNode} pNode A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopologynode">IMFTopologyNode</a> interface of the node to copy.
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
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The node types do not match.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynode-clonefrom
     */
    CloneFrom(pNode) {
        result := ComCall(48, this, "ptr", pNode, "HRESULT")
        return result
    }
}

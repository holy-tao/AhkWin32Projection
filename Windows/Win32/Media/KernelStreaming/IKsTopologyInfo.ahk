#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSTOPOLOGY_CONNECTION.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IKsTopologyInfo interface enumerates the nodes in a stream class driver. The KsProxy filter exposes this interface. Applications can use this interface to examine the internal topology of a kernel-mode filter.
 * @remarks
 * 
 * In the Windows Driver Model, a kernel-streaming (KS) filter contains one or more <i>nodes</i>. Each node encapsulates a processing task that is applied to the stream. Nodes have inputs and outputs, which connect either to other nodes in the filter, or else to the filter's pins. In this way, the nodes resemble a miniature "filter graph" inside the filter, which may contain several possible data paths. Applications can use the <c>IKsTopologyInfo</c> interface to get information about the nodes and the node connections.
 * 
 * <img alt="KsFilter nodes" border="0" src="./images/ksproxynodes.png"/>
 * 
 * Some devices also support the <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nn-vidcap-iselector">ISelector</a> interface for selecting input nodes. For example, if a video capture device has a camera and a tape transport, these could be represented as two nodes (see the previous diagram).
 * 
 * Include Vidcap.h from the Windows SDK or from the DirectX 9.0 SDK Update (Summer 2004) or later.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vidcap/nn-vidcap-ikstopologyinfo
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsTopologyInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKsTopologyInfo
     * @type {Guid}
     */
    static IID => Guid("{720d4ac0-7533-11d0-a5d6-28db04c10000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NumCategories", "get_Category", "get_NumConnections", "get_ConnectionInfo", "get_NodeName", "get_NumNodes", "get_NodeType", "CreateNodeInstance"]

    /**
     * @type {Integer} 
     */
    NumCategories {
        get => this.get_NumCategories()
    }

    /**
     * @type {Integer} 
     */
    NumConnections {
        get => this.get_NumConnections()
    }

    /**
     * @type {Integer} 
     */
    NumNodes {
        get => this.get_NumNodes()
    }

    /**
     * The get_NumCategories method returns the number of categories for this filter.
     * @returns {Integer} Receives the number of categories.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ikstopologyinfo-get_numcategories
     */
    get_NumCategories() {
        result := ComCall(3, this, "uint*", &pdwNumCategories := 0, "HRESULT")
        return pdwNumCategories
    }

    /**
     * The get_Category method returns one of the filter categories for this stream class driver.
     * @param {Integer} dwIndex Index of the category GUID to retrieve. To find the number of categories, call the <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-ikstopologyinfo-get_numcategories">IKsTopologyInfo::get_NumCategories</a> method.
     * @returns {Guid} Receives a GUID that defines the category. Microsoft provides standard categories in the header files Ks.h and Ksmedia.h.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ikstopologyinfo-get_category
     */
    get_Category(dwIndex) {
        pCategory := Guid()
        result := ComCall(4, this, "uint", dwIndex, "ptr", pCategory, "HRESULT")
        return pCategory
    }

    /**
     * The get_NumConnections method returns the number of node connections within the filter.
     * @returns {Integer} Receives the number of connections.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ikstopologyinfo-get_numconnections
     */
    get_NumConnections() {
        result := ComCall(5, this, "uint*", &pdwNumConnections := 0, "HRESULT")
        return pdwNumConnections
    }

    /**
     * The get_ConnectionInfo method returns information about one node connection in the filter.
     * @param {Integer} dwIndex Index of the connection. To find the number of connections, call the <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-ikstopologyinfo-get_numconnections">IKsTopologyInfo::get_NumConnections</a> method.
     * @returns {KSTOPOLOGY_CONNECTION} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/DirectShow/kstopology-connection">KSTOPOLOGY_CONNECTION</a> structure allocated by the caller. The method fills in this structure with the connection information.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ikstopologyinfo-get_connectioninfo
     */
    get_ConnectionInfo(dwIndex) {
        pConnectionInfo := KSTOPOLOGY_CONNECTION()
        result := ComCall(6, this, "uint", dwIndex, "ptr", pConnectionInfo, "HRESULT")
        return pConnectionInfo
    }

    /**
     * The get_NodeName method returns the name of the node.
     * @param {Integer} dwNodeId Index of the node. To find the number of nodes, call the <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-ikstopologyinfo-get_numnodes">IKsTopologyInfo::get_NumNodes</a> method.
     * @param {Pointer} pwchNodeName Pointer to a wide-character array that receives the name. To find the required buffer size, set this parameter to <b>NULL</b>. The size is returned in the <i>pdwNameLen</i> parameter.
     * @param {Integer} dwBufSize Size of the <i>pwchNodeName</i> array, in bytes.
     * @returns {Integer} Receives the buffer size required to hold the name, in bytes. This parameter cannot be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ikstopologyinfo-get_nodename
     */
    get_NodeName(dwNodeId, pwchNodeName, dwBufSize) {
        result := ComCall(7, this, "uint", dwNodeId, "ptr", pwchNodeName, "uint", dwBufSize, "uint*", &pdwNameLen := 0, "HRESULT")
        return pdwNameLen
    }

    /**
     * The get_NumNodes method returns the number of nodes in the filter.
     * @returns {Integer} Receives the number of nodes.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ikstopologyinfo-get_numnodes
     */
    get_NumNodes() {
        result := ComCall(8, this, "uint*", &pdwNumNodes := 0, "HRESULT")
        return pdwNumNodes
    }

    /**
     * The get_NodeType method returns the node type for a given node.
     * @param {Integer} dwNodeId Index of the node. To find the number of nodes, call the <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-ikstopologyinfo-get_numnodes">IKsTopologyInfo::get_NumNodes</a> method.
     * @returns {Guid} Receives a GUID that defines the node type. For a list of node types, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/ks-node-types">KS Node Types</a>.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ikstopologyinfo-get_nodetype
     */
    get_NodeType(dwNodeId) {
        pNodeType := Guid()
        result := ComCall(9, this, "uint", dwNodeId, "ptr", pNodeType, "HRESULT")
        return pNodeType
    }

    /**
     * The CreateNodeInstance method creates a COM object that represents a node in the filter.
     * @param {Integer} dwNodeId Index of the node to create. To find the number of nodes, call the <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-ikstopologyinfo-get_numnodes">IKsTopologyInfo::get_NumNodes</a> method.
     * @param {Pointer<Guid>} iid Interface identifier (IID) of the interface to return.
     * @returns {Pointer<Void>} Receives a pointer to the requested interface on the node object. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ikstopologyinfo-createnodeinstance
     */
    CreateNodeInstance(dwNodeId, iid) {
        result := ComCall(10, this, "uint", dwNodeId, "ptr", iid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }
}

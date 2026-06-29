#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\KSTOPOLOGY_CONNECTION.ahk" { KSTOPOLOGY_CONNECTION }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IKsTopologyInfo interface enumerates the nodes in a stream class driver. The KsProxy filter exposes this interface. Applications can use this interface to examine the internal topology of a kernel-mode filter.
 * @remarks
 * In the Windows Driver Model, a kernel-streaming (KS) filter contains one or more <i>nodes</i>. Each node encapsulates a processing task that is applied to the stream. Nodes have inputs and outputs, which connect either to other nodes in the filter, or else to the filter's pins. In this way, the nodes resemble a miniature "filter graph" inside the filter, which may contain several possible data paths. Applications can use the <c>IKsTopologyInfo</c> interface to get information about the nodes and the node connections.
 * 
 * <img alt="KsFilter nodes" border="0" src="./images/ksproxynodes.png"/>
 * 
 * Some devices also support the <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nn-vidcap-iselector">ISelector</a> interface for selecting input nodes. For example, if a video capture device has a camera and a tape transport, these could be represented as two nodes (see the previous diagram).
 * 
 * Include Vidcap.h from the Windows SDK or from the DirectX 9.0 SDK Update (Summer 2004) or later.
 * @see https://learn.microsoft.com/windows/win32/api/vidcap/nn-vidcap-ikstopologyinfo
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct IKsTopologyInfo extends IUnknown {
    /**
     * The interface identifier for IKsTopologyInfo
     * @type {Guid}
     */
    static IID := Guid("{720d4ac0-7533-11d0-a5d6-28db04c10000}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IKsTopologyInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_NumCategories  : IntPtr
        get_Category       : IntPtr
        get_NumConnections : IntPtr
        get_ConnectionInfo : IntPtr
        get_NodeName       : IntPtr
        get_NumNodes       : IntPtr
        get_NodeType       : IntPtr
        CreateNodeInstance : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IKsTopologyInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ikstopologyinfo-get_numcategories
     */
    get_NumCategories() {
        result := ComCall(3, this, "uint*", &pdwNumCategories := 0, "HRESULT")
        return pdwNumCategories
    }

    /**
     * The get_Category method returns one of the filter categories for this stream class driver.
     * @param {Integer} dwIndex Index of the category GUID to retrieve. To find the number of categories, call the <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-ikstopologyinfo-get_numcategories">IKsTopologyInfo::get_NumCategories</a> method.
     * @returns {Guid} Receives a GUID that defines the category. Microsoft provides standard categories in the header files Ks.h and Ksmedia.h.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ikstopologyinfo-get_category
     */
    get_Category(dwIndex) {
        pCategory := Guid()
        result := ComCall(4, this, "uint", dwIndex, Guid.Ptr, pCategory, "HRESULT")
        return pCategory
    }

    /**
     * The get_NumConnections method returns the number of node connections within the filter.
     * @remarks
     * To get information about the connections, call the <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-ikstopologyinfo-get_connectioninfo">IKsTopologyInfo::get_ConnectionInfo</a> method.
     * @returns {Integer} Receives the number of connections.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ikstopologyinfo-get_numconnections
     */
    get_NumConnections() {
        result := ComCall(5, this, "uint*", &pdwNumConnections := 0, "HRESULT")
        return pdwNumConnections
    }

    /**
     * The get_ConnectionInfo method returns information about one node connection in the filter.
     * @param {Integer} dwIndex Index of the connection. To find the number of connections, call the <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-ikstopologyinfo-get_numconnections">IKsTopologyInfo::get_NumConnections</a> method.
     * @returns {KSTOPOLOGY_CONNECTION} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/DirectShow/kstopology-connection">KSTOPOLOGY_CONNECTION</a> structure allocated by the caller. The method fills in this structure with the connection information.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ikstopologyinfo-get_connectioninfo
     */
    get_ConnectionInfo(dwIndex) {
        pConnectionInfo := KSTOPOLOGY_CONNECTION()
        result := ComCall(6, this, "uint", dwIndex, KSTOPOLOGY_CONNECTION.Ptr, pConnectionInfo, "HRESULT")
        return pConnectionInfo
    }

    /**
     * The get_NodeName method returns the name of the node.
     * @remarks
     * To find the buffer size for the name, call the method once with <b>NULL</b> for the <i>pwchNodeName</i> parameter and zero for the <i>dwBufSize</i> parameter. The method returns the buffer size in <i>pdwNameLen</i>. The method's return value, in this case, is HRESULT_FROM_WIN32(ERROR_MORE_DATA). Then allocate the array and call the method again.
     * @param {Integer} dwNodeId Index of the node. To find the number of nodes, call the <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-ikstopologyinfo-get_numnodes">IKsTopologyInfo::get_NumNodes</a> method.
     * @param {Integer} pwchNodeName Pointer to a wide-character array that receives the name. To find the required buffer size, set this parameter to <b>NULL</b>. The size is returned in the <i>pdwNameLen</i> parameter.
     * @param {Integer} dwBufSize Size of the <i>pwchNodeName</i> array, in bytes.
     * @returns {Integer} Receives the buffer size required to hold the name, in bytes. This parameter cannot be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ikstopologyinfo-get_nodename
     */
    get_NodeName(dwNodeId, pwchNodeName, dwBufSize) {
        result := ComCall(7, this, "uint", dwNodeId, "ptr", pwchNodeName, "uint", dwBufSize, "uint*", &pdwNameLen := 0, "HRESULT")
        return pdwNameLen
    }

    /**
     * The get_NumNodes method returns the number of nodes in the filter.
     * @returns {Integer} Receives the number of nodes.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ikstopologyinfo-get_numnodes
     */
    get_NumNodes() {
        result := ComCall(8, this, "uint*", &pdwNumNodes := 0, "HRESULT")
        return pdwNumNodes
    }

    /**
     * The get_NodeType method returns the node type for a given node.
     * @param {Integer} dwNodeId Index of the node. To find the number of nodes, call the <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-ikstopologyinfo-get_numnodes">IKsTopologyInfo::get_NumNodes</a> method.
     * @returns {Guid} Receives a GUID that defines the node type. For a list of node types, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/ks-node-types">KS Node Types</a>.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ikstopologyinfo-get_nodetype
     */
    get_NodeType(dwNodeId) {
        pNodeType := Guid()
        result := ComCall(9, this, "uint", dwNodeId, Guid.Ptr, pNodeType, "HRESULT")
        return pNodeType
    }

    /**
     * The CreateNodeInstance method creates a COM object that represents a node in the filter.
     * @remarks
     * Node objects expose the <b>IKsControl</b> interface. You can use this interface to enumerate and access the node's property sets.
     * @param {Integer} dwNodeId Index of the node to create. To find the number of nodes, call the <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-ikstopologyinfo-get_numnodes">IKsTopologyInfo::get_NumNodes</a> method.
     * @param {Pointer<Guid>} iid Interface identifier (IID) of the interface to return.
     * @returns {Pointer<Void>} Receives a pointer to the requested interface on the node object. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ikstopologyinfo-createnodeinstance
     */
    CreateNodeInstance(dwNodeId, iid) {
        result := ComCall(10, this, "uint", dwNodeId, Guid.Ptr, iid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }

    Query(iid) {
        if (IKsTopologyInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_NumCategories := CallbackCreate(GetMethod(implObj, "get_NumCategories"), flags, 2)
        this.vtbl.get_Category := CallbackCreate(GetMethod(implObj, "get_Category"), flags, 3)
        this.vtbl.get_NumConnections := CallbackCreate(GetMethod(implObj, "get_NumConnections"), flags, 2)
        this.vtbl.get_ConnectionInfo := CallbackCreate(GetMethod(implObj, "get_ConnectionInfo"), flags, 3)
        this.vtbl.get_NodeName := CallbackCreate(GetMethod(implObj, "get_NodeName"), flags, 5)
        this.vtbl.get_NumNodes := CallbackCreate(GetMethod(implObj, "get_NumNodes"), flags, 2)
        this.vtbl.get_NodeType := CallbackCreate(GetMethod(implObj, "get_NodeType"), flags, 3)
        this.vtbl.CreateNodeInstance := CallbackCreate(GetMethod(implObj, "CreateNodeInstance"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_NumCategories)
        CallbackFree(this.vtbl.get_Category)
        CallbackFree(this.vtbl.get_NumConnections)
        CallbackFree(this.vtbl.get_ConnectionInfo)
        CallbackFree(this.vtbl.get_NodeName)
        CallbackFree(this.vtbl.get_NumNodes)
        CallbackFree(this.vtbl.get_NodeType)
        CallbackFree(this.vtbl.CreateNodeInstance)
    }
}

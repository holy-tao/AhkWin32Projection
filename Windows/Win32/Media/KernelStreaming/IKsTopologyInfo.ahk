#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<UInt32>} pdwNumCategories 
     * @returns {HRESULT} 
     */
    get_NumCategories(pdwNumCategories) {
        result := ComCall(3, this, "uint*", pdwNumCategories, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<Guid>} pCategory 
     * @returns {HRESULT} 
     */
    get_Category(dwIndex, pCategory) {
        result := ComCall(4, this, "uint", dwIndex, "ptr", pCategory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwNumConnections 
     * @returns {HRESULT} 
     */
    get_NumConnections(pdwNumConnections) {
        result := ComCall(5, this, "uint*", pdwNumConnections, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<KSTOPOLOGY_CONNECTION>} pConnectionInfo 
     * @returns {HRESULT} 
     */
    get_ConnectionInfo(dwIndex, pConnectionInfo) {
        result := ComCall(6, this, "uint", dwIndex, "ptr", pConnectionInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwNodeId 
     * @param {Pointer} pwchNodeName 
     * @param {Integer} dwBufSize 
     * @param {Pointer<UInt32>} pdwNameLen 
     * @returns {HRESULT} 
     */
    get_NodeName(dwNodeId, pwchNodeName, dwBufSize, pdwNameLen) {
        result := ComCall(7, this, "uint", dwNodeId, "ptr", pwchNodeName, "uint", dwBufSize, "uint*", pdwNameLen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwNumNodes 
     * @returns {HRESULT} 
     */
    get_NumNodes(pdwNumNodes) {
        result := ComCall(8, this, "uint*", pdwNumNodes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwNodeId 
     * @param {Pointer<Guid>} pNodeType 
     * @returns {HRESULT} 
     */
    get_NodeType(dwNodeId, pNodeType) {
        result := ComCall(9, this, "uint", dwNodeId, "ptr", pNodeType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwNodeId 
     * @param {Pointer<Guid>} iid 
     * @param {Pointer<Void>} ppvObject 
     * @returns {HRESULT} 
     */
    CreateNodeInstance(dwNodeId, iid, ppvObject) {
        result := ComCall(10, this, "uint", dwNodeId, "ptr", iid, "ptr", ppvObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

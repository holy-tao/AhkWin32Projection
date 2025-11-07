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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopology-gettopologyid
     */
    GetTopologyID() {
        result := ComCall(33, this, "uint*", &pID := 0, "HRESULT")
        return pID
    }

    /**
     * 
     * @param {IMFTopologyNode} pNode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopology-addnode
     */
    AddNode(pNode) {
        result := ComCall(34, this, "ptr", pNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFTopologyNode} pNode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopology-removenode
     */
    RemoveNode(pNode) {
        result := ComCall(35, this, "ptr", pNode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopology-getnodecount
     */
    GetNodeCount() {
        result := ComCall(36, this, "ushort*", &pwNodes := 0, "HRESULT")
        return pwNodes
    }

    /**
     * 
     * @param {Integer} wIndex 
     * @returns {IMFTopologyNode} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopology-getnode
     */
    GetNode(wIndex) {
        result := ComCall(37, this, "ushort", wIndex, "ptr*", &ppNode := 0, "HRESULT")
        return IMFTopologyNode(ppNode)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopology-clear
     */
    Clear() {
        result := ComCall(38, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFTopology} pTopology 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopology-clonefrom
     */
    CloneFrom(pTopology) {
        result := ComCall(39, this, "ptr", pTopology, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} qwTopoNodeID 
     * @returns {IMFTopologyNode} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopology-getnodebyid
     */
    GetNodeByID(qwTopoNodeID) {
        result := ComCall(40, this, "uint", qwTopoNodeID, "ptr*", &ppNode := 0, "HRESULT")
        return IMFTopologyNode(ppNode)
    }

    /**
     * 
     * @returns {IMFCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopology-getsourcenodecollection
     */
    GetSourceNodeCollection() {
        result := ComCall(41, this, "ptr*", &ppCollection := 0, "HRESULT")
        return IMFCollection(ppCollection)
    }

    /**
     * 
     * @returns {IMFCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopology-getoutputnodecollection
     */
    GetOutputNodeCollection() {
        result := ComCall(42, this, "ptr*", &ppCollection := 0, "HRESULT")
        return IMFCollection(ppCollection)
    }
}

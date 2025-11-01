#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<Integer>} pID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopology-gettopologyid
     */
    GetTopologyID(pID) {
        pIDMarshal := pID is VarRef ? "uint*" : "ptr"

        result := ComCall(33, this, pIDMarshal, pID, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pwNodes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopology-getnodecount
     */
    GetNodeCount(pwNodes) {
        pwNodesMarshal := pwNodes is VarRef ? "ushort*" : "ptr"

        result := ComCall(36, this, pwNodesMarshal, pwNodes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wIndex 
     * @param {Pointer<IMFTopologyNode>} ppNode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopology-getnode
     */
    GetNode(wIndex, ppNode) {
        result := ComCall(37, this, "ushort", wIndex, "ptr*", ppNode, "HRESULT")
        return result
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
     * @param {Pointer<IMFTopologyNode>} ppNode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopology-getnodebyid
     */
    GetNodeByID(qwTopoNodeID, ppNode) {
        result := ComCall(40, this, "uint", qwTopoNodeID, "ptr*", ppNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFCollection>} ppCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopology-getsourcenodecollection
     */
    GetSourceNodeCollection(ppCollection) {
        result := ComCall(41, this, "ptr*", ppCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFCollection>} ppCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopology-getoutputnodecollection
     */
    GetOutputNodeCollection(ppCollection) {
        result := ComCall(42, this, "ptr*", ppCollection, "HRESULT")
        return result
    }
}

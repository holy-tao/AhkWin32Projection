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
     * 
     * @param {Pointer<UInt64>} pID 
     * @returns {HRESULT} 
     */
    GetTopologyID(pID) {
        result := ComCall(33, this, "uint*", pID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFTopologyNode>} pNode 
     * @returns {HRESULT} 
     */
    AddNode(pNode) {
        result := ComCall(34, this, "ptr", pNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFTopologyNode>} pNode 
     * @returns {HRESULT} 
     */
    RemoveNode(pNode) {
        result := ComCall(35, this, "ptr", pNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pwNodes 
     * @returns {HRESULT} 
     */
    GetNodeCount(pwNodes) {
        result := ComCall(36, this, "ushort*", pwNodes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wIndex 
     * @param {Pointer<IMFTopologyNode>} ppNode 
     * @returns {HRESULT} 
     */
    GetNode(wIndex, ppNode) {
        result := ComCall(37, this, "ushort", wIndex, "ptr", ppNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Clear() {
        result := ComCall(38, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFTopology>} pTopology 
     * @returns {HRESULT} 
     */
    CloneFrom(pTopology) {
        result := ComCall(39, this, "ptr", pTopology, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} qwTopoNodeID 
     * @param {Pointer<IMFTopologyNode>} ppNode 
     * @returns {HRESULT} 
     */
    GetNodeByID(qwTopoNodeID, ppNode) {
        result := ComCall(40, this, "uint", qwTopoNodeID, "ptr", ppNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFCollection>} ppCollection 
     * @returns {HRESULT} 
     */
    GetSourceNodeCollection(ppCollection) {
        result := ComCall(41, this, "ptr", ppCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFCollection>} ppCollection 
     * @returns {HRESULT} 
     */
    GetOutputNodeCollection(ppCollection) {
        result := ComCall(42, this, "ptr", ppCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

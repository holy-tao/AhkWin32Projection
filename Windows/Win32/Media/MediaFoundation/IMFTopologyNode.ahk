#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFAttributes.ahk

/**
 * Represents a node in a topology.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imftopologynode
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
     * 
     * @param {IUnknown} pObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynode-setobject
     */
    SetObject(pObject) {
        result := ComCall(33, this, "ptr", pObject, "HRESULT")
        return result
    }

    /**
     * The GetObject function retrieves information for the specified graphics object.
     * @param {Pointer<IUnknown>} ppObject 
     * @returns {HRESULT} If the function succeeds, and <i>lpvObject</i> is a valid pointer, the return value is the number of bytes stored into the buffer.
     * 
     * If the function succeeds, and <i>lpvObject</i> is <b>NULL</b>, the return value is the number of bytes required to hold the information the function would store into the buffer.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobject
     */
    GetObject(ppObject) {
        result := ComCall(34, this, "ptr*", ppObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynode-getnodetype
     */
    GetNodeType(pType) {
        result := ComCall(35, this, "int*", pType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynode-gettoponodeid
     */
    GetTopoNodeID(pID) {
        result := ComCall(36, this, "uint*", pID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullTopoID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynode-settoponodeid
     */
    SetTopoNodeID(ullTopoID) {
        result := ComCall(37, this, "uint", ullTopoID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcInputs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynode-getinputcount
     */
    GetInputCount(pcInputs) {
        result := ComCall(38, this, "uint*", pcInputs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcOutputs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynode-getoutputcount
     */
    GetOutputCount(pcOutputs) {
        result := ComCall(39, this, "uint*", pcOutputs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputIndex 
     * @param {IMFTopologyNode} pDownstreamNode 
     * @param {Integer} dwInputIndexOnDownstreamNode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynode-connectoutput
     */
    ConnectOutput(dwOutputIndex, pDownstreamNode, dwInputIndexOnDownstreamNode) {
        result := ComCall(40, this, "uint", dwOutputIndex, "ptr", pDownstreamNode, "uint", dwInputIndexOnDownstreamNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynode-disconnectoutput
     */
    DisconnectOutput(dwOutputIndex) {
        result := ComCall(41, this, "uint", dwOutputIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputIndex 
     * @param {Pointer<IMFTopologyNode>} ppUpstreamNode 
     * @param {Pointer<Integer>} pdwOutputIndexOnUpstreamNode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynode-getinput
     */
    GetInput(dwInputIndex, ppUpstreamNode, pdwOutputIndexOnUpstreamNode) {
        result := ComCall(42, this, "uint", dwInputIndex, "ptr*", ppUpstreamNode, "uint*", pdwOutputIndexOnUpstreamNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputIndex 
     * @param {Pointer<IMFTopologyNode>} ppDownstreamNode 
     * @param {Pointer<Integer>} pdwInputIndexOnDownstreamNode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynode-getoutput
     */
    GetOutput(dwOutputIndex, ppDownstreamNode, pdwInputIndexOnDownstreamNode) {
        result := ComCall(43, this, "uint", dwOutputIndex, "ptr*", ppDownstreamNode, "uint*", pdwInputIndexOnDownstreamNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputIndex 
     * @param {IMFMediaType} pType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynode-setoutputpreftype
     */
    SetOutputPrefType(dwOutputIndex, pType) {
        result := ComCall(44, this, "uint", dwOutputIndex, "ptr", pType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputIndex 
     * @param {Pointer<IMFMediaType>} ppType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynode-getoutputpreftype
     */
    GetOutputPrefType(dwOutputIndex, ppType) {
        result := ComCall(45, this, "uint", dwOutputIndex, "ptr*", ppType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputIndex 
     * @param {IMFMediaType} pType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynode-setinputpreftype
     */
    SetInputPrefType(dwInputIndex, pType) {
        result := ComCall(46, this, "uint", dwInputIndex, "ptr", pType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwInputIndex 
     * @param {Pointer<IMFMediaType>} ppType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynode-getinputpreftype
     */
    GetInputPrefType(dwInputIndex, ppType) {
        result := ComCall(47, this, "uint", dwInputIndex, "ptr*", ppType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFTopologyNode} pNode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynode-clonefrom
     */
    CloneFrom(pNode) {
        result := ComCall(48, this, "ptr", pNode, "HRESULT")
        return result
    }
}

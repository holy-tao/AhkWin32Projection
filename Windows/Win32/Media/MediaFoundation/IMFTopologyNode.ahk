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
     * 
     * @param {Pointer<IUnknown>} pObject 
     * @returns {HRESULT} 
     */
    SetObject(pObject) {
        result := ComCall(33, this, "ptr", pObject, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(34, this, "ptr", ppObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pType 
     * @returns {HRESULT} 
     */
    GetNodeType(pType) {
        result := ComCall(35, this, "int*", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pID 
     * @returns {HRESULT} 
     */
    GetTopoNodeID(pID) {
        result := ComCall(36, this, "uint*", pID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ullTopoID 
     * @returns {HRESULT} 
     */
    SetTopoNodeID(ullTopoID) {
        result := ComCall(37, this, "uint", ullTopoID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcInputs 
     * @returns {HRESULT} 
     */
    GetInputCount(pcInputs) {
        result := ComCall(38, this, "uint*", pcInputs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcOutputs 
     * @returns {HRESULT} 
     */
    GetOutputCount(pcOutputs) {
        result := ComCall(39, this, "uint*", pcOutputs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputIndex 
     * @param {Pointer<IMFTopologyNode>} pDownstreamNode 
     * @param {Integer} dwInputIndexOnDownstreamNode 
     * @returns {HRESULT} 
     */
    ConnectOutput(dwOutputIndex, pDownstreamNode, dwInputIndexOnDownstreamNode) {
        result := ComCall(40, this, "uint", dwOutputIndex, "ptr", pDownstreamNode, "uint", dwInputIndexOnDownstreamNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputIndex 
     * @returns {HRESULT} 
     */
    DisconnectOutput(dwOutputIndex) {
        result := ComCall(41, this, "uint", dwOutputIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputIndex 
     * @param {Pointer<IMFTopologyNode>} ppUpstreamNode 
     * @param {Pointer<UInt32>} pdwOutputIndexOnUpstreamNode 
     * @returns {HRESULT} 
     */
    GetInput(dwInputIndex, ppUpstreamNode, pdwOutputIndexOnUpstreamNode) {
        result := ComCall(42, this, "uint", dwInputIndex, "ptr", ppUpstreamNode, "uint*", pdwOutputIndexOnUpstreamNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputIndex 
     * @param {Pointer<IMFTopologyNode>} ppDownstreamNode 
     * @param {Pointer<UInt32>} pdwInputIndexOnDownstreamNode 
     * @returns {HRESULT} 
     */
    GetOutput(dwOutputIndex, ppDownstreamNode, pdwInputIndexOnDownstreamNode) {
        result := ComCall(43, this, "uint", dwOutputIndex, "ptr", ppDownstreamNode, "uint*", pdwInputIndexOnDownstreamNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputIndex 
     * @param {Pointer<IMFMediaType>} pType 
     * @returns {HRESULT} 
     */
    SetOutputPrefType(dwOutputIndex, pType) {
        result := ComCall(44, this, "uint", dwOutputIndex, "ptr", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputIndex 
     * @param {Pointer<IMFMediaType>} ppType 
     * @returns {HRESULT} 
     */
    GetOutputPrefType(dwOutputIndex, ppType) {
        result := ComCall(45, this, "uint", dwOutputIndex, "ptr", ppType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputIndex 
     * @param {Pointer<IMFMediaType>} pType 
     * @returns {HRESULT} 
     */
    SetInputPrefType(dwInputIndex, pType) {
        result := ComCall(46, this, "uint", dwInputIndex, "ptr", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwInputIndex 
     * @param {Pointer<IMFMediaType>} ppType 
     * @returns {HRESULT} 
     */
    GetInputPrefType(dwInputIndex, ppType) {
        result := ComCall(47, this, "uint", dwInputIndex, "ptr", ppType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFTopologyNode>} pNode 
     * @returns {HRESULT} 
     */
    CloneFrom(pNode) {
        result := ComCall(48, this, "ptr", pNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

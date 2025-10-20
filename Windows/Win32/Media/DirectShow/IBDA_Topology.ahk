#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IBDA_Topology interface is implemented on BDA device filters.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_Topology)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_topology
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_Topology extends IUnknown{
    /**
     * The interface identifier for IBDA_Topology
     * @type {Guid}
     */
    static IID => Guid("{79b56888-7fea-4690-b45d-38fd3c7849be}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pulcNodeTypes 
     * @param {Integer} ulcNodeTypesMax 
     * @param {Pointer<UInt32>} rgulNodeTypes 
     * @returns {HRESULT} 
     */
    GetNodeTypes(pulcNodeTypes, ulcNodeTypesMax, rgulNodeTypes) {
        result := ComCall(3, this, "uint*", pulcNodeTypes, "uint", ulcNodeTypesMax, "uint*", rgulNodeTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} ulcNodeDescriptors 
     * @param {Integer} ulcNodeDescriptorsMax 
     * @param {Pointer<BDANODE_DESCRIPTOR>} rgNodeDescriptors 
     * @returns {HRESULT} 
     */
    GetNodeDescriptors(ulcNodeDescriptors, ulcNodeDescriptorsMax, rgNodeDescriptors) {
        result := ComCall(4, this, "uint*", ulcNodeDescriptors, "uint", ulcNodeDescriptorsMax, "ptr", rgNodeDescriptors, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulNodeType 
     * @param {Pointer<UInt32>} pulcInterfaces 
     * @param {Integer} ulcInterfacesMax 
     * @param {Pointer<Guid>} rgguidInterfaces 
     * @returns {HRESULT} 
     */
    GetNodeInterfaces(ulNodeType, pulcInterfaces, ulcInterfacesMax, rgguidInterfaces) {
        result := ComCall(5, this, "uint", ulNodeType, "uint*", pulcInterfaces, "uint", ulcInterfacesMax, "ptr", rgguidInterfaces, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulcPinTypes 
     * @param {Integer} ulcPinTypesMax 
     * @param {Pointer<UInt32>} rgulPinTypes 
     * @returns {HRESULT} 
     */
    GetPinTypes(pulcPinTypes, ulcPinTypesMax, rgulPinTypes) {
        result := ComCall(6, this, "uint*", pulcPinTypes, "uint", ulcPinTypesMax, "uint*", rgulPinTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulcConnections 
     * @param {Integer} ulcConnectionsMax 
     * @param {Pointer<BDA_TEMPLATE_CONNECTION>} rgConnections 
     * @returns {HRESULT} 
     */
    GetTemplateConnections(pulcConnections, ulcConnectionsMax, rgConnections) {
        result := ComCall(7, this, "uint*", pulcConnections, "uint", ulcConnectionsMax, "ptr", rgConnections, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulPinType 
     * @param {Pointer<UInt32>} pulPinId 
     * @returns {HRESULT} 
     */
    CreatePin(ulPinType, pulPinId) {
        result := ComCall(8, this, "uint", ulPinType, "uint*", pulPinId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulPinId 
     * @returns {HRESULT} 
     */
    DeletePin(ulPinId) {
        result := ComCall(9, this, "uint", ulPinId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulPinId 
     * @param {Pointer<AM_MEDIA_TYPE>} pMediaType 
     * @returns {HRESULT} 
     */
    SetMediaType(ulPinId, pMediaType) {
        result := ComCall(10, this, "uint", ulPinId, "ptr", pMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulPinId 
     * @param {Pointer<REGPINMEDIUM>} pMedium 
     * @returns {HRESULT} 
     */
    SetMedium(ulPinId, pMedium) {
        result := ComCall(11, this, "uint", ulPinId, "ptr", pMedium, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulInputPinId 
     * @param {Integer} ulOutputPinId 
     * @returns {HRESULT} 
     */
    CreateTopology(ulInputPinId, ulOutputPinId) {
        result := ComCall(12, this, "uint", ulInputPinId, "uint", ulOutputPinId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulInputPinId 
     * @param {Integer} ulOutputPinId 
     * @param {Integer} ulNodeType 
     * @param {Pointer<IUnknown>} ppControlNode 
     * @returns {HRESULT} 
     */
    GetControlNode(ulInputPinId, ulOutputPinId, ulNodeType, ppControlNode) {
        result := ComCall(13, this, "uint", ulInputPinId, "uint", ulOutputPinId, "uint", ulNodeType, "ptr", ppControlNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

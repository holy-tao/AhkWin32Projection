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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNodeTypes", "GetNodeDescriptors", "GetNodeInterfaces", "GetPinTypes", "GetTemplateConnections", "CreatePin", "DeletePin", "SetMediaType", "SetMedium", "CreateTopology", "GetControlNode"]

    /**
     * 
     * @param {Pointer<Integer>} pulcNodeTypes 
     * @param {Integer} ulcNodeTypesMax 
     * @param {Pointer<Integer>} rgulNodeTypes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_topology-getnodetypes
     */
    GetNodeTypes(pulcNodeTypes, ulcNodeTypesMax, rgulNodeTypes) {
        pulcNodeTypesMarshal := pulcNodeTypes is VarRef ? "uint*" : "ptr"
        rgulNodeTypesMarshal := rgulNodeTypes is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pulcNodeTypesMarshal, pulcNodeTypes, "uint", ulcNodeTypesMax, rgulNodeTypesMarshal, rgulNodeTypes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} ulcNodeDescriptors 
     * @param {Integer} ulcNodeDescriptorsMax 
     * @param {Pointer<BDANODE_DESCRIPTOR>} rgNodeDescriptors 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_topology-getnodedescriptors
     */
    GetNodeDescriptors(ulcNodeDescriptors, ulcNodeDescriptorsMax, rgNodeDescriptors) {
        ulcNodeDescriptorsMarshal := ulcNodeDescriptors is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, ulcNodeDescriptorsMarshal, ulcNodeDescriptors, "uint", ulcNodeDescriptorsMax, "ptr", rgNodeDescriptors, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulNodeType 
     * @param {Pointer<Integer>} pulcInterfaces 
     * @param {Integer} ulcInterfacesMax 
     * @param {Pointer<Guid>} rgguidInterfaces 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_topology-getnodeinterfaces
     */
    GetNodeInterfaces(ulNodeType, pulcInterfaces, ulcInterfacesMax, rgguidInterfaces) {
        pulcInterfacesMarshal := pulcInterfaces is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", ulNodeType, pulcInterfacesMarshal, pulcInterfaces, "uint", ulcInterfacesMax, "ptr", rgguidInterfaces, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulcPinTypes 
     * @param {Integer} ulcPinTypesMax 
     * @param {Pointer<Integer>} rgulPinTypes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_topology-getpintypes
     */
    GetPinTypes(pulcPinTypes, ulcPinTypesMax, rgulPinTypes) {
        pulcPinTypesMarshal := pulcPinTypes is VarRef ? "uint*" : "ptr"
        rgulPinTypesMarshal := rgulPinTypes is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pulcPinTypesMarshal, pulcPinTypes, "uint", ulcPinTypesMax, rgulPinTypesMarshal, rgulPinTypes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulcConnections 
     * @param {Integer} ulcConnectionsMax 
     * @param {Pointer<BDA_TEMPLATE_CONNECTION>} rgConnections 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_topology-gettemplateconnections
     */
    GetTemplateConnections(pulcConnections, ulcConnectionsMax, rgConnections) {
        pulcConnectionsMarshal := pulcConnections is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pulcConnectionsMarshal, pulcConnections, "uint", ulcConnectionsMax, "ptr", rgConnections, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulPinType 
     * @param {Pointer<Integer>} pulPinId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_topology-createpin
     */
    CreatePin(ulPinType, pulPinId) {
        pulPinIdMarshal := pulPinId is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", ulPinType, pulPinIdMarshal, pulPinId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulPinId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_topology-deletepin
     */
    DeletePin(ulPinId) {
        result := ComCall(9, this, "uint", ulPinId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulPinId 
     * @param {Pointer<AM_MEDIA_TYPE>} pMediaType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_topology-setmediatype
     */
    SetMediaType(ulPinId, pMediaType) {
        result := ComCall(10, this, "uint", ulPinId, "ptr", pMediaType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulPinId 
     * @param {Pointer<REGPINMEDIUM>} pMedium 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_topology-setmedium
     */
    SetMedium(ulPinId, pMedium) {
        result := ComCall(11, this, "uint", ulPinId, "ptr", pMedium, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulInputPinId 
     * @param {Integer} ulOutputPinId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_topology-createtopology
     */
    CreateTopology(ulInputPinId, ulOutputPinId) {
        result := ComCall(12, this, "uint", ulInputPinId, "uint", ulOutputPinId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulInputPinId 
     * @param {Integer} ulOutputPinId 
     * @param {Integer} ulNodeType 
     * @param {Pointer<IUnknown>} ppControlNode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_topology-getcontrolnode
     */
    GetControlNode(ulInputPinId, ulOutputPinId, ulNodeType, ppControlNode) {
        result := ComCall(13, this, "uint", ulInputPinId, "uint", ulOutputPinId, "uint", ulNodeType, "ptr*", ppControlNode, "HRESULT")
        return result
    }
}

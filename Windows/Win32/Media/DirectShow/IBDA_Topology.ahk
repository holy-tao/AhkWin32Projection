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
     * The GetNodeTypes method retrieves a list of all the node types in the template topology for this filter and network type.
     * @param {Pointer<Integer>} pulcNodeTypes Pointer that receives the number of node types in the list.
     * @param {Integer} ulcNodeTypesMax The maximum number of node types that can be held by the <i>rgulNodeTypes</i> buffer.
     * @param {Pointer<Integer>} rgulNodeTypes Pointer to a buffer that receives the list of node types.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_topology-getnodetypes
     */
    GetNodeTypes(pulcNodeTypes, ulcNodeTypesMax, rgulNodeTypes) {
        pulcNodeTypesMarshal := pulcNodeTypes is VarRef ? "uint*" : "ptr"
        rgulNodeTypesMarshal := rgulNodeTypes is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pulcNodeTypesMarshal, pulcNodeTypes, "uint", ulcNodeTypesMax, rgulNodeTypesMarshal, rgulNodeTypes, "HRESULT")
        return result
    }

    /**
     * The GetNodeDescriptors method retrieves a list of descriptors for the nodes in the topology.
     * @param {Pointer<Integer>} ulcNodeDescriptors Receives a count of the number of node descriptors written to the <i>rgNodeDescriptors</i> array.
     * @param {Integer} ulcNodeDescriptorsMax Specifies the maximum number of node descriptors that the <i>rgNodeDescriptors</i> array can hold.
     * @param {Pointer<BDANODE_DESCRIPTOR>} rgNodeDescriptors Pointer to a buffer that receives an array of node descriptors. Each node descriptor is a structure of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/bdanode-descriptor">BDANODE_DESCRIPTOR</a>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_topology-getnodedescriptors
     */
    GetNodeDescriptors(ulcNodeDescriptors, ulcNodeDescriptorsMax, rgNodeDescriptors) {
        ulcNodeDescriptorsMarshal := ulcNodeDescriptors is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, ulcNodeDescriptorsMarshal, ulcNodeDescriptors, "uint", ulcNodeDescriptorsMax, "ptr", rgNodeDescriptors, "HRESULT")
        return result
    }

    /**
     * The GetNodeInterfaces method retrieves a list of the interfaces supported by a node type.
     * @param {Integer} ulNodeType Specifies the node type for which the interface list is being requested.
     * @param {Pointer<Integer>} pulcInterfaces Pointer that receives the number of interfaces in the list.
     * @param {Integer} ulcInterfacesMax Specifies the maximum number of interfaces that <i>rgguidInterfaces</i> can hold.
     * @param {Pointer<Guid>} rgguidInterfaces Pointer to a buffer that holds the list of interface GUIDs.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_topology-getnodeinterfaces
     */
    GetNodeInterfaces(ulNodeType, pulcInterfaces, ulcInterfacesMax, rgguidInterfaces) {
        pulcInterfacesMarshal := pulcInterfaces is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", ulNodeType, pulcInterfacesMarshal, pulcInterfaces, "uint", ulcInterfacesMax, "ptr", rgguidInterfaces, "HRESULT")
        return result
    }

    /**
     * The GetPinTypes method retrieves a list of all the pin types in the template topology for this filter and network type.
     * @param {Pointer<Integer>} pulcPinTypes Pointer to a value that receives the number of pin types in the list.
     * @param {Integer} ulcPinTypesMax The maximum number of pin types that can be held by the <i>rgulPinTypes</i> buffer.
     * @param {Pointer<Integer>} rgulPinTypes Pointer to a buffer to receive the list of pin types.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_topology-getpintypes
     */
    GetPinTypes(pulcPinTypes, ulcPinTypesMax, rgulPinTypes) {
        pulcPinTypesMarshal := pulcPinTypes is VarRef ? "uint*" : "ptr"
        rgulPinTypesMarshal := rgulPinTypes is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pulcPinTypesMarshal, pulcPinTypes, "uint", ulcPinTypesMax, rgulPinTypesMarshal, rgulPinTypes, "HRESULT")
        return result
    }

    /**
     * The GetTemplateConnections method retrieves a list of all template connections that appear in the template topology for this filter and network type.
     * @param {Pointer<Integer>} pulcConnections Pointer to a value to receive the number of connections in the list.
     * @param {Integer} ulcConnectionsMax The maximum number of connections that can be held by the <i>rgConnections</i> buffer.
     * @param {Pointer<BDA_TEMPLATE_CONNECTION>} rgConnections Pointer to a buffer that receives the list of connections.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_topology-gettemplateconnections
     */
    GetTemplateConnections(pulcConnections, ulcConnectionsMax, rgConnections) {
        pulcConnectionsMarshal := pulcConnections is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pulcConnectionsMarshal, pulcConnections, "uint", ulcConnectionsMax, "ptr", rgConnections, "HRESULT")
        return result
    }

    /**
     * The CreatePin method creates an instance of a specified pin type.
     * @param {Integer} ulPinType Specifies the type of pin to create. To obtain the available values, call <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_topology-getpintypes">IBDA_Topology::GetPinTypes</a>.
     * @param {Pointer<Integer>} pulPinId Pointer that receives the identifier for the new pin.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_topology-createpin
     */
    CreatePin(ulPinType, pulPinId) {
        pulPinIdMarshal := pulPinId is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", ulPinType, pulPinIdMarshal, pulPinId, "HRESULT")
        return result
    }

    /**
     * The DeletePin method deletes a pin from the filter's topology.
     * @param {Integer} ulPinId Specifies the identifier of the pin to be deleted.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_topology-deletepin
     */
    DeletePin(ulPinId) {
        result := ComCall(9, this, "uint", ulPinId, "HRESULT")
        return result
    }

    /**
     * The SetMediaType method sets the media type for a pin on a BDA device filter.
     * @param {Integer} ulPinId The identifier of the pin on which to set the media type.
     * @param {Pointer<AM_MEDIA_TYPE>} pMediaType Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure that contains the media type.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_topology-setmediatype
     */
    SetMediaType(ulPinId, pMediaType) {
        result := ComCall(10, this, "uint", ulPinId, "ptr", pMediaType, "HRESULT")
        return result
    }

    /**
     * The SetMedium method configures the medium on which a particular pin sends data.
     * @param {Integer} ulPinId Specifies the identifier of the pin on which to set the medium.
     * @param {Pointer<REGPINMEDIUM>} pMedium Pointer to the medium on which the pin will send data.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_topology-setmedium
     */
    SetMedium(ulPinId, pMedium) {
        result := ComCall(11, this, "uint", ulPinId, "ptr", pMedium, "HRESULT")
        return result
    }

    /**
     * The CreateTopology method associates an instance of an input pin with an instance of an output pin.
     * @param {Integer} ulInputPinId Specifies the identifier of the input pin for which a topology should be created.
     * @param {Integer} ulOutputPinId Specifies the identifier of the output pin for which a topology should be created.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_topology-createtopology
     */
    CreateTopology(ulInputPinId, ulOutputPinId) {
        result := ComCall(12, this, "uint", ulInputPinId, "uint", ulOutputPinId, "HRESULT")
        return result
    }

    /**
     * The GetControlNode method retrieves an IUnknown interface pointer for a specified control node.
     * @param {Integer} ulInputPinId Specifies the identifier of the input pin for which a topology should be created.
     * @param {Integer} ulOutputPinId Specifies the identifier of the output pin for which a topology should be created.
     * @param {Integer} ulNodeType The type of node to be opened.
     * @param {Pointer<IUnknown>} ppControlNode Pointer to a pointer to the control node's <b>IUnknown</b> interface
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_topology-getcontrolnode
     */
    GetControlNode(ulInputPinId, ulOutputPinId, ulNodeType, ppControlNode) {
        result := ComCall(13, this, "uint", ulInputPinId, "uint", ulOutputPinId, "uint", ulNodeType, "ptr*", ppControlNode, "HRESULT")
        return result
    }
}

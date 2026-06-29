#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\BDANODE_DESCRIPTOR.ahk" { BDANODE_DESCRIPTOR }
#Import "..\MediaFoundation\AM_MEDIA_TYPE.ahk" { AM_MEDIA_TYPE }
#Import ".\REGPINMEDIUM.ahk" { REGPINMEDIUM }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\BDA_TEMPLATE_CONNECTION.ahk" { BDA_TEMPLATE_CONNECTION }

/**
 * The IBDA_Topology interface is implemented on BDA device filters.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_Topology)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-ibda_topology
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_Topology extends IUnknown {
    /**
     * The interface identifier for IBDA_Topology
     * @type {Guid}
     */
    static IID := Guid("{79b56888-7fea-4690-b45d-38fd3c7849be}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_Topology interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetNodeTypes           : IntPtr
        GetNodeDescriptors     : IntPtr
        GetNodeInterfaces      : IntPtr
        GetPinTypes            : IntPtr
        GetTemplateConnections : IntPtr
        CreatePin              : IntPtr
        DeletePin              : IntPtr
        SetMediaType           : IntPtr
        SetMedium              : IntPtr
        CreateTopology         : IntPtr
        GetControlNode         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_Topology.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetNodeTypes method retrieves a list of all the node types in the template topology for this filter and network type.
     * @remarks
     * The <b>IBDA_Topology</b> interface is implemented by a BDA Device Filter. It is used by a Network Provider to query a BDA Device Filter's possible topologies (template topology) and to configure the device with an appropriate topology for the current tuning request. It is also used to get an <b>IUnknown</b> to a control node which may be used to set specific tuning information.
     * @param {Pointer<Integer>} pulcNodeTypes Pointer that receives the number of node types in the list.
     * @param {Integer} ulcNodeTypesMax The maximum number of node types that can be held by the <i>rgulNodeTypes</i> buffer.
     * @param {Pointer<Integer>} rgulNodeTypes Pointer to a buffer that receives the list of node types.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_topology-getnodetypes
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
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_topology-getnodedescriptors
     */
    GetNodeDescriptors(ulcNodeDescriptors, ulcNodeDescriptorsMax, rgNodeDescriptors) {
        ulcNodeDescriptorsMarshal := ulcNodeDescriptors is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, ulcNodeDescriptorsMarshal, ulcNodeDescriptors, "uint", ulcNodeDescriptorsMax, BDANODE_DESCRIPTOR.Ptr, rgNodeDescriptors, "HRESULT")
        return result
    }

    /**
     * The GetNodeInterfaces method retrieves a list of the interfaces supported by a node type.
     * @param {Integer} ulNodeType Specifies the node type for which the interface list is being requested.
     * @param {Pointer<Integer>} pulcInterfaces Pointer that receives the number of interfaces in the list.
     * @param {Integer} ulcInterfacesMax Specifies the maximum number of interfaces that <i>rgguidInterfaces</i> can hold.
     * @param {Pointer<Guid>} rgguidInterfaces Pointer to a buffer that holds the list of interface GUIDs.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_topology-getnodeinterfaces
     */
    GetNodeInterfaces(ulNodeType, pulcInterfaces, ulcInterfacesMax, rgguidInterfaces) {
        pulcInterfacesMarshal := pulcInterfaces is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", ulNodeType, pulcInterfacesMarshal, pulcInterfaces, "uint", ulcInterfacesMax, Guid.Ptr, rgguidInterfaces, "HRESULT")
        return result
    }

    /**
     * The GetPinTypes method retrieves a list of all the pin types in the template topology for this filter and network type.
     * @param {Pointer<Integer>} pulcPinTypes Pointer to a value that receives the number of pin types in the list.
     * @param {Integer} ulcPinTypesMax The maximum number of pin types that can be held by the <i>rgulPinTypes</i> buffer.
     * @param {Pointer<Integer>} rgulPinTypes Pointer to a buffer to receive the list of pin types.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_topology-getpintypes
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
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_topology-gettemplateconnections
     */
    GetTemplateConnections(pulcConnections, ulcConnectionsMax, rgConnections) {
        pulcConnectionsMarshal := pulcConnections is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pulcConnectionsMarshal, pulcConnections, "uint", ulcConnectionsMax, BDA_TEMPLATE_CONNECTION.Ptr, rgConnections, "HRESULT")
        return result
    }

    /**
     * The CreatePin method creates an instance of a specified pin type.
     * @param {Integer} ulPinType Specifies the type of pin to create. To obtain the available values, call <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_topology-getpintypes">IBDA_Topology::GetPinTypes</a>.
     * @param {Pointer<Integer>} pulPinId Pointer that receives the identifier for the new pin.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_topology-createpin
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
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_topology-deletepin
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
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_topology-setmediatype
     */
    SetMediaType(ulPinId, pMediaType) {
        result := ComCall(10, this, "uint", ulPinId, AM_MEDIA_TYPE.Ptr, pMediaType, "HRESULT")
        return result
    }

    /**
     * The SetMedium method configures the medium on which a particular pin sends data.
     * @remarks
     * A medium is a structure that identifies a hardware data path between two devices on the host system. They can be devices on the same card, such as a crossbar and a tuner on a TV card; devices on separate cards; or external devices. Kernel-mode filters based on the Windows Driver Model can use mediums instead of media types to determine pin connections.
     * @param {Integer} ulPinId Specifies the identifier of the pin on which to set the medium.
     * @param {Pointer<REGPINMEDIUM>} pMedium Pointer to the medium on which the pin will send data.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_topology-setmedium
     */
    SetMedium(ulPinId, pMedium) {
        result := ComCall(11, this, "uint", ulPinId, REGPINMEDIUM.Ptr, pMedium, "HRESULT")
        return result
    }

    /**
     * The CreateTopology method associates an instance of an input pin with an instance of an output pin.
     * @param {Integer} ulInputPinId Specifies the identifier of the input pin for which a topology should be created.
     * @param {Integer} ulOutputPinId Specifies the identifier of the output pin for which a topology should be created.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_topology-createtopology
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
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_topology-getcontrolnode
     */
    GetControlNode(ulInputPinId, ulOutputPinId, ulNodeType, ppControlNode) {
        result := ComCall(13, this, "uint", ulInputPinId, "uint", ulOutputPinId, "uint", ulNodeType, IUnknown.Ptr, ppControlNode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBDA_Topology.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetNodeTypes := CallbackCreate(GetMethod(implObj, "GetNodeTypes"), flags, 4)
        this.vtbl.GetNodeDescriptors := CallbackCreate(GetMethod(implObj, "GetNodeDescriptors"), flags, 4)
        this.vtbl.GetNodeInterfaces := CallbackCreate(GetMethod(implObj, "GetNodeInterfaces"), flags, 5)
        this.vtbl.GetPinTypes := CallbackCreate(GetMethod(implObj, "GetPinTypes"), flags, 4)
        this.vtbl.GetTemplateConnections := CallbackCreate(GetMethod(implObj, "GetTemplateConnections"), flags, 4)
        this.vtbl.CreatePin := CallbackCreate(GetMethod(implObj, "CreatePin"), flags, 3)
        this.vtbl.DeletePin := CallbackCreate(GetMethod(implObj, "DeletePin"), flags, 2)
        this.vtbl.SetMediaType := CallbackCreate(GetMethod(implObj, "SetMediaType"), flags, 3)
        this.vtbl.SetMedium := CallbackCreate(GetMethod(implObj, "SetMedium"), flags, 3)
        this.vtbl.CreateTopology := CallbackCreate(GetMethod(implObj, "CreateTopology"), flags, 3)
        this.vtbl.GetControlNode := CallbackCreate(GetMethod(implObj, "GetControlNode"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetNodeTypes)
        CallbackFree(this.vtbl.GetNodeDescriptors)
        CallbackFree(this.vtbl.GetNodeInterfaces)
        CallbackFree(this.vtbl.GetPinTypes)
        CallbackFree(this.vtbl.GetTemplateConnections)
        CallbackFree(this.vtbl.CreatePin)
        CallbackFree(this.vtbl.DeletePin)
        CallbackFree(this.vtbl.SetMediaType)
        CallbackFree(this.vtbl.SetMedium)
        CallbackFree(this.vtbl.CreateTopology)
        CallbackFree(this.vtbl.GetControlNode)
    }
}

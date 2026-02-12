#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IConnector.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IConnector interface represents a point of connection between components.
 * @see https://learn.microsoft.com/windows/win32/api//content/devicetopology/nn-devicetopology-iconnector
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IConnector extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConnector
     * @type {Guid}
     */
    static IID => Guid("{9c2c4058-23f5-41de-877a-df3af236a09e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetType", "GetDataFlow", "ConnectTo", "Disconnect", "IsConnected", "GetConnectedTo", "GetConnectorIdConnectedTo", "GetDeviceIdConnectedTo"]

    /**
     * The GetType method gets the type of this connector.
     * @remarks
     * A connector corresponds to a "pin" in kernel streaming (KS) terminology. The mapping of KS pins to connectors is as follows:
     * 
     * <ul>
     * <li>If the KS pin communication type is KSPIN_COMMUNICATION_SINK, KSPIN_COMMUNICATION_SOURCE, or KSPIN_COMMUNICATION_BOTH, then the connector type is Software_IO.</li>
     * <li>Else, if the pin is part of a physical connection between two KS filters (devices) in the same audio adapter or in different audio adapters, then the connector type is Software_Fixed.</li>
     * <li>Else, if the KS pin category is KSNODETYPE_SPEAKER, KSNODETYPE_MICROPHONE, KSNODETYPE_LINE_CONNECTOR, or KSNODETYPE_SPDIF_INTERFACE, the connector type is Physical_External.</li>
     * <li>Else, for a pin that does not meet any of the preceding criteria, the connector type is Physical_Internal.</li>
     * </ul>
     * For more information about KS pins, see the Windows DDK documentation.
     * 
     * For a code example that calls the <b>GetType</b> method, see the implementation of the SelectCaptureDevice function in <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-topologies">Device Topologies</a>.
     * @returns {Integer} Pointer to a variable into which the method writes the connector type. The connector type is one of the following <a href="https://docs.microsoft.com/windows/win32/api/devicetopology/ne-devicetopology-connectortype">ConnectorType</a> enumeration constants:
     * 
     * Unknown_Connector
     * 
     * Physical_Internal
     * 
     * Physical_External
     * 
     * Software_IO
     * 
     * Software_Fixed
     * 
     * Network
     * @see https://learn.microsoft.com/windows/win32/api//content/devicetopology/nf-devicetopology-iconnector-gettype
     */
    GetType() {
        result := ComCall(3, this, "int*", &pType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pType
    }

    /**
     * The GetDataFlow method gets the direction of data flow through this connector.
     * @remarks
     * For a code example that calls this method, see the implementation of the SelectCaptureDevice function in <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-topologies">Device Topologies</a>.
     * @returns {Integer} Pointer to a variable into which the method writes the data-flow direction. The direction is one of the following <a href="https://docs.microsoft.com/windows/win32/api/devicetopology/ne-devicetopology-dataflow">DataFlow</a> enumeration values:
     * 
     * In
     * 
     * Out
     * 
     * If data flows into the device through the connector, the data-flow direction is In. Otherwise, the data-flow direction is Out.
     * @see https://learn.microsoft.com/windows/win32/api//content/devicetopology/nf-devicetopology-iconnector-getdataflow
     */
    GetDataFlow() {
        result := ComCall(4, this, "int*", &pFlow := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pFlow
    }

    /**
     * The ConnectTo method connects this connector to a connector in another device-topology object.
     * @param {IConnector} pConnectTo The other connector. This parameter points to the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iconnector">IConnector</a> interface of the connector object that represents the connector in the other device topology. The caller is responsible for releasing its counted reference to the <b>IConnector</b> interface when it is no longer needed. The <b>ConnectTo</b> method obtains its own reference to this interface.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer <i>pConnectTo</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current connector and remote connector pointed to by <i>pConnectTo</i>, have the same direction of data flow. A connector with data-flow direction "In" must be connected to another connector with data-flow direction "Out" to create a valid connection in the topology. To determine the data flow of a connector, call <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-iconnector-getdataflow">IConnector::GetDataFlow</a>. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object pointed to by <i>pConnectTo</i> is not a valid connector object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_DEVICE_ALREADY_ATTACHED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the two connectors is already attached to another connector. For information about this macro, see the Windows SDK documentation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/devicetopology/nf-devicetopology-iconnector-connectto
     */
    ConnectTo(pConnectTo) {
        result := ComCall(5, this, "ptr", pConnectTo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Disconnect method disconnects this connector from another connector.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This connector is already disconnected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_FILE_READ_ONLY)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A permanent connection cannot be disconnected. For information about this macro, see the Windows SDK documentation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/devicetopology/nf-devicetopology-iconnector-disconnect
     */
    Disconnect() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IsConnected method indicates whether this connector is connected to another connector.
     * @remarks
     * For a code example that calls the <b>IsConnected</b> method, see the implementation of the SelectCaptureDevice function in <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-topologies">Device Topologies</a>.
     * @returns {BOOL} Pointer to a <b>BOOL</b> variable into which the method writes the connection state. If the state is <b>TRUE</b>, this connector is connected to another connector. If <b>FALSE</b>, this connector is unconnected.
     * @see https://learn.microsoft.com/windows/win32/api//content/devicetopology/nf-devicetopology-iconnector-isconnected
     */
    IsConnected() {
        result := ComCall(7, this, "int*", &pbConnected := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbConnected
    }

    /**
     * The GetConnectedTo method gets the connector to which this connector is connected.
     * @remarks
     * For code examples that call this method, see the implementations of the GetHardwareDeviceTopology and SelectCaptureDevice functions in <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-topologies">Device Topologies</a>.
     * 
     * For information about Software_IO connections, see <a href="https://docs.microsoft.com/windows/win32/api/devicetopology/ne-devicetopology-connectortype">ConnectorType Enumeration</a>. For information about the HRESULT_FROM_WIN32 macro, see the Windows SDK documentation. For information about the DEVICE_STATE_NOTPRESENT device state, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-state-xxx-constants">DEVICE_STATE_XXX Constants</a>.
     * @returns {IConnector} Pointer to a pointer variable into which the method writes the address of the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iconnector">IConnector</a> interface of the other connector object. Through this method, the caller obtains a counted reference to the interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the <b>GetConnectedTo</b> call fails,  <i>*ppConTo</i> is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/devicetopology/nf-devicetopology-iconnector-getconnectedto
     */
    GetConnectedTo() {
        result := ComCall(8, this, "ptr*", &ppConTo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IConnector(ppConTo)
    }

    /**
     * The GetConnectorIdConnectedTo method gets the global ID of the connector, if any, that this connector is connected to.
     * @remarks
     * A global ID is a string that uniquely identifies a part among all parts in all device topologies in the system. Clients should treat this string as opaque. That is, clients should not attempt to parse the contents of the string to obtain information about the part. The reason is that the string format is undefined and might change from one implementation of the DeviceTopology API to the next.
     * @returns {PWSTR} Pointer to a string pointer into which the method writes the address of a null-terminated, wide-character string that contains the other connector's global ID. The method allocates the storage for the string. The caller is responsible for freeing the storage, when it is no longer needed, by calling the <b>CoTaskMemFree</b> function. If the <b>GetConnectorIdConnectedTo</b> call fails,  <i>*ppwstrConnectorId</i> is <b>NULL</b>. For information about <b>CoTaskMemFree</b>, see the Windows SDK documentation.
     * @see https://learn.microsoft.com/windows/win32/api//content/devicetopology/nf-devicetopology-iconnector-getconnectoridconnectedto
     */
    GetConnectorIdConnectedTo() {
        result := ComCall(9, this, "ptr*", &ppwstrConnectorId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppwstrConnectorId
    }

    /**
     * The GetDeviceIdConnectedTo method gets the device identifier of the audio device, if any, that this connector is connected to.
     * @remarks
     * The device identifier obtained from this method can be used as an input parameter to the <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nf-mmdeviceapi-immdeviceenumerator-getdevice">IMMDeviceEnumerator::GetDevice</a> method.
     * 
     * This method is functionally equivalent to, but more efficient than, the following series of method calls:
     * 
     * <ul>
     * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-iconnector-getconnectedto">IConnector::GetConnectedTo</a> method to obtain the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iconnector">IConnector</a> interface of the "to" connector.</li>
     * <li>Call the <b>IConnector::QueryInterface</b> method (with parameter <i>iid</i> set to <b>REFIID</b> IID_IPart) to obtain the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-ipart">IPart</a> interface of the "to" connector.</li>
     * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-ipart-gettopologyobject">IPart::GetTopologyObject</a> method to obtain the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-idevicetopology">IDeviceTopology</a> interface of the "to" device (the device that contains the "to" connector).</li>
     * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-idevicetopology-getdeviceid">IDeviceTopology::GetDeviceId</a> method to obtain the device ID of the "to" device.</li>
     * </ul>
     * @returns {PWSTR} Pointer to a string pointer into which the method writes the address of a null-terminated, wide-character string that contains the device identifier of the connected device. The method allocates the storage for the string. The caller is responsible for freeing the storage, when it is no longer needed, by calling the <b>CoTaskMemFree</b> function. If the <b>GetDeviceIdConnectedTo</b> call fails,  <i>*ppwstrDeviceId</i> is <b>NULL</b>. For information about <b>CoTaskMemFree</b>, see the Windows SDK documentation.
     * @see https://learn.microsoft.com/windows/win32/api//content/devicetopology/nf-devicetopology-iconnector-getdeviceidconnectedto
     */
    GetDeviceIdConnectedTo() {
        result := ComCall(10, this, "ptr*", &ppwstrDeviceId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppwstrDeviceId
    }
}

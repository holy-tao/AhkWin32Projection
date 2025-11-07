#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains trigger-specific data for a service trigger event.
 * @remarks
 * 
 * The following table lists trigger-specific data by trigger event type. 
 * 
 * <table>
 * <tr>
 * <th>Event type</th>
 * <th>Trigger-specific data</th>
 * </tr>
 * <tr>
 * <td>SERVICE_TRIGGER_TYPE_CUSTOM</td>
 * <td>Specified by the <a href="https://docs.microsoft.com/windows/win32/etw/event-tracing-portal">Event Tracing for Windows</a> (ETW) provider that defines the custom event.</td>
 * </tr>
 * <tr>
 * <td>SERVICE_TRIGGER_TYPE_DEVICE_INTERFACE_ARRIVAL</td>
 * <td>A SERVICE_TRIGGER_DATA_TYPE_STRING string that specifies a hardware ID or compatible ID string for the device interface class.  </td>
 * </tr>
 * <tr>
 * <td>SERVICE_TRIGGER_TYPE_DOMAIN_JOIN</td>
 * <td>Not applicable.</td>
 * </tr>
 * <tr>
 * <td>SERVICE_TRIGGER_TYPE_FIREWALL_PORT_EVENT</td>
 * <td>A SERVICE_TRIGGER_DATA_TYPE_STRING multi-string that specifies the port, the protocol, and optionally the executable path and name of the service listening on the event. </td>
 * </tr>
 * <tr>
 * <td>SERVICE_TRIGGER_TYPE_GROUP_POLICY</td>
 * <td>Not applicable.</td>
 * </tr>
 * <tr>
 * <td>SERVICE_TRIGGER_TYPE_IP_ADDRESS_AVAILABILITY</td>
 * <td>Not applicable.</td>
 * </tr>
 * <tr>
 * <td>SERVICE_TRIGGER_TYPE_NETWORK_ENDPOINT</td>
 * <td>A SERVICE_TRIGGER_DATA_TYPE_STRING that specifies the port, named pipe, or RPC interface for the network endpoint.</td>
 * </tr>
 * </table>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsvc/ns-winsvc-service_trigger_specific_data_item
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class SERVICE_TRIGGER_SPECIFIC_DATA_ITEM extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    dwDataType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of the trigger-specific data pointed to <b>pData</b>, in bytes.  The maximum value is 1024.
     * @type {Integer}
     */
    cbData {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to the trigger-specific data for the service trigger event. The trigger-specific data depends on the trigger event type; see Remarks. 
     * 
     * If the <b>dwDataType</b> member is SERVICE_TRIGGER_DATA_TYPE_BINARY, the trigger-specific data is an array of bytes. 
     * 
     * If the <b>dwDataType</b> member is SERVICE_TRIGGER_DATA_TYPE_STRING, the trigger-specific data is a null-terminated string or a multistring of null-terminated strings, ending with two null-terminating characters. For example: <c>"5001\0UDP\0%programfiles%\MyApplication\MyServiceProcess.exe\0MyService\0\0"</c>.
     * 
     * Strings must be Unicode; ANSI strings are not supported.
     * @type {Pointer<Integer>}
     */
    pData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

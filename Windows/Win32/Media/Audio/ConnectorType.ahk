#Requires AutoHotkey v2.0.0 64-bit

/**
 * The ConnectorType enumeration indicates the type of connection that a connector is part of.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-iconnector-gettype">IConnector::GetType</a> method uses the constants defined in the <b>ConnectorType</b> enumeration.
 * 
 * For more information about connector types, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-topologies">Device Topologies</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/ne-devicetopology-connectortype
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ConnectorType{

    /**
     * The connector is part of a connection of unknown type.
     * @type {Integer (Int32)}
     */
    static Unknown_Connector => 0

    /**
     * The connector is part of a physical connection to an auxiliary device that is installed inside the system chassis (for example, a connection to the analog output of an internal CD player, or to a built-in microphone or built-in speakers in a laptop computer).
     * @type {Integer (Int32)}
     */
    static Physical_Internal => 1

    /**
     * The connector is part of a physical connection to an external device. That is, the connector is a user-accessible jack that connects to a microphone, speakers, headphones, S/PDIF input or output device, or line input or output device.
     * @type {Integer (Int32)}
     */
    static Physical_External => 2

    /**
     * The connector is part of a software-configured I/O connection (typically a DMA channel) between system memory and an audio hardware device on an audio adapter.
     * @type {Integer (Int32)}
     */
    static Software_IO => 3

    /**
     * The connector is part of a permanent connection that is fixed and cannot be configured under software control. This type of connection is typically used to connect two audio hardware devices that reside on the same adapter.
     * @type {Integer (Int32)}
     */
    static Software_Fixed => 4

    /**
     * The connector is part of a connection to a network.
     * @type {Integer (Int32)}
     */
    static Network => 5
}

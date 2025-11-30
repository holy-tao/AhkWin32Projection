#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PartType enumeration defines constants that indicate whether a part in a device topology is a connector or subunit.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-ipart-getparttype">IPart::GetPartType</a> method uses the constants defined in the <b>PartType</b> enumeration to indicate whether an <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-ipart">IPart</a> object represents a connector or a subunit. If an <b>IPart</b> object represents a connector, a client can query that that object for its <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iconnector">IConnector</a> interface. If an <b>IPart</b> object represents a subunit, a client can query that that object for its <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-isubunit">ISubunit</a> interface.
 * 
 * For more information about connectors and subunits, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-topologies">Device Topologies</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/ne-devicetopology-parttype
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class PartType extends Win32Enum{

    /**
     * The part is a connector. A connector can represent an audio jack, an internal connection to an integrated endpoint device, or a software connection implemented through DMA transfers. For more information about connector types, see <a href="https://docs.microsoft.com/windows/win32/api/devicetopology/ne-devicetopology-connectortype">ConnectorType Enumeration</a>.
     * @type {Integer (Int32)}
     */
    static Connector => 0

    /**
     * The part is a subunit. A subunit is an audio-processing node in a device topology. A subunit frequently has one or more hardware control parameters that can be set under program control. For example, an audio application can change the volume setting of a volume-control subunit.
     * @type {Integer (Int32)}
     */
    static Subunit => 1
}

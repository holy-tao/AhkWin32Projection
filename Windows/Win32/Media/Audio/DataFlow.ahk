#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DataFlow enumeration indicates the data-flow direction of an audio stream through a connector.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-iconnector-getdataflow">IConnector::GetDataFlow</a> method uses the constants defined in the <b>DataFlow</b> enumeration.
 * 
 * The topology of a rendering or capture device on an audio adapter typically has one or more connectors with a data-flow direction of "In" through which audio data enters the device, and one or more connectors with a data-flow direction of "Out" through which audio data exits the device. For example, a typical rendering device on an adapter has a connector with data-flow direction "In" through which the Windows audio engine streams PCM data into the device. The same device has a connector with data-flow direction "Out" through which the device transmits an audio signal to speakers or headphones.
 * 
 * The topology of a rendering endpoint device (for example, headphones) has a single connector with data-flow direction "In" through which audio data (in the form of an analog signal) enters the device.
 * 
 * The topology of a capture endpoint device (for example, a microphone) has a single connector with data-flow direction "Out" through which audio data exits the device.
 * 
 * For more information, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-topologies">Device Topologies</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/ne-devicetopology-dataflow
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class DataFlow{

    /**
     * Input stream. The audio stream flows into the device through the connector.
     * @type {Integer (Int32)}
     */
    static In => 0

    /**
     * Output stream. The audio stream flows out of the device through the connector.
     * @type {Integer (Int32)}
     */
    static Out => 1
}

#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the status of a topology during playback.
 * @remarks
 * 
  * This enumeration is used with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mesessiontopologystatus">MESessionTopologyStatus</a> event. The MESessionTopologyStatus event always has an <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-event-topology-status-attribute">MF_EVENT_TOPOLOGY_STATUS</a> attribute whose value is a member of this enumeration.
  *       
  * 
  * For a single topology, the Media Session sends these status flags in numerical order, starting with <b>MF_TOPOSTATUS_READY</b>. However, there is no guarantee about the ordering of the events across two different topologies. For example, you might get <b>MF_TOPOSTATUS_READY</b> for a topology before you get <b>MF_TOPOSTATUS_ENDED</b> for the previous topology.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfapi/ne-mfapi-mf_topostatus
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_TOPOSTATUS{

    /**
     * This value is not used.
     * @type {Integer (Int32)}
     */
    static MF_TOPOSTATUS_INVALID => 0

    /**
     * The topology is ready to start. After this status flag is received, you can use the Media Session's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfgetservice-getservice">IMFGetService::GetService</a> method to query the topology for services, such as rate control.
     * @type {Integer (Int32)}
     */
    static MF_TOPOSTATUS_READY => 100

    /**
     * The Media Session has started to read data from the media sources in the topology.
     * @type {Integer (Int32)}
     */
    static MF_TOPOSTATUS_STARTED_SOURCE => 200

    /**
     * The Media Session modified the topology, because the format of a stream changed.
     * @type {Integer (Int32)}
     */
    static MF_TOPOSTATUS_DYNAMIC_CHANGED => 210

    /**
     * The media sinks have switched from the previous topology to this topology. This status value is not sent for the first topology that is played. For the first topology, the <a href="https://docs.microsoft.com/windows/desktop/medfound/mesessionstarted">MESessionStarted</a> event indicates that the media sinks have started receiving data.
     * @type {Integer (Int32)}
     */
    static MF_TOPOSTATUS_SINK_SWITCHED => 300

    /**
     * Playback of this topology is complete. The Media Session might still use the topology internally. The Media Session does not completely release the topology until it sends the next <b>MF_TOPOSTATUS_STARTED_SOURCE</b> status event or the <a href="https://docs.microsoft.com/windows/desktop/medfound/mesessionended">MESessionEnded</a> event.
     * @type {Integer (Int32)}
     */
    static MF_TOPOSTATUS_ENDED => 400
}

#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the behavior of the IMFMediaSession::SetTopology method.
 * @remarks
 * 
 * These flags are optional, and are not mutually exclusive. If no flags are set, the Media Session resolves the topology and then adds it to the queue of pending presentations.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ne-mfidl-mfsession_settopology_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFSESSION_SETTOPOLOGY_FLAGS{

    /**
     * Stop the current presentation, clear all pending presentations, and immediately queue the new topology (specified by the <i>pTopology</i> parameter).
     * 
     * If the <i>pTopology</i>  parameter is <b>NULL</b>, this flag has no effect.
     * @type {Integer (Int32)}
     */
    static MFSESSION_SETTOPOLOGY_IMMEDIATE => 1

    /**
     * The topology does not need to be resolved. Use this flag if you are setting a full topology.
     * @type {Integer (Int32)}
     */
    static MFSESSION_SETTOPOLOGY_NORESOLUTION => 2

    /**
     * <div class="alert"><b>Note</b>  Requires Windows 7.</div>
     * <div> </div>
     * Clear the current topology, as follows:
     * 
     * <ul>
     * <li>If <i>pTopology</i> is not <b>NULL</b>, the topology is cleared only if  <i>pTopology</i> matches the current topology (that is, only if <i>pTopology</i> points to the current topology). </li>
     * <li>If the <i>pTopology</i> parameter is <b>NULL</b>, the current topology is cleared, regardless of which topology is current.</li>
     * </ul>
     * Pending topologies are not removed from the playback queue. If there is a pending topology on the queue, that topology will be loaded after the current topology is cleared. Otherwise, playback simply stops.
     * 
     * To remove all of the pending topologies from the queue, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasession-cleartopologies">IMFMediaSession::ClearTopologies</a>.
     * @type {Integer (Int32)}
     */
    static MFSESSION_SETTOPOLOGY_CLEAR_CURRENT => 4
}

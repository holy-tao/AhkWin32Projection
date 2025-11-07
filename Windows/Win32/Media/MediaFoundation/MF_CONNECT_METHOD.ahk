#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how the topology loader connects a topology node.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ne-mfidl-mf_connect_method
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_CONNECT_METHOD{

    /**
     * Connect the node directly to its upstream neighbor. Fail otherwise.
     * @type {Integer (Int32)}
     */
    static MF_CONNECT_DIRECT => 0

    /**
     * Add a converter transform upstream from this node, if needed to complete the connection. Converter transforms include color-space converters for video, and audio resamplers for audio.
     * @type {Integer (Int32)}
     */
    static MF_CONNECT_ALLOW_CONVERTER => 1

    /**
     * Add a decoder transform upstream upstream from this node, if needed to complete the connection. The numeric value of this flag includes the <b>MF_CONNECT_ALLOW_CONVERTER</b> flag. Therefore, setting the <b>MF_CONNECT_ALLOW_DECODER</b> flag sets the <b>MF_CONNECT_ALLOW_CONVERTER</b> flag as well.
     * @type {Integer (Int32)}
     */
    static MF_CONNECT_ALLOW_DECODER => 3

    /**
     * Controls the order in which the topology loader attempts to  
     *             use different output types from this node. Currently, this flag applies only to source nodes. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-topology-enumerate-source-types">MF_TOPOLOGY_ENUMERATE_SOURCE_TYPES</a>. 
     * 
     * <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static MF_CONNECT_RESOLVE_INDEPENDENT_OUTPUTTYPES => 4

    /**
     * This node is optional. If the topology loader cannot connect this node, it will skip the node and continue.
     * @type {Integer (Int32)}
     */
    static MF_CONNECT_AS_OPTIONAL => 65536

    /**
     * The entire topology branch starting at this node is optional. If the topology loader cannot resolve this branch, it will skip the branch and continue.
     * @type {Integer (Int32)}
     */
    static MF_CONNECT_AS_OPTIONAL_BRANCH => 131072
}

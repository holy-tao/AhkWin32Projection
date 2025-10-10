#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the type of a topology node.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ne-mfidl-mf_topology_type
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_TOPOLOGY_TYPE{

    /**
     * Output node. Represents a media sink in the topology.
     * @type {Integer (Int32)}
     */
    static MF_TOPOLOGY_OUTPUT_NODE => 0

    /**
     * Source node. Represents a media stream in the topology.
     * @type {Integer (Int32)}
     */
    static MF_TOPOLOGY_SOURCESTREAM_NODE => 1

    /**
     * Transform node. Represents a Media Foundation Transform (MFT) in the topology.
     * @type {Integer (Int32)}
     */
    static MF_TOPOLOGY_TRANSFORM_NODE => 2

    /**
     * Tee node. A tee node does not hold a pointer to an object. Instead, it represents a fork in the stream. A tee node has one input and multiple outputs, and samples from the upstream node are delivered to all of the downstream nodes.
     * @type {Integer (Int32)}
     */
    static MF_TOPOLOGY_TEE_NODE => 3

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static MF_TOPOLOGY_MAX => -1
}

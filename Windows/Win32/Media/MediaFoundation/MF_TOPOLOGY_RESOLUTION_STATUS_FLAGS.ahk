#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines status flags for the MF_TOPOLOGY_RESOLUTION_STATUS attribute.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mf_topology_resolution_status_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_TOPOLOGY_RESOLUTION_STATUS_FLAGS{

    /**
     * The topology was resolved successfully.
     * @type {Integer (Int32)}
     */
    static MF_TOPOLOGY_RESOLUTION_SUCCEEDED => 0

    /**
     * An optional topology node was rejected because the topology loader could not find a media type for the connection.
     * @type {Integer (Int32)}
     */
    static MF_OPTIONAL_NODE_REJECTED_MEDIA_TYPE => 1

    /**
     * An optional topology node was rejected because it could not be loaded into a protected process.
     * @type {Integer (Int32)}
     */
    static MF_OPTIONAL_NODE_REJECTED_PROTECTED_PROCESS => 2
}

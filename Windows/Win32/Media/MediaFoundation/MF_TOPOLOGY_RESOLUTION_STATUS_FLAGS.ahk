#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines status flags for the MF_TOPOLOGY_RESOLUTION_STATUS attribute.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mf_topology_resolution_status_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_TOPOLOGY_RESOLUTION_STATUS_FLAGS extends Win32Enum {

    /**
     * The topology was resolved successfully.
     * Native name: MF_TOPOLOGY_RESOLUTION_SUCCEEDED
     * @type {Integer (Int32)}
     */
    static SUCCEEDED => 0

    /**
     * An optional topology node was rejected because the topology loader could not find a media type for the connection.
     * Native name: MF_OPTIONAL_NODE_REJECTED_MEDIA_TYPE
     * @type {Integer (Int32)}
     */
    static OPTIONAL_NODE_REJECTED_MEDIA_TYPE => 1

    /**
     * An optional topology node was rejected because it could not be loaded into a protected process.
     * Native name: MF_OPTIONAL_NODE_REJECTED_PROTECTED_PROCESS
     * @type {Integer (Int32)}
     */
    static OPTIONAL_NODE_REJECTED_PROTECTED_PROCESS => 2
}

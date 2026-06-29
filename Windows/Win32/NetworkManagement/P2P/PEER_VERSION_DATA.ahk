#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PEER_VERSION_DATA structure contains the version information about the Peer Graphing and Grouping APIs.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_version_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_VERSION_DATA {
    #StructPack 2

    /**
     * Specifies the version of the Peer Infrastructure for a caller to use. The version to use is based on the Peer Infrastructure DLL installed on a local computer.  A high order-byte specifies the minor version (revision) number.  A low-order byte specifies the major version number.
     */
    wVersion : UInt16

    /**
     * Specifies the highest version of the Peer Infrastructure that the Peer DLL installed on the local computer can support. Typically, this value is the same as <b>wVersion</b>.
     */
    wHighestVersion : UInt16

}

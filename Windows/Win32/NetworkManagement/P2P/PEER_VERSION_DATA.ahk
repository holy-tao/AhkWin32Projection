#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PEER_VERSION_DATA structure contains the version information about the Peer Graphing and Grouping APIs.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_version_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_VERSION_DATA extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * Specifies the version of the Peer Infrastructure for a caller to use. The version to use is based on the Peer Infrastructure DLL installed on a local computer.  A high order-byte specifies the minor version (revision) number.  A low-order byte specifies the major version number.
     * @type {Integer}
     */
    wVersion {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Specifies the highest version of the Peer Infrastructure that the Peer DLL installed on the local computer can support. Typically, this value is the same as <b>wVersion</b>.
     * @type {Integer}
     */
    wHighestVersion {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}

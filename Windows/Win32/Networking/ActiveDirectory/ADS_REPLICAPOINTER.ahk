#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents an ADSI representation of the Replica Pointer attribute syntax.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_replicapointer
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_REPLICAPOINTER extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The null-terminated Unicode string that contains the name of the name server that holds the replica.
     * @type {PWSTR}
     */
    ServerName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type of replica: master, secondary, or read-only.
     * @type {Integer}
     */
    ReplicaType {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Replica identification number.
     * @type {Integer}
     */
    ReplicaNumber {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The number of existing replicas.
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A network address that is a likely reference to a node leading to the name server.
     * @type {Pointer<ADS_NETADDRESS>}
     */
    ReplicaAddressHints {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}

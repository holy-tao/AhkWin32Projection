#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ADS_NETADDRESS.ahk" { ADS_NETADDRESS }

/**
 * Represents an ADSI representation of the Replica Pointer attribute syntax.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_replicapointer
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct ADS_REPLICAPOINTER {
    #StructPack 8

    /**
     * The null-terminated Unicode string that contains the name of the name server that holds the replica.
     */
    ServerName : PWSTR

    /**
     * Type of replica: master, secondary, or read-only.
     */
    ReplicaType : UInt32

    /**
     * Replica identification number.
     */
    ReplicaNumber : UInt32

    /**
     * The number of existing replicas.
     */
    Count : UInt32

    /**
     * A network address that is a likely reference to a node leading to the name server.
     */
    ReplicaAddressHints : ADS_NETADDRESS.Ptr

}

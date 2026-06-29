#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPNG_ADDRESS.ahk" { IPNG_ADDRESS }

/**
 * The MCAST_SCOPE_CTX structure defines the scope context for programmatic interaction with multicast addresses. The MCAST_SCOPE_CTX structure is used by various MADCAP functions as a handle for allocating, renewing, or releasing MADCAP addresses.
 * @see https://learn.microsoft.com/windows/win32/api/madcapcl/ns-madcapcl-mcast_scope_ctx
 * @namespace Windows.Win32.NetworkManagement.Multicast
 */
export default struct MCAST_SCOPE_CTX {
    #StructPack 4

    /**
     * Identifier for the multicast scope, in the form of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/madcapcl/ns-madcapcl-ipng_address">IPNG_ADDRESS</a> structure.
     */
    ScopeID : IPNG_ADDRESS

    /**
     * Interface on which the multicast scope is available, in the form of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/madcapcl/ns-madcapcl-ipng_address">IPNG_ADDRESS</a> structure.
     */
    Interface : IPNG_ADDRESS

    /**
     * Internet Protocol (IP) address of the MADCAP server, in the form of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/madcapcl/ns-madcapcl-ipng_address">IPNG_ADDRESS</a> structure.
     */
    ServerID : IPNG_ADDRESS

}

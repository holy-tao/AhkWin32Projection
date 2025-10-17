#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IPNG_ADDRESS.ahk

/**
 * The MCAST_SCOPE_CTX structure defines the scope context for programmatic interaction with multicast addresses. The MCAST_SCOPE_CTX structure is used by various MADCAP functions as a handle for allocating, renewing, or releasing MADCAP addresses.
 * @see https://docs.microsoft.com/windows/win32/api//madcapcl/ns-madcapcl-mcast_scope_ctx
 * @namespace Windows.Win32.NetworkManagement.Multicast
 * @version v4.0.30319
 */
class MCAST_SCOPE_CTX extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Identifier for the multicast scope, in the form of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/madcapcl/ns-madcapcl-ipng_address">IPNG_ADDRESS</a> structure.
     * @type {IPNG_ADDRESS}
     */
    ScopeID{
        get {
            if(!this.HasProp("__ScopeID"))
                this.__ScopeID := IPNG_ADDRESS(0, this)
            return this.__ScopeID
        }
    }

    /**
     * Interface on which the multicast scope is available, in the form of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/madcapcl/ns-madcapcl-ipng_address">IPNG_ADDRESS</a> structure.
     * @type {IPNG_ADDRESS}
     */
    Interface{
        get {
            if(!this.HasProp("__Interface"))
                this.__Interface := IPNG_ADDRESS(24, this)
            return this.__Interface
        }
    }

    /**
     * Internet Protocol (IP) address of the MADCAP server, in the form of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/madcapcl/ns-madcapcl-ipng_address">IPNG_ADDRESS</a> structure.
     * @type {IPNG_ADDRESS}
     */
    ServerID{
        get {
            if(!this.HasProp("__ServerID"))
                this.__ServerID := IPNG_ADDRESS(48, this)
            return this.__ServerID
        }
    }
}

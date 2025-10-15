#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IPNG_ADDRESS.ahk
#Include .\MCAST_SCOPE_CTX.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\UNICODE_STRING.ahk

/**
 * The MCAST_SCOPE_ENTRY structure provides a complete set of information about a given multicast scope.
 * @see https://docs.microsoft.com/windows/win32/api//madcapcl/ns-madcapcl-mcast_scope_entry
 * @namespace Windows.Win32.NetworkManagement.Multicast
 * @version v4.0.30319
 */
class MCAST_SCOPE_ENTRY extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * Handle for the multicast scope, in the form of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/madcapcl/ns-madcapcl-mcast_scope_ctx">MCAST_SCOPE_CTX</a> structure.
     * @type {MCAST_SCOPE_CTX}
     */
    ScopeCtx{
        get {
            if(!this.HasProp("__ScopeCtx"))
                this.__ScopeCtx := MCAST_SCOPE_CTX(this.ptr + 0)
            return this.__ScopeCtx
        }
    }

    /**
     * Internet Protocol (IP) address of the last address in the scope, in the form of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/madcapcl/ns-madcapcl-ipng_address">IPNG_ADDRESS</a> structure.
     * @type {IPNG_ADDRESS}
     */
    LastAddr{
        get {
            if(!this.HasProp("__LastAddr"))
                this.__LastAddr := IPNG_ADDRESS(this.ptr + 72)
            return this.__LastAddr
        }
    }

    /**
     * Time To Live (TTL) value of the scope.
     * @type {Integer}
     */
    TTL {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * Description of the scope, in human readable, user-friendly format.
     * @type {UNICODE_STRING}
     */
    ScopeDesc{
        get {
            if(!this.HasProp("__ScopeDesc"))
                this.__ScopeDesc := UNICODE_STRING(this.ptr + 96)
            return this.__ScopeDesc
        }
    }
}

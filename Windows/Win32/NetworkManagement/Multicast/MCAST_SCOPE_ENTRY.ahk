#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }
#Import ".\IPNG_ADDRESS.ahk" { IPNG_ADDRESS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\MCAST_SCOPE_CTX.ahk" { MCAST_SCOPE_CTX }

/**
 * The MCAST_SCOPE_ENTRY structure provides a complete set of information about a given multicast scope.
 * @see https://learn.microsoft.com/windows/win32/api/madcapcl/ns-madcapcl-mcast_scope_entry
 * @namespace Windows.Win32.NetworkManagement.Multicast
 */
export default struct MCAST_SCOPE_ENTRY {
    #StructPack 8

    /**
     * Handle for the multicast scope, in the form of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/madcapcl/ns-madcapcl-mcast_scope_ctx">MCAST_SCOPE_CTX</a> structure.
     */
    ScopeCtx : MCAST_SCOPE_CTX

    /**
     * Internet Protocol (IP) address of the last address in the scope, in the form of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/madcapcl/ns-madcapcl-ipng_address">IPNG_ADDRESS</a> structure.
     */
    LastAddr : IPNG_ADDRESS

    /**
     * Time To Live (TTL) value of the scope.
     */
    TTL : UInt32

    /**
     * Description of the scope, in human readable, user-friendly format.
     */
    ScopeDesc : UNICODE_STRING

}

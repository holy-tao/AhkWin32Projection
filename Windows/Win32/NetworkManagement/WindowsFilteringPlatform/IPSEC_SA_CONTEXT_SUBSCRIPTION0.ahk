#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_SA_CONTEXT_ENUM_TEMPLATE0.ahk" { IPSEC_SA_CONTEXT_ENUM_TEMPLATE0 }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Stores information used to subscribe to notifications about a particular IPsec security association (SA) context.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_sa_context_subscription0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_SA_CONTEXT_SUBSCRIPTION0 {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_sa_context_enum_template0">IPSEC_SA_CONTEXT_ENUM_TEMPLATE0</a>*</b>
     * 
     * Enumeration template for limiting the subscription.
     */
    enumTemplate : IPSEC_SA_CONTEXT_ENUM_TEMPLATE0.Ptr

    /**
     * Type: <b>UINT32</b>
     * 
     * This member is reserved for system use.
     */
    flags : UInt32

    /**
     * Type: <b>GUID</b>
     * 
     * Identifies the session that created the subscription.
     */
    sessionKey : Guid

}

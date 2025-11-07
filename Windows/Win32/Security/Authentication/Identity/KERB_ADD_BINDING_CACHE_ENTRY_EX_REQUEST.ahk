#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * Allows the user to bind to a specific domain controller (DC), overriding the Kerberos domain binding cache.
 * @remarks
 * 
 * To meet both the user's requirements and Kerberos' requirements, you need  to make two calls to override the Kerberos domain binding cache.
 * 
 * <ol>
 * <li>
 * First, you construct a request message type of <a href="https://docs.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_query_domain_extended_policies_request">KERB_QUERY_DOMAIN_EXTENDED_POLICIES_REQUEST</a> in which the <b>MessageType</b> member must be set to <b>KerbQueryDomainExtendedPoliciesMessage</b>. The <b>DomainName</b> member is set to the actual domain name for which the extended domain policies are queried. If <b>DomainName</b> is set to null, the local computer's domain is assumed.
 * 
 * </li>
 * <li>
 * Next, you call the <a href="https://docs.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_query_domain_extended_policies_response">LsaCallAuthenticationPackage</a> function with Kerberos authentication package and the request message.  Upon successful return, <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_query_domain_extended_policies_response">KERB_QUERY_DOMAIN_EXTENDED_POLICIES_RESPONSE</a> is returned.<ul>
 * <li>If the local computer has disabled DAC, the <b>Flags</b> member is set to 	KERB_QUERY_DOMAIN_EXTENDED_POLICIES_RESPONSE_FLAG_DAC_DISABLED.</li>
 * <li>If the specified domain has Flexible Authentication Secure Tunneling (FAST) enabled, <b>ExtendedPolicies</b> member is set to  KERB_EXTENDED_POLICY_FAST_CAPABLE (0x10000).</li>
 * <li>If the specified domain has Claims enabled, <b>ExtendedPolicies</b> member is set to  KERB_EXTENDED_POLICY_CLAIMS_CAPABLE (0x40000).</li>
 * <li>If the local computer  domain doesn't disable DAC and the specified domain has either FAST or Claims  enabled, the <b>DsFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> function is set to  DS_DIRECTORY_SERVICE_8_REQUIRED. Otherwise, <b>DsFlags</b> is 0.</li>
 * <li>If the function returns a failure in the <b>ProtocolStatus</b> member, STATUS_NOT_FOUND indicates that the specified domain cannot be queried because the local computer doesn't have trust to the specified domain. Other error codes indicate the actual failure encountered.</li>
 * </ul>
 * 
 * 
 * </li>
 * <li>
 * Then you must call <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> with the returned <b>DsFlags</b> set with flags that represent your own requirements, which may be several, so use the  logical operator <b>OR</b>. The <b>DomainControllerInfo</b> member is returned. 
 * 
 * </li>
 * <li>
 * Finally, you call the <a href="https://docs.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_query_domain_extended_policies_response">LsaCallAuthenticationPackage</a> function again with the Kerberos authentication package and the request <b>KERB_ADD_BINDING_CACHE_ENTRY_EX_REQUEST</b> in which the <b>DcFlags</b> member is set to the <b>DomainControllerInfo</b> flags. All other members should be populated in the same way as <b>KERB_ADD_BINDING_CACHE_ENTRY_EX_REQUEST</b>. If the <b>DsFlags</b> of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_query_domain_extended_policies_response">KERB_QUERY_DOMAIN_EXTENDED_POLICIES_RESPONSE</a> is zero, then either <b>DcFlags</b> should be set to zero when calling <b>KERB_ADD_BINDING_CACHE_ENTRY_EX_REQUEST</b> or default back to the existing KERB_ADD_BINDING_CACHE_ENTRY_REQUEST request.
 * 
 * </li>
 * </ol>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ns-ntsecapi-kerb_add_binding_cache_entry_ex_request
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_ADD_BINDING_CACHE_ENTRY_EX_REQUEST extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * A 
     * 						value of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-kerb_protocol_message_type">KERB_PROTOCOL_MESSAGE_TYPE</a> enumeration that lists the types of messages that can be sent to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">Kerberos</a> authentication package by calling 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage">LsaCallAuthenticationPackage</a> function. This member must be set to <b>KerbAddBindingCacheEntryExMessage</b>.
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The 	name of the realm of the domain controller.
     * @type {LSA_UNICODE_STRING}
     */
    RealmName{
        get {
            if(!this.HasProp("__RealmName"))
                this.__RealmName := LSA_UNICODE_STRING(8, this)
            return this.__RealmName
        }
    }

    /**
     * The address of the Key Distribution Center (KDC) of the server to  which you want to bind.
     * @type {LSA_UNICODE_STRING}
     */
    KdcAddress{
        get {
            if(!this.HasProp("__KdcAddress"))
                this.__KdcAddress := LSA_UNICODE_STRING(24, this)
            return this.__KdcAddress
        }
    }

    /**
     * 
     * @type {Integer}
     */
    AddressType {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The domain controller flags that the caller provides. These flags are needed to pass to the <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> function.
     * @type {Integer}
     */
    DcFlags {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}

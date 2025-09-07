#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains information that describes an IKE/AuthIP Main Mode (MM) failure. (FWPM_NET_EVENT_IKEEXT_MM_FAILURE1)
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event_ikeext_mm_failure1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_NET_EVENT_IKEEXT_MM_FAILURE1 extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * Windows error code for the failure.
     * @type {Integer}
     */
    failureErrorCode {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An [IPSEC_FAILURE_POINT](../ipsectypes/ne-ipsectypes-ipsec_failure_point.md) value that indicates the IPsec state when the failure occurred.
     * @type {Integer}
     */
    failurePoint {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Flags for the failure event.
     * 
     * | Value | Meaning |
     * | ----- | ------- |
     * | FWPM_NET_EVENT_IKEEXT_MM_FAILURE_FLAG_BENIGN | Indicates that the failure was benign or expected. |
     * | FWPM_NET_EVENT_IKEEXT_MM_FAILURE_FLAG_MULTIPLE | Indicates that multiple failure events have been reported. |
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * An [IKEEXT_KEY_MODULE_TYPE](../iketypes/ne-iketypes-ikeext_key_module_type.md) value that specifies the type of keying module.
     * @type {Integer}
     */
    keyingModuleType {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * An [IKEEXT_MM_SA_STATE](../iketypes/ne-iketypes-ikeext_mm_sa_state.md) value that indicates the Main Mode state when the failure occurred.
     * @type {Integer}
     */
    mmState {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * An [IKEEXT_SA_ROLE](../iketypes/ne-iketypes-ikeext_sa_role.md) value that specifies the security association (SA) role when the failure occurred.
     * @type {Integer}
     */
    saRole {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * An [IKEEXT_AUTHENTICATION_METHOD_TYPE](../iketypes/ne-iketypes-ikeext_authentication_method_type.md) value that specifies the authentication method.
     * @type {Integer}
     */
    mmAuthMethod {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * SHA thumbprint hash of the end certificate corresponding to the failures that happen during building or validating certificate chains.
     * 
     * **IKEEXT_CERT_HASH_LEN** maps to 20.
     * @type {Array<Byte>}
     */
    endCertHash{
        get {
            if(!this.HasProp("__endCertHashProxyArray"))
                this.__endCertHashProxyArray := Win32FixedArray(this.ptr + 28, 1, Primitive, "char")
            return this.__endCertHashProxyArray
        }
    }

    /**
     * LUID for the MM SA.
     * @type {Integer}
     */
    mmId {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Main mode filter ID.
     * @type {Integer}
     */
    mmFilterId {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Name of the MM local security principal.
     * @type {PWSTR}
     */
    localPrincipalNameForAuth{
        get {
            if(!this.HasProp("__localPrincipalNameForAuth"))
                this.__localPrincipalNameForAuth := PWSTR(this.ptr + 64)
            return this.__localPrincipalNameForAuth
        }
    }

    /**
     * Name of the MM remote security principal.
     * @type {PWSTR}
     */
    remotePrincipalNameForAuth{
        get {
            if(!this.HasProp("__remotePrincipalNameForAuth"))
                this.__remotePrincipalNameForAuth := PWSTR(this.ptr + 72)
            return this.__remotePrincipalNameForAuth
        }
    }

    /**
     * Number of groups in the local security principal's token.
     * @type {Integer}
     */
    numLocalPrincipalGroupSids {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Groups in the local security principal's token.
     * @type {Pointer<PWSTR>}
     */
    localPrincipalGroupSids {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Number of groups in the remote security principal's token.
     * @type {Integer}
     */
    numRemotePrincipalGroupSids {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Groups in the remote security principal's token.
     * @type {Pointer<PWSTR>}
     */
    remotePrincipalGroupSids {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }
}

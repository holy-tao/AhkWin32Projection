#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FWPM_NET_EVENT_IKEEXT_EM_FAILURE1 structure contains information that describes an IKE Extended mode (EM) failure.Note  FWPM_NET_EVENT_IKEEXT_EM_FAILURE1 is the specific implementation of FWPM_NET_EVENT_IKEEXT_EM_FAILURE used in Windows 7 and later.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event_ikeext_em_failure1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_NET_EVENT_IKEEXT_EM_FAILURE1 extends Win32Struct
{
    static sizeof => 120

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
     * | FWPM_NET_EVENT_IKEEXT_EM_FAILURE_FLAG_MULTIPLE | Indicates that multiple IKE EM failure events have been reported. |
     * | FWPM_NET_EVENT_IKEEXT_EM_FAILURE_FLAG_BENIGN | Indicates that IKE EM failure events have been reported, but that the events are benign. |
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * An [IKEEXT_EM_SA_STATE](../iketypes/ne-iketypes-ikeext_em_sa_state.md) value that indicates the EM state when the failure occurred.
     * @type {Integer}
     */
    emState {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * An [IKEEXT_SA_ROLE](../iketypes/ne-iketypes-ikeext_sa_role.md) value that specifies the SA role when the failure occurred.
     * @type {Integer}
     */
    saRole {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * An [IKEEXT_AUTHENTICATION_METHOD_TYPE](../iketypes/ne-iketypes-ikeext_authentication_method_type.md) value that specifies the authentication method.
     * @type {Integer}
     */
    emAuthMethod {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
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
                this.__endCertHashProxyArray := Win32FixedArray(this.ptr + 24, 20, Primitive, "char")
            return this.__endCertHashProxyArray
        }
    }

    /**
     * LUID for the Main Mode (MM) SA.
     * @type {Integer}
     */
    mmId {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Quick Mode (QM) filter ID associated with this failure.
     * @type {Integer}
     */
    qmFilterId {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Name of the EM local security principal.
     * @type {Pointer<PWSTR>}
     */
    localPrincipalNameForAuth {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Name of the EM remote security principal.
     * @type {Pointer<PWSTR>}
     */
    remotePrincipalNameForAuth {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
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

    /**
     * Type of traffic for which the embedded quick mode was being negotiated.
     * @type {Integer}
     */
    saTrafficType {
        get => NumGet(this, 112, "int")
        set => NumPut("int", value, this, 112)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Is used to store the IKE/AuthIP main mode negotiation policy.
 * @see https://docs.microsoft.com/windows/win32/api//iketypes/ns-iketypes-ikeext_policy1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_POLICY1 extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Lifetime of the IPsec soft SA, in seconds. The caller must set this to 0.
     * @type {Integer}
     */
    softExpirationTime {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of authentication methods.
     * @type {Integer}
     */
    numAuthenticationMethods {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Array of acceptable authentication methods.
     * 
     * See  [IKEEXT_AUTHENTICATION_METHOD1](/windows/desktop/api/iketypes/ns-iketypes-ikeext_authentication_method1) for more information.
     * @type {Pointer<IKEEXT_AUTHENTICATION_METHOD1>}
     */
    authenticationMethods {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type of impersonation. Applies only to AuthIP. 
     * 
     * See <a href="https://docs.microsoft.com/windows/win32/api/iketypes/ne-iketypes-ikeext_authentication_impersonation_type">IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE</a> for more information.
     * @type {Integer}
     */
    initiatorImpersonationType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Number of main mode proposals.
     * @type {Integer}
     */
    numIkeProposals {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Array of main mode proposals. 
     * 
     * See [IKEEXT_PROPOSAL0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_proposal0) for more information.
     * @type {Pointer<IKEEXT_PROPOSAL0>}
     */
    ikeProposals {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * 
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Maximum number of dynamic IPsec filters per remote IP address and per 
     *    transport layer that is allowed to be added for any SA negotiated using 
     *    this policy. 
     * 
     * Set this to 0 to disable dynamic filter addition. Dynamic filters are added by IKE/AuthIP on responder, when the QM traffic proposed by initiator is a subset of responder's traffic configuration.
     * @type {Integer}
     */
    maxDynamicFilters {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The number of seconds for which IKEv2 SA negotiation packets will be retransmitted before the SA times out. The caller must set this to at least 120 seconds.
     * @type {Integer}
     */
    retransmitDurationSecs {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}

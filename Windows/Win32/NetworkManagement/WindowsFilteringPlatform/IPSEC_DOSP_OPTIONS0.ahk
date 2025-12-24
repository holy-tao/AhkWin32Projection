#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FWP_V6_ADDR_AND_MASK.ahk

/**
 * Used to store configuration parameters for IPsec DoS Protection.
 * @remarks
 * <b>IPSEC_DOSP_OPTIONS0</b> is a specific implementation of IPSEC_DOSP_OPTIONS. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_dosp_options0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_DOSP_OPTIONS0 extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * The number of seconds before idle timeout. This value must be greater than 0.
     * @type {Integer}
     */
    stateIdleTimeoutSeconds {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The idle timeout for the per IP rate limit queue object. This value must be greater than 0.
     * @type {Integer}
     */
    perIPRateLimitQueueIdleTimeoutSeconds {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The DSCP marking for unauthenticated inbound IPv6 IPsec traffic. This value must be less than or equal to 63. Specify IPSEC_DOSP_DSCP_DISABLE_VALUE to disable DSCP marking for this category.
     * @type {Integer}
     */
    ipV6IPsecUnauthDscp {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * The rate limit for unauthenticated inbound IPv6 IPsec traffic. Specify IPSEC_DOSP_RATE_LIMIT_DISABLE_VALUE to disable rate limiting for this category.
     * @type {Integer}
     */
    ipV6IPsecUnauthRateLimitBytesPerSec {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The rate limit for unauthenticated inbound IPv6 IPsec traffic per internal IP address. Specify IPSEC_DOSP_RATE_LIMIT_DISABLE_VALUE to disable rate limiting for this category.
     * @type {Integer}
     */
    ipV6IPsecUnauthPerIPRateLimitBytesPerSec {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The DSCP marking for authenticated inbound IPv6 IPsec traffic. The value must be less than or equal to 63. Specify IPSEC_DOSP_DSCP_DISABLE_VALUE to disable DSCP marking for this category.
     * @type {Integer}
     */
    ipV6IPsecAuthDscp {
        get => NumGet(this, 20, "char")
        set => NumPut("char", value, this, 20)
    }

    /**
     * The rate limit for authenticated inbound IPv6 IPsec traffic. Specify IPSEC_DOSP_RATE_LIMIT_DISABLE_VALUE to disable rate limiting for this category..
     * @type {Integer}
     */
    ipV6IPsecAuthRateLimitBytesPerSec {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The DSCP marking for  inbound ICMPv6 traffic. The value must be less than or equal to 63. Specify IPSEC_DOSP_DSCP_DISABLE_VALUE to disable DSCP marking for this category.
     * @type {Integer}
     */
    icmpV6Dscp {
        get => NumGet(this, 28, "char")
        set => NumPut("char", value, this, 28)
    }

    /**
     * The rate limit for  inbound ICMPv6 traffic. Specify IPSEC_DOSP_RATE_LIMIT_DISABLE_VALUE to disable rate limiting for this category.
     * @type {Integer}
     */
    icmpV6RateLimitBytesPerSec {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The DSCP marking for  inbound IPv6 filter exempted traffic. The value must be less than or equal to 63. Specify IPSEC_DOSP_DSCP_DISABLE_VALUE to disable DSCP marking for this category.
     * @type {Integer}
     */
    ipV6FilterExemptDscp {
        get => NumGet(this, 36, "char")
        set => NumPut("char", value, this, 36)
    }

    /**
     * The rate limit for  inbound IPV6 filter exempted traffic. Specify IPSEC_DOSP_RATE_LIMIT_DISABLE_VALUE to disable rate limiting for this category.
     * @type {Integer}
     */
    ipV6FilterExemptRateLimitBytesPerSec {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The DSCP marking for  inbound default-block exempted traffic. The value must be less than or equal to 63. Specify IPSEC_DOSP_DSCP_DISABLE_VALUE to disable DSCP marking for this category.
     * @type {Integer}
     */
    defBlockExemptDscp {
        get => NumGet(this, 44, "char")
        set => NumPut("char", value, this, 44)
    }

    /**
     * The rate limit for  inbound default-block exempted traffic. Specify IPSEC_DOSP_RATE_LIMIT_DISABLE_VALUE to disable rate limiting for this category.
     * @type {Integer}
     */
    defBlockExemptRateLimitBytesPerSec {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The maximum number of state entries in the table. The value must be greater than 0.
     * @type {Integer}
     */
    maxStateEntries {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * The maximum number of rate limit queues for inbound unauthenticated IPv6 IPsec traffic per internal IP address. The value must be greater than 0.
     * @type {Integer}
     */
    maxPerIPRateLimitQueues {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * 
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * The number  of public Internet facing interface identifiers for which DOS protection should be enabled.
     * @type {Integer}
     */
    numPublicIFLuids {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Pointer to an array of public Internet facing interface identifiers for which DOS protection should be enabled.
     * @type {Pointer<Integer>}
     */
    publicIFLuids {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * The number of internal network facing interface identifiers for which DOS protection should be enabled.
     * @type {Integer}
     */
    numInternalIFLuids {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Pointer to an array of internal network facing interface identifiers for which DOS protection should be enabled.
     * @type {Pointer<Integer>}
     */
    internalIFLuids {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Optional public IPv6 address or subnet for this policy, as specified in [FWP_V6_ADDR_AND_MASK](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_v6_addr_and_mask).
     * @type {FWP_V6_ADDR_AND_MASK}
     */
    publicV6AddrMask{
        get {
            if(!this.HasProp("__publicV6AddrMask"))
                this.__publicV6AddrMask := FWP_V6_ADDR_AND_MASK(96, this)
            return this.__publicV6AddrMask
        }
    }

    /**
     * Optional internal IPv6 address or subnet for this policy, as specified in [FWP_V6_ADDR_AND_MASK](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_v6_addr_and_mask).
     * @type {FWP_V6_ADDR_AND_MASK}
     */
    internalV6AddrMask{
        get {
            if(!this.HasProp("__internalV6AddrMask"))
                this.__internalV6AddrMask := FWP_V6_ADDR_AND_MASK(113, this)
            return this.__internalV6AddrMask
        }
    }
}

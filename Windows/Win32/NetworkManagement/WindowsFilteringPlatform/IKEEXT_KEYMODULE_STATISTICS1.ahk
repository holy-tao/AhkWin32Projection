#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IKEEXT_IP_VERSION_SPECIFIC_KEYMODULE_STATISTICS1.ahk

/**
 * Contains various statistics specific to the keying module.
 * @see https://docs.microsoft.com/windows/win32/api//iketypes/ns-iketypes-ikeext_keymodule_statistics1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_KEYMODULE_STATISTICS1 extends Win32Struct
{
    static sizeof => 544

    static packingSize => 8

    /**
     * IPv4 common statistics.
     * 
     * See <a href="https://docs.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_ip_version_specific_keymodule_statistics1">IKEEXT_IP_VERSION_SPECIFIC_KEYMODULE_STATISTICS1</a> for more information.
     * @type {IKEEXT_IP_VERSION_SPECIFIC_KEYMODULE_STATISTICS1}
     */
    v4Statistics{
        get {
            if(!this.HasProp("__v4Statistics"))
                this.__v4Statistics := IKEEXT_IP_VERSION_SPECIFIC_KEYMODULE_STATISTICS1(0, this)
            return this.__v4Statistics
        }
    }

    /**
     * IPv6 common statistics.
     * 
     * See <a href="https://docs.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_ip_version_specific_keymodule_statistics1">IKEEXT_IP_VERSION_SPECIFIC_KEYMODULE_STATISTICS1</a> for more information.
     * @type {IKEEXT_IP_VERSION_SPECIFIC_KEYMODULE_STATISTICS1}
     */
    v6Statistics{
        get {
            if(!this.HasProp("__v6Statistics"))
                this.__v6Statistics := IKEEXT_IP_VERSION_SPECIFIC_KEYMODULE_STATISTICS1(72, this)
            return this.__v6Statistics
        }
    }

    /**
     * Table containing the frequencies of various IKE Win32 error codes encountered during negotiations. The error codes range from ERROR_IPSEC_IKE_NEG_STATUS_BEGIN to ERROR_IPSEC_IKE_NEG_STATUS_END. 
     * 
     * The table size, IKEEXT_ERROR_CODE_COUNT, is 84 (ERROR_IPSEC_IKE_NEG_STATUS_END - ERROR_IPSEC_IKE_NEG_STATUS_BEGIN).
     * @type {Array<UInt32>}
     */
    errorFrequencyTable{
        get {
            if(!this.HasProp("__errorFrequencyTableProxyArray"))
                this.__errorFrequencyTableProxyArray := Win32FixedArray(this.ptr + 144, 97, Primitive, "uint")
            return this.__errorFrequencyTableProxyArray
        }
    }

    /**
     * Current Main Mode negotiation time.
     * @type {Integer}
     */
    mainModeNegotiationTime {
        get => NumGet(this, 532, "uint")
        set => NumPut("uint", value, this, 532)
    }

    /**
     * Current Quick Mode negotiation time.
     * @type {Integer}
     */
    quickModeNegotiationTime {
        get => NumGet(this, 536, "uint")
        set => NumPut("uint", value, this, 536)
    }

    /**
     * Current Extended Mode negotiation time.  This member is applicable for AuthIp only.
     * @type {Integer}
     */
    extendedModeNegotiationTime {
        get => NumGet(this, 540, "uint")
        set => NumPut("uint", value, this, 540)
    }
}

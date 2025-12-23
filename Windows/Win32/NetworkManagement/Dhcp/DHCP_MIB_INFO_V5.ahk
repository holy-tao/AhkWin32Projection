#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DATE_TIME.ahk

/**
 * Contains statistical information about a DHCP server.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_mib_info_v5
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_MIB_INFO_V5 extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * The number of DISCOVER messages received by the DHCP server.
     * @type {Integer}
     */
    Discovers {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of OFFER messages sent to DHCP clients.
     * @type {Integer}
     */
    Offers {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of REQUEST messages received by  DHCP clients.
     * @type {Integer}
     */
    Requests {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The number of ACK messages sent by the DHCP server.
     * @type {Integer}
     */
    Acks {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The number of NACK messages sent by the DHCP server.
     * @type {Integer}
     */
    Naks {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of DECLINE messages sent by DHCP clients.
     * @type {Integer}
     */
    Declines {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The number of RELEASE messages  received by the DHCP server.
     * @type {Integer}
     */
    Releases {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-date_time">DATE_TIME</a> structure that contains the most recent time the DHCP server was started.
     * @type {DATE_TIME}
     */
    ServerStartTime{
        get {
            if(!this.HasProp("__ServerStartTime"))
                this.__ServerStartTime := DATE_TIME(28, this)
            return this.__ServerStartTime
        }
    }

    /**
     * This member is not currently used. Please set this to value 0x00000000.
     * @type {Integer}
     */
    QtnNumLeases {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * This member is not currently used. Please set this to value 0x00000000.
     * @type {Integer}
     */
    QtnPctQtnLeases {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * This member is not currently used. Please set this to value 0x00000000.
     * @type {Integer}
     */
    QtnProbationLeases {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * This member is not currently used. Please set this to value 0x00000000.
     * @type {Integer}
     */
    QtnNonQtnLeases {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * This member is not currently used. Please set this to value 0x00000000.
     * @type {Integer}
     */
    QtnExemptLeases {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * This member is not currently used. Please set this to value 0x00000000.
     * @type {Integer}
     */
    QtnCapableClients {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * This member is not currently used. Please set this to value 0x00000000.
     * @type {Integer}
     */
    QtnIASErrors {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * The number of OFFER messages sent with a specific delay by the DHCP server.
     * @type {Integer}
     */
    DelayedOffers {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The number of scopes with a delay value greater than 0.
     * @type {Integer}
     */
    ScopesWithDelayedOffers {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * The total number of scopes configured on the DHCP server
     * @type {Integer}
     */
    Scopes {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-scope_mib_info_v5">SCOPE_MIB_INFO_V5</a> structure that contains specific information about the scopes configured on the DHCP server.
     * @type {Pointer<SCOPE_MIB_INFO_V5>}
     */
    ScopeInfo {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_EXTSTA_ATTRIBUTES extends Win32Struct
{
    static sizeof => 160

    static packingSize => 8

    /**
     * @type {NDIS_OBJECT_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := NDIS_OBJECT_HEADER(0, this)
            return this.__Header
        }
    }

    /**
     * @type {Integer}
     */
    uScanSSIDListSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    uDesiredBSSIDListSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    uDesiredSSIDListSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    uExcludedMacAddressListSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    uPrivacyExemptionListSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    uKeyMappingTableSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    uDefaultKeyTableSize {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    uWEPKeyValueMaxLength {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    uPMKIDCacheSize {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    uMaxNumPerSTADefaultKeyTables {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {BOOLEAN}
     */
    bStrictlyOrderedServiceClassImplemented {
        get => NumGet(this, 44, "char")
        set => NumPut("char", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    ucSupportedQoSProtocolFlags {
        get => NumGet(this, 45, "char")
        set => NumPut("char", value, this, 45)
    }

    /**
     * @type {BOOLEAN}
     */
    bSafeModeImplemented {
        get => NumGet(this, 46, "char")
        set => NumPut("char", value, this, 46)
    }

    /**
     * @type {Integer}
     */
    uNumSupportedCountryOrRegionStrings {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pSupportedCountryOrRegionStrings {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    uInfraNumSupportedUcastAlgoPairs {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Pointer<DOT11_AUTH_CIPHER_PAIR>}
     */
    pInfraSupportedUcastAlgoPairs {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    uInfraNumSupportedMcastAlgoPairs {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Pointer<DOT11_AUTH_CIPHER_PAIR>}
     */
    pInfraSupportedMcastAlgoPairs {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    uAdhocNumSupportedUcastAlgoPairs {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Pointer<DOT11_AUTH_CIPHER_PAIR>}
     */
    pAdhocSupportedUcastAlgoPairs {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    uAdhocNumSupportedMcastAlgoPairs {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * @type {Pointer<DOT11_AUTH_CIPHER_PAIR>}
     */
    pAdhocSupportedMcastAlgoPairs {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {BOOLEAN}
     */
    bAutoPowerSaveMode {
        get => NumGet(this, 128, "char")
        set => NumPut("char", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    uMaxNetworkOffloadListSize {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * @type {BOOLEAN}
     */
    bMFPCapable {
        get => NumGet(this, 136, "char")
        set => NumPut("char", value, this, 136)
    }

    /**
     * @type {Integer}
     */
    uInfraNumSupportedMcastMgmtAlgoPairs {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }

    /**
     * @type {Pointer<DOT11_AUTH_CIPHER_PAIR>}
     */
    pInfraSupportedMcastMgmtAlgoPairs {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * @type {BOOLEAN}
     */
    bNeighborReportSupported {
        get => NumGet(this, 152, "char")
        set => NumPut("char", value, this, 152)
    }

    /**
     * @type {BOOLEAN}
     */
    bAPChannelReportSupported {
        get => NumGet(this, 153, "char")
        set => NumPut("char", value, this, 153)
    }

    /**
     * @type {BOOLEAN}
     */
    bActionFramesSupported {
        get => NumGet(this, 154, "char")
        set => NumPut("char", value, this, 154)
    }

    /**
     * @type {BOOLEAN}
     */
    bANQPQueryOffloadSupported {
        get => NumGet(this, 155, "char")
        set => NumPut("char", value, this, 155)
    }

    /**
     * @type {BOOLEAN}
     */
    bHESSIDConnectionSupported {
        get => NumGet(this, 156, "char")
        set => NumPut("char", value, this, 156)
    }
}

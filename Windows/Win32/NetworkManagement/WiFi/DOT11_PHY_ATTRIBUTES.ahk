#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk
#Include .\DOT11_HRDSSS_PHY_ATTRIBUTES.ahk
#Include .\DOT11_OFDM_PHY_ATTRIBUTES.ahk
#Include .\DOT11_ERP_PHY_ATTRIBUTES.ahk
#Include .\DOT11_DATA_RATE_MAPPING_ENTRY.ahk
#Include .\DOT11_SUPPORTED_DATA_RATES_VALUE_V2.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_PHY_ATTRIBUTES extends Win32Struct
{
    static sizeof => 1600

    static packingSize => 8

    class _PhySpecificAttributes_e__Union extends Win32Struct {
        static sizeof => 12
        static packingSize => 4

        /**
         * @type {DOT11_HRDSSS_PHY_ATTRIBUTES}
         */
        HRDSSSAttributes{
            get {
                if(!this.HasProp("__HRDSSSAttributes"))
                    this.__HRDSSSAttributes := DOT11_HRDSSS_PHY_ATTRIBUTES(0, this)
                return this.__HRDSSSAttributes
            }
        }
    
        /**
         * @type {DOT11_OFDM_PHY_ATTRIBUTES}
         */
        OFDMAttributes{
            get {
                if(!this.HasProp("__OFDMAttributes"))
                    this.__OFDMAttributes := DOT11_OFDM_PHY_ATTRIBUTES(0, this)
                return this.__OFDMAttributes
            }
        }
    
        /**
         * @type {DOT11_ERP_PHY_ATTRIBUTES}
         */
        ERPAttributes{
            get {
                if(!this.HasProp("__ERPAttributes"))
                    this.__ERPAttributes := DOT11_ERP_PHY_ATTRIBUTES(0, this)
                return this.__ERPAttributes
            }
        }
    
    }

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
    PhyType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {BOOLEAN}
     */
    bHardwarePhyState {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {BOOLEAN}
     */
    bSoftwarePhyState {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * @type {BOOLEAN}
     */
    bCFPollable {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * @type {Integer}
     */
    uMPDUMaxLength {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    TempType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    DiversitySupport {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {_PhySpecificAttributes_e__Union}
     */
    PhySpecificAttributes{
        get {
            if(!this.HasProp("__PhySpecificAttributes"))
                this.__PhySpecificAttributes := %this.__Class%._PhySpecificAttributes_e__Union(24, this)
            return this.__PhySpecificAttributes
        }
    }

    /**
     * @type {Integer}
     */
    uNumberSupportedPowerLevels {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Array<UInt32>}
     */
    TxPowerLevels{
        get {
            if(!this.HasProp("__TxPowerLevelsProxyArray"))
                this.__TxPowerLevelsProxyArray := Win32FixedArray(this.ptr + 40, 8, Primitive, "uint")
            return this.__TxPowerLevelsProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    uNumDataRateMappingEntries {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Array<DOT11_DATA_RATE_MAPPING_ENTRY>}
     */
    DataRateMappingEntries{
        get {
            if(!this.HasProp("__DataRateMappingEntriesProxyArray"))
                this.__DataRateMappingEntriesProxyArray := Win32FixedArray(this.ptr + 80, 126, DOT11_DATA_RATE_MAPPING_ENTRY, "")
            return this.__DataRateMappingEntriesProxyArray
        }
    }

    /**
     * @type {DOT11_SUPPORTED_DATA_RATES_VALUE_V2}
     */
    SupportedDataRatesValue{
        get {
            if(!this.HasProp("__SupportedDataRatesValue"))
                this.__SupportedDataRatesValue := DOT11_SUPPORTED_DATA_RATES_VALUE_V2(1088, this)
            return this.__SupportedDataRatesValue
        }
    }
}

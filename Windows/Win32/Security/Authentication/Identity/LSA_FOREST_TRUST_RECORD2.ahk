#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_FOREST_TRUST_BINARY_DATA.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\LSA_FOREST_TRUST_SCANNER_INFO.ahk
#Include .\LSA_FOREST_TRUST_RECORD_TYPE.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include ..\..\PSID.ahk
#Include .\LSA_FOREST_TRUST_DOMAIN_INFO.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class LSA_FOREST_TRUST_RECORD2 extends Win32Struct {
    static sizeof => 56

    static packingSize => 8

    class _ForestTrustData extends Win32Struct {
        static sizeof => 40
        static packingSize => 8

        /**
         * @type {LSA_UNICODE_STRING}
         */
        TopLevelName {
            get {
                if(!this.HasProp("__TopLevelName"))
                    this.__TopLevelName := LSA_UNICODE_STRING(0, this)
                return this.__TopLevelName
            }
        }

        /**
         * @type {LSA_FOREST_TRUST_DOMAIN_INFO}
         */
        DomainInfo {
            get {
                if(!this.HasProp("__DomainInfo"))
                    this.__DomainInfo := LSA_FOREST_TRUST_DOMAIN_INFO(0, this)
                return this.__DomainInfo
            }
        }

        /**
         * @type {LSA_FOREST_TRUST_BINARY_DATA}
         */
        BinaryData {
            get {
                if(!this.HasProp("__BinaryData"))
                    this.__BinaryData := LSA_FOREST_TRUST_BINARY_DATA(0, this)
                return this.__BinaryData
            }
        }

        /**
         * @type {LSA_FOREST_TRUST_SCANNER_INFO}
         */
        ScannerInfo {
            get {
                if(!this.HasProp("__ScannerInfo"))
                    this.__ScannerInfo := LSA_FOREST_TRUST_SCANNER_INFO(0, this)
                return this.__ScannerInfo
            }
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {LSA_FOREST_TRUST_RECORD_TYPE}
     */
    ForestTrustType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Time {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {_ForestTrustData}
     */
    ForestTrustData {
        get {
            if(!this.HasProp("__ForestTrustData"))
                this.__ForestTrustData := LSA_FOREST_TRUST_RECORD2._ForestTrustData(16, this)
            return this.__ForestTrustData
        }
    }
}

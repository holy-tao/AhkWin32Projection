#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_BSS_ENTRY_PHY_SPECIFIC_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    class _FHSS extends Win32Struct {
        static sizeof => 12
        static packingSize => 4

        /**
         * @type {Integer}
         */
        uHopPattern {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        uHopSet {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        uDwellTime {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
    }

    /**
     * @type {Integer}
     */
    uChCenterFrequency {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {_FHSS}
     */
    FHSS{
        get {
            if(!this.HasProp("__FHSS"))
                this.__FHSS := %this.__Class%._FHSS(0, this)
            return this.__FHSS
        }
    }
}

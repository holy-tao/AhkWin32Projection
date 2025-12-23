#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ChannelInfo extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    lFrequency {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    class _DVB extends Win32Struct {
        static sizeof => 12
        static packingSize => 4

        /**
         * @type {Integer}
         */
        lONID {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        lTSID {
            get => NumGet(this, 4, "int")
            set => NumPut("int", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        lSID {
            get => NumGet(this, 8, "int")
            set => NumPut("int", value, this, 8)
        }
    
    }

    class _DC extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * @type {Integer}
         */
        lProgNumber {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
    }

    class _ATSC extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * @type {Integer}
         */
        lProgNumber {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
    }

    /**
     * @type {_DVB}
     */
    DVB{
        get {
            if(!this.HasProp("__DVB"))
                this.__DVB := %this.__Class%._DVB(4, this)
            return this.__DVB
        }
    }

    /**
     * @type {_DC}
     */
    DC{
        get {
            if(!this.HasProp("__DC"))
                this.__DC := %this.__Class%._DC(4, this)
            return this.__DC
        }
    }

    /**
     * @type {_ATSC}
     */
    ATSC{
        get {
            if(!this.HasProp("__ATSC"))
                this.__ATSC := %this.__Class%._ATSC(4, this)
            return this.__ATSC
        }
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class HIDP_VALUE_CAPS extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    UsagePage {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ReportID {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {BOOLEAN}
     */
    IsAlias{
        get {
            if(!this.HasProp("__IsAlias"))
                this.__IsAlias := BOOLEAN(this.ptr + 3)
            return this.__IsAlias
        }
    }

    /**
     * @type {Integer}
     */
    BitField {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    LinkCollection {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    LinkUsage {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    LinkUsagePage {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * @type {BOOLEAN}
     */
    IsRange{
        get {
            if(!this.HasProp("__IsRange"))
                this.__IsRange := BOOLEAN(this.ptr + 12)
            return this.__IsRange
        }
    }

    /**
     * @type {BOOLEAN}
     */
    IsStringRange{
        get {
            if(!this.HasProp("__IsStringRange"))
                this.__IsStringRange := BOOLEAN(this.ptr + 13)
            return this.__IsStringRange
        }
    }

    /**
     * @type {BOOLEAN}
     */
    IsDesignatorRange{
        get {
            if(!this.HasProp("__IsDesignatorRange"))
                this.__IsDesignatorRange := BOOLEAN(this.ptr + 14)
            return this.__IsDesignatorRange
        }
    }

    /**
     * @type {BOOLEAN}
     */
    IsAbsolute{
        get {
            if(!this.HasProp("__IsAbsolute"))
                this.__IsAbsolute := BOOLEAN(this.ptr + 15)
            return this.__IsAbsolute
        }
    }

    /**
     * @type {BOOLEAN}
     */
    HasNull{
        get {
            if(!this.HasProp("__HasNull"))
                this.__HasNull := BOOLEAN(this.ptr + 16)
            return this.__HasNull
        }
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 17, "char")
        set => NumPut("char", value, this, 17)
    }

    /**
     * @type {Integer}
     */
    BitSize {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * @type {Integer}
     */
    ReportCount {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * @type {Array<UInt16>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 22, 5, Primitive, "ushort")
            return this.__Reserved2ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    UnitsExp {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Units {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    LogicalMin {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    LogicalMax {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    PhysicalMin {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    PhysicalMax {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    class _Range extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Integer}
         */
        UsageMin {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        UsageMax {
            get => NumGet(this, 2, "ushort")
            set => NumPut("ushort", value, this, 2)
        }
    
        /**
         * @type {Integer}
         */
        StringMin {
            get => NumGet(this, 4, "ushort")
            set => NumPut("ushort", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        StringMax {
            get => NumGet(this, 6, "ushort")
            set => NumPut("ushort", value, this, 6)
        }
    
        /**
         * @type {Integer}
         */
        DesignatorMin {
            get => NumGet(this, 8, "ushort")
            set => NumPut("ushort", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        DesignatorMax {
            get => NumGet(this, 10, "ushort")
            set => NumPut("ushort", value, this, 10)
        }
    
        /**
         * @type {Integer}
         */
        DataIndexMin {
            get => NumGet(this, 12, "ushort")
            set => NumPut("ushort", value, this, 12)
        }
    
        /**
         * @type {Integer}
         */
        DataIndexMax {
            get => NumGet(this, 14, "ushort")
            set => NumPut("ushort", value, this, 14)
        }
    
    }

    class _NotRange extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Usage {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Reserved1 {
            get => NumGet(this, 2, "ushort")
            set => NumPut("ushort", value, this, 2)
        }
    
        /**
         * @type {Integer}
         */
        StringIndex {
            get => NumGet(this, 4, "ushort")
            set => NumPut("ushort", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        Reserved2 {
            get => NumGet(this, 6, "ushort")
            set => NumPut("ushort", value, this, 6)
        }
    
        /**
         * @type {Integer}
         */
        DesignatorIndex {
            get => NumGet(this, 8, "ushort")
            set => NumPut("ushort", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        Reserved3 {
            get => NumGet(this, 10, "ushort")
            set => NumPut("ushort", value, this, 10)
        }
    
        /**
         * @type {Integer}
         */
        DataIndex {
            get => NumGet(this, 12, "ushort")
            set => NumPut("ushort", value, this, 12)
        }
    
        /**
         * @type {Integer}
         */
        Reserved4 {
            get => NumGet(this, 14, "ushort")
            set => NumPut("ushort", value, this, 14)
        }
    
    }

    /**
     * @type {_Range}
     */
    Range{
        get {
            if(!this.HasProp("__Range"))
                this.__Range := %this.__Class%._Range(this.ptr + 56)
            return this.__Range
        }
    }

    /**
     * @type {_NotRange}
     */
    NotRange{
        get {
            if(!this.HasProp("__NotRange"))
                this.__NotRange := %this.__Class%._NotRange(this.ptr + 56)
            return this.__NotRange
        }
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SQL_YEAR_MONTH_STRUCT.ahk
#Include .\SQL_DAY_SECOND_STRUCT.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class SQL_INTERVAL_STRUCT extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    class _intval_e__Union extends Win32Struct {
        static sizeof => 20
        static packingSize => 4

        /**
         * @type {SQL_YEAR_MONTH_STRUCT}
         */
        year_month{
            get {
                if(!this.HasProp("__year_month"))
                    this.__year_month := SQL_YEAR_MONTH_STRUCT(0, this)
                return this.__year_month
            }
        }
    
        /**
         * @type {SQL_DAY_SECOND_STRUCT}
         */
        day_second{
            get {
                if(!this.HasProp("__day_second"))
                    this.__day_second := SQL_DAY_SECOND_STRUCT(0, this)
                return this.__day_second
            }
        }
    
    }

    class _intval_e__Union extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {SQL_YEAR_MONTH_STRUCT}
         */
        year_month{
            get {
                if(!this.HasProp("__year_month"))
                    this.__year_month := SQL_YEAR_MONTH_STRUCT(0, this)
                return this.__year_month
            }
        }
    
        /**
         * @type {SQL_DAY_SECOND_STRUCT}
         */
        day_second{
            get {
                if(!this.HasProp("__day_second"))
                    this.__day_second := SQL_DAY_SECOND_STRUCT(0, this)
                return this.__day_second
            }
        }
    
    }

    /**
     * @type {Integer}
     */
    interval_type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    interval_sign {
        get => NumGet(this, 4, "short")
        set => NumPut("short", value, this, 4)
    }

    /**
     * @type {_intval_e__Union}
     */
    intval{
        get {
            if(!this.HasProp("__intval"))
                this.__intval := %this.__Class%._intval_e__Union(8, this)
            return this.__intval
        }
    }
}

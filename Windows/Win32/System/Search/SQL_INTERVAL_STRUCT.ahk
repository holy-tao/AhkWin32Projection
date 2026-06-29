#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SQLINTERVAL.ahk" { SQLINTERVAL }
#Import ".\SQL_DAY_SECOND_STRUCT.ahk" { SQL_DAY_SECOND_STRUCT }
#Import ".\SQL_YEAR_MONTH_STRUCT.ahk" { SQL_YEAR_MONTH_STRUCT }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct SQL_INTERVAL_STRUCT {
    #StructPack 4


    struct _intval {
        year_month : SQL_YEAR_MONTH_STRUCT

        static __New() {
            DefineProp(this.Prototype, 'day_second', { type: SQL_DAY_SECOND_STRUCT, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    interval_type : SQLINTERVAL

    interval_sign : Int16

    intval : SQL_INTERVAL_STRUCT._intval

}

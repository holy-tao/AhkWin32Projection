#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_Interval.ahk" { MI_Interval }
#Import ".\MI_Timestamp.ahk" { MI_Timestamp }

/**
 * Represents a union of MI_Timestamp and MI_Interval.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_datetime
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_Datetime {
    #StructPack 4


    struct _u {
        timestamp : MI_Timestamp

        static __New() {
            DefineProp(this.Prototype, 'interval', { type: MI_Interval, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * If <b>isTimestamp</b> is nonzero, timestamp is used.  If <b>isTimestamp</b> is 0, interval is used.
     */
    isTimestamp : UInt32

    u : MI_Datetime._u

}

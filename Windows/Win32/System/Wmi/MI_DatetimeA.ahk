#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_Datetime.ahk" { MI_Datetime }

/**
 * Represents an array of MI_Datetime types.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_datetimea
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_DatetimeA {
    #StructPack 8

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_datetime">MI_Datetime</a> types.
     */
    data : MI_Datetime.Ptr

    /**
     * Number of items in the data array.
     */
    size : UInt32

}

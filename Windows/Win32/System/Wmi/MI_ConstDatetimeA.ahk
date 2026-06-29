#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_Datetime.ahk" { MI_Datetime }

/**
 * Represents an array of MI_Datatime types.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_constdatetimea
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_ConstDatetimeA {
    #StructPack 8

    /**
     * An array of <b>MI_Datetime</b> types.
     */
    data : MI_Datetime.Ptr

    /**
     * Number of items in the data array.
     */
    size : UInt32

}

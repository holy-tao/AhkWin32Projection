#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class MCGRIDINFO_PART extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static MCGIP_CALENDARCONTROL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MCGIP_NEXT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MCGIP_PREV => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MCGIP_FOOTER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MCGIP_CALENDAR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MCGIP_CALENDARHEADER => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MCGIP_CALENDARBODY => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MCGIP_CALENDARROW => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MCGIP_CALENDARCELL => 8
}

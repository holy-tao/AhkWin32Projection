#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct MCGRIDINFO_PART {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class EClrEvent extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Event_DomainUnload => 0

    /**
     * @type {Integer (Int32)}
     */
    static Event_ClrDisabled => 1

    /**
     * @type {Integer (Int32)}
     */
    static Event_MDAFired => 2

    /**
     * @type {Integer (Int32)}
     */
    static Event_StackOverflow => 3

    /**
     * @type {Integer (Int32)}
     */
    static MaxClrEvent => 4
}

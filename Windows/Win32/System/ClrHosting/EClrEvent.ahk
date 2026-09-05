#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
class EClrEvent extends Win32Enum {

    /**
     * Native name: Event_DomainUnload
     * @type {Integer (Int32)}
     */
    static DomainUnload => 0

    /**
     * Native name: Event_ClrDisabled
     * @type {Integer (Int32)}
     */
    static ClrDisabled => 1

    /**
     * Native name: Event_MDAFired
     * @type {Integer (Int32)}
     */
    static MDAFired => 2

    /**
     * Native name: Event_StackOverflow
     * @type {Integer (Int32)}
     */
    static StackOverflow => 3

    /**
     * @type {Integer (Int32)}
     */
    static MaxClrEvent => 4
}

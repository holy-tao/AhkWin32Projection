#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies an event opcode. Opcodes represent an operation within a component of an application and are used to logically group events.
 * @remarks
 * Providers use tasks and opcodes to logically group events. Grouping events makes it easy to query for only those events that contain specific task and opcode combinations.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingopcode
 * @namespace Windows.Foundation.Diagnostics
 * @version WindowsRuntime 1.4
 */
class LoggingOpcode extends Win32Enum{

    /**
     * An informational event.
     * @type {Integer (Int32)}
     */
    static Info => 0

    /**
     * An event that represents the start of an activity.
     * @type {Integer (Int32)}
     */
    static Start => 1

    /**
     * An event that represents the end of an activity. The event corresponds to the last unpaired **Start** event.
     * @type {Integer (Int32)}
     */
    static Stop => 2

    /**
     * A reply event.
     * @type {Integer (Int32)}
     */
    static Reply => 6

    /**
     * An event that represents an activity resuming after being suspended.
     * @type {Integer (Int32)}
     */
    static Resume => 7

    /**
     * An event that represents the activity being suspended pending another activity's completion.
     * @type {Integer (Int32)}
     */
    static Suspend => 8

    /**
     * An event that represents transferring activity to another component.
     * @type {Integer (Int32)}
     */
    static Send => 9
}

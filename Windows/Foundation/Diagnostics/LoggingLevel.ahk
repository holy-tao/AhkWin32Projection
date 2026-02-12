#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the severity level of an event.
 * @remarks
 * When writing events, for example from [LoggingChannel](loggingchannel.md), the  is the severity of the event.
 * 
 * When controlling the event logger, for example from [LoggingSession](loggingsession.md), only events that meet the minimum severity specified by  is are logged.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.logginglevel
 * @namespace Windows.Foundation.Diagnostics
 * @version WindowsRuntime 1.4
 */
class LoggingLevel extends Win32Enum{

    /**
     * Log all messages.
     * @type {Integer (Int32)}
     */
    static Verbose => 0

    /**
     * Log messages of information level and higher.
     * @type {Integer (Int32)}
     */
    static Information => 1

    /**
     * Log messages of warning level and higher.
     * @type {Integer (Int32)}
     */
    static Warning => 2

    /**
     * Log messages of error level and higher.
     * @type {Integer (Int32)}
     */
    static Error => 3

    /**
     * Log only critical messages.
     * @type {Integer (Int32)}
     */
    static Critical => 4
}

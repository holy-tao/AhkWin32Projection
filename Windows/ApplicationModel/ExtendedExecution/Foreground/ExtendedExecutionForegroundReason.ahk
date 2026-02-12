#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the reason for the extended execution request.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.extendedexecution.foreground.extendedexecutionforegroundreason
 * @namespace Windows.ApplicationModel.ExtendedExecution.Foreground
 * @version WindowsRuntime 1.4
 */
class ExtendedExecutionForegroundReason extends Win32Enum{

    /**
     * No reason specified.
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * To save data.
     * @type {Integer (Int32)}
     */
    static SavingData => 1

    /**
     * To play audio.
     * @type {Integer (Int32)}
     */
    static BackgroundAudio => 2

    /**
     * To perform any task that requires extended execution time.
     * @type {Integer (Int32)}
     */
    static Unconstrained => 3
}

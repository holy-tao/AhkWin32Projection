#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the possible reasons the voice command completed.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandcompletionreason
 * @namespace Windows.ApplicationModel.VoiceCommands
 * @version WindowsRuntime 1.4
 */
class VoiceCommandCompletionReason extends Win32Enum{

    /**
     * Unknown error.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Communication with **Cortana** failed.
     * @type {Integer (Int32)}
     */
    static CommunicationFailed => 1

    /**
     * The background app service exited because not enough resources were available.
     * @type {Integer (Int32)}
     */
    static ResourceLimitsExceeded => 2

    /**
     * The user cancelled the interaction with **Cortana**.
     * @type {Integer (Int32)}
     */
    static Canceled => 3

    /**
     * The background app service took too long to provide a response to **Cortana**.
     * @type {Integer (Int32)}
     */
    static TimeoutExceeded => 4

    /**
     * The background app service requested that the app launch in the foreground with a call to [RequestAppLaunchAsync](voicecommandserviceconnection_requestapplaunchasync_1419235493.md).
     * @type {Integer (Int32)}
     */
    static AppLaunched => 5

    /**
     * The background app service completed the interaction by calling [ReportSuccessAsync](voicecommandserviceconnection_reportsuccessasync_2126991650.md) or [ReportFailureAsync](voicecommandserviceconnection_reportfailureasync_1581497711.md).
     * @type {Integer (Int32)}
     */
    static Completed => 6
}

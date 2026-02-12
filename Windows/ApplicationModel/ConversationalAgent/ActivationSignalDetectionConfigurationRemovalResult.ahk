#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the possible results when removing an [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) from the digital assistant.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfigurationremovalresult
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class ActivationSignalDetectionConfigurationRemovalResult extends Win32Enum{

    /**
     * The [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) was successfully removed.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * Removal failed because the [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) was not found.
     * @type {Integer (Int32)}
     */
    static NotFound => 1

    /**
     * Removal failed because the [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) is currently enabled.
     * @type {Integer (Int32)}
     */
    static CurrentlyEnabled => 2

    /**
     * Removal failed because removal of the [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) is not supported.
     * @type {Integer (Int32)}
     */
    static RemovalNotSupported => 3
}

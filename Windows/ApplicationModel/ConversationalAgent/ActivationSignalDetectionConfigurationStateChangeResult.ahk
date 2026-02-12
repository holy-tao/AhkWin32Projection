#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the possible results returned when enabling or disabling [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) for the digital assistant.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfigurationstatechangeresult
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class ActivationSignalDetectionConfigurationStateChangeResult extends Win32Enum{

    /**
     * The state change was successful.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The state change from disabled to enabled failed because the configuration has no model data.
     * @type {Integer (Int32)}
     */
    static NoModelData => 1

    /**
     * The state change failed because the [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) was not found.
     * @type {Integer (Int32)}
     */
    static ConfigurationNotFound => 2
}

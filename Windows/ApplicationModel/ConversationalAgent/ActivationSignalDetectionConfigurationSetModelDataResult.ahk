#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the possible results returned when setting the model configuration data of an [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) for the digital assistant.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfigurationsetmodeldataresult
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class ActivationSignalDetectionConfigurationSetModelDataResult extends Win32Enum{

    /**
     * The setting of the model data was successful.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * No model data available.
     * @type {Integer (Int32)}
     */
    static EmptyModelData => 1

    /**
     * The specified model data format is not recognized.
     * @type {Integer (Int32)}
     */
    static UnsupportedFormat => 2

    /**
     * The model data cannot be set because the configuration is currently enabled.
     * @type {Integer (Int32)}
     */
    static ConfigurationCurrentlyEnabled => 3

    /**
     * The model data is invalid.
     * @type {Integer (Int32)}
     */
    static InvalidData => 4

    /**
     * Setting of the model data is not supported by the [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md).
     * @type {Integer (Int32)}
     */
    static SetModelDataNotSupported => 5

    /**
     * The model data was not set because the [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) was not found.
     * @type {Integer (Int32)}
     */
    static ConfigurationNotFound => 6

    /**
     * Unexpected error.
     * @type {Integer (Int32)}
     */
    static UnknownError => 7
}

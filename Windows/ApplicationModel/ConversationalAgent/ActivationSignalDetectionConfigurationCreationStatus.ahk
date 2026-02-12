#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the possible results when creating an [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) for the digital assistant.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfigurationcreationstatus
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class ActivationSignalDetectionConfigurationCreationStatus extends Win32Enum{

    /**
     * The [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) was successfully created.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * Creation failed because a [SignalId](activationsignaldetectionconfiguration_signalid.md) was not available. This can occur when the signal ID is already associated with an [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md).
     * @type {Integer (Int32)}
     */
    static SignalIdNotAvailable => 1

    /**
     * Creation failed because the specified [ModelId](activationsignaldetectionconfiguration_modelid.md) is not supported by the [ActivationSignalDetector](activationsignaldetector.md).
     * @type {Integer (Int32)}
     */
    static ModelIdNotSupported => 2

    /**
     * Creation failed because the specified [SignalId](activationsignaldetectionconfiguration_signalid.md)  is not in the correct format.
     * @type {Integer (Int32)}
     */
    static InvalidSignalId => 3

    /**
     * Creation failed because the specified [ModelId](activationsignaldetectionconfiguration_modelid.md) is not in the correct format.
     * @type {Integer (Int32)}
     */
    static InvalidModelId => 4

    /**
     * Creation failed because the specified [DisplayName](activationsignaldetectionconfiguration_displayname.md) is not in the correct format.
     * @type {Integer (Int32)}
     */
    static InvalidDisplayName => 5

    /**
     * Creation failed because [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) already exists.
     * @type {Integer (Int32)}
     */
    static ConfigurationAlreadyExists => 6

    /**
     * Creation of an [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) is not supported.
     * @type {Integer (Int32)}
     */
    static CreationNotSupported => 7
}

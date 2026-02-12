#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the permission levels granted by a user to each [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) of an [ActivationSignalDetector](activationsignaldetector.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.detectionconfigurationavailabilitychangekind
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class DetectionConfigurationAvailabilityChangeKind extends Win32Enum{

    /**
     * Indicates that a configuration permission to access necessary system resources, such as signal model files, has changed.
     * @type {Integer (Int32)}
     */
    static SystemResourceAccess => 0

    /**
     * Indicates that a configuration permission has changed.
     * @type {Integer (Int32)}
     */
    static Permission => 1

    /**
     * Indicates that a configuration permission used above the lock screen has changed.
     * @type {Integer (Int32)}
     */
    static LockScreenPermission => 2
}

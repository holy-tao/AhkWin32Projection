#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IActivationSignalDetectionConfigurationCreationResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the results when an [ActivationSignalDetector](activationsignaldetector.md) creates an [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfigurationcreationresult
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class ActivationSignalDetectionConfigurationCreationResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IActivationSignalDetectionConfigurationCreationResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IActivationSignalDetectionConfigurationCreationResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of a [CreateConfigurationWithResult(System.String,System.String,System.String)](activationsignaldetector_createconfigurationwithresult_83010423.md) or [CreateConfigurationWithResultAsync(System.String,System.String,System.String)](activationsignaldetector_createconfigurationwithresultasync_1804847772.md) call.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfigurationcreationresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) created by a [CreateConfigurationWithResult(System.String,System.String,System.String)](activationsignaldetector_createconfigurationwithresult_83010423.md) or [CreateConfigurationWithResultAsync(System.String,System.String,System.String)](activationsignaldetector_createconfigurationwithresultasync_1804847772.md) call.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfigurationcreationresult.configuration
     * @type {ActivationSignalDetectionConfiguration} 
     */
    Configuration {
        get => this.get_Configuration()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IActivationSignalDetectionConfigurationCreationResult")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetectionConfigurationCreationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetectionConfigurationCreationResult := IActivationSignalDetectionConfigurationCreationResult(outPtr)
        }

        return this.__IActivationSignalDetectionConfigurationCreationResult.get_Status()
    }

    /**
     * 
     * @returns {ActivationSignalDetectionConfiguration} 
     */
    get_Configuration() {
        if (!this.HasProp("__IActivationSignalDetectionConfigurationCreationResult")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetectionConfigurationCreationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetectionConfigurationCreationResult := IActivationSignalDetectionConfigurationCreationResult(outPtr)
        }

        return this.__IActivationSignalDetectionConfigurationCreationResult.get_Configuration()
    }

;@endregion Instance Methods
}

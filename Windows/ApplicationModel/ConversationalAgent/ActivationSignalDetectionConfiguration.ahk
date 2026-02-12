#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IActivationSignalDetectionConfiguration.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IActivationSignalDetectionConfiguration2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\ActivationSignalDetectionConfiguration.ahk
#Include .\DetectionConfigurationAvailabilityChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides the configuration details for a single signal supported by an activation signal detector. For example, the keyword "Hey Cortana" in US English.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfiguration
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class ActivationSignalDetectionConfiguration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IActivationSignalDetectionConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IActivationSignalDetectionConfiguration.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the locale-independent identifier for this configuration.
     * @remarks
     * Registered configurations are uniquely identified by a signal/model ID pair.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfiguration.signalid
     * @type {HSTRING} 
     */
    SignalId {
        get => this.get_SignalId()
    }

    /**
     * Gets the identifier, typically locale-specific, for the model data associated with this configuration.
     * @remarks
     * Registered configurations are uniquely identified by a signal/model ID pair.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfiguration.modelid
     * @type {HSTRING} 
     */
    ModelId {
        get => this.get_ModelId()
    }

    /**
     * Gets the name of the signal in a localizable, human-readable form.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfiguration.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets whether an ActivationSignalDetectionConfiguration object is processing configuration settings.
     * 
     * Gets whether this configuration meets all criteria for the associated [ActivationSignalDetector](activationsignaldetector.md) to process input corresponding to the signal.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfiguration.isactive
     * @type {Boolean} 
     */
    IsActive {
        get => this.get_IsActive()
    }

    /**
     * Gets the current usage restrictions unique to this configuration.
     * @remarks
     * The [ConversationalAgentSession](conversationalagentsession.md) object describes various system restrictions.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfiguration.availabilityinfo
     * @type {DetectionConfigurationAvailabilityInfo} 
     */
    AvailabilityInfo {
        get => this.get_AvailabilityInfo()
    }

    /**
     * Gets the number of steps completed in the training process of this configuration (if available).
     * @remarks
     * Digital assistant applications can train keyword detectors to more accurately recognize an individual user's voice by algorithmically applying customizations to the detector based on speech data. For example, training a spoken keyword detector to only detect the keyword when spoken by a specific person.
     * 
     * This is achieved through a series of [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) training steps, where each step consumes a logical fragment of speech input data.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfiguration.trainingstepscompleted
     * @type {Integer} 
     */
    TrainingStepsCompleted {
        get => this.get_TrainingStepsCompleted()
    }

    /**
     * Gets the number of steps remaining in the training process of this configuration (if available).
     * @remarks
     * Digital assistant applications can train keyword detectors to more accurately recognize an individual user's voice by algorithmically applying customizations to the detector based on speech data. For example, training a spoken keyword detector to only detect the keyword when spoken by a specific person.
     * 
     * This is achieved through a series of [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) training steps, where each step consumes a logical fragment of speech input data.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfiguration.trainingstepsremaining
     * @type {Integer} 
     */
    TrainingStepsRemaining {
        get => this.get_TrainingStepsRemaining()
    }

    /**
     * Gets the supported data format used for signal detection training with this configuration (if available).
     * @remarks
     * Digital assistant applications can train keyword detectors to more accurately recognize an individual user's voice by algorithmically applying customizations to the detector based on speech data. For example, training a spoken keyword detector to only detect the keyword when spoken by a specific person.
     * 
     * This is achieved through a series of [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) training steps, where each step consumes a logical fragment of speech input data.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfiguration.trainingdataformat
     * @type {Integer} 
     */
    TrainingDataFormat {
        get => this.get_TrainingDataFormat()
    }

    /**
     * Gets the maximum time allowed to complete a training step for this configuration (if available).
     * @remarks
     * Digital assistant applications can train keyword detectors to more accurately recognize an individual user's voice by algorithmically applying customizations to the detector based on speech data. For example, training a spoken keyword detector to only detect the keyword when spoken by a specific person.
     * 
     * This is achieved through a series of [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) training steps, where each step consumes a logical fragment of speech input data.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfiguration.trainingstepcompletionmaxallowedtime
     * @type {Integer} 
     */
    TrainingStepCompletionMaxAllowedTime {
        get => this.get_TrainingStepCompletionMaxAllowedTime()
    }

    /**
     * Occurs when the availability state of the [ActivationSignalDetector](activationsignaldetector.md) changes.
     * @type {TypedEventHandler<ActivationSignalDetectionConfiguration, DetectionConfigurationAvailabilityChangedEventArgs>}
    */
    OnAvailabilityChanged {
        get {
            if(!this.HasProp("__OnAvailabilityChanged")){
                this.__OnAvailabilityChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{491146ea-2bc6-5f03-a317-097aae055198}"),
                    ActivationSignalDetectionConfiguration,
                    DetectionConfigurationAvailabilityChangedEventArgs
                )
                this.__OnAvailabilityChangedToken := this.add_AvailabilityChanged(this.__OnAvailabilityChanged.iface)
            }
            return this.__OnAvailabilityChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnAvailabilityChangedToken")) {
            this.remove_AvailabilityChanged(this.__OnAvailabilityChangedToken)
            this.__OnAvailabilityChanged.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SignalId() {
        if (!this.HasProp("__IActivationSignalDetectionConfiguration")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetectionConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetectionConfiguration := IActivationSignalDetectionConfiguration(outPtr)
        }

        return this.__IActivationSignalDetectionConfiguration.get_SignalId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ModelId() {
        if (!this.HasProp("__IActivationSignalDetectionConfiguration")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetectionConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetectionConfiguration := IActivationSignalDetectionConfiguration(outPtr)
        }

        return this.__IActivationSignalDetectionConfiguration.get_ModelId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IActivationSignalDetectionConfiguration")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetectionConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetectionConfiguration := IActivationSignalDetectionConfiguration(outPtr)
        }

        return this.__IActivationSignalDetectionConfiguration.get_DisplayName()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsActive() {
        if (!this.HasProp("__IActivationSignalDetectionConfiguration")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetectionConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetectionConfiguration := IActivationSignalDetectionConfiguration(outPtr)
        }

        return this.__IActivationSignalDetectionConfiguration.get_IsActive()
    }

    /**
     * Enables or disables the configuration in an application-level manner, independent of system-level settings. The configuration must be both allowed and enabled for its associated [ActivationSignalDetector](activationsignaldetector.md).
     * 
     * > [!Important]
     * > To avoid possible concurrency issues, we recommend using [SetEnabledAsync](activationsignaldetectionconfiguration_setenabledasync_103285310.md) instead.
     * @remarks
     * Configuration might not be active even if configuration is enabled successfully. For configuration to be active, all necessary resources must be available and configuration permissions must be granted by the user in Settings.
     * @param {Boolean} value True, if enabled. Otherwise, false.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfiguration.setenabled
     */
    SetEnabled(value) {
        if (!this.HasProp("__IActivationSignalDetectionConfiguration")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetectionConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetectionConfiguration := IActivationSignalDetectionConfiguration(outPtr)
        }

        return this.__IActivationSignalDetectionConfiguration.SetEnabled(value)
    }

    /**
     * Asynchronously enables or disables the configuration in an application-level manner, independent of system-level settings. The configuration must be both allowed and enabled for its associated [ActivationSignalDetector](activationsignaldetector.md).
     * @remarks
     * Configuration might not be active even if configuration is enabled successfully. For configuration to be active, all necessary resources must be available and configuration permissions must be granted by the user in Settings.
     * @param {Boolean} value True, if enabled. Otherwise, false.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfiguration.setenabledasync
     */
    SetEnabledAsync(value) {
        if (!this.HasProp("__IActivationSignalDetectionConfiguration")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetectionConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetectionConfiguration := IActivationSignalDetectionConfiguration(outPtr)
        }

        return this.__IActivationSignalDetectionConfiguration.SetEnabledAsync(value)
    }

    /**
     * 
     * @returns {DetectionConfigurationAvailabilityInfo} 
     */
    get_AvailabilityInfo() {
        if (!this.HasProp("__IActivationSignalDetectionConfiguration")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetectionConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetectionConfiguration := IActivationSignalDetectionConfiguration(outPtr)
        }

        return this.__IActivationSignalDetectionConfiguration.get_AvailabilityInfo()
    }

    /**
     * 
     * @param {TypedEventHandler<ActivationSignalDetectionConfiguration, DetectionConfigurationAvailabilityChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AvailabilityChanged(handler) {
        if (!this.HasProp("__IActivationSignalDetectionConfiguration")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetectionConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetectionConfiguration := IActivationSignalDetectionConfiguration(outPtr)
        }

        return this.__IActivationSignalDetectionConfiguration.add_AvailabilityChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AvailabilityChanged(token) {
        if (!this.HasProp("__IActivationSignalDetectionConfiguration")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetectionConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetectionConfiguration := IActivationSignalDetectionConfiguration(outPtr)
        }

        return this.__IActivationSignalDetectionConfiguration.remove_AvailabilityChanged(token)
    }

    /**
     * Sets the model configuration data (specific to a signal detector).
     * 
     * > [!Important]
     * > To avoid possible concurrency issues, we recommend using [SetModelDataAsync](activationsignaldetectionconfiguration_setmodeldataasync_290934661.md) instead.
     * @param {HSTRING} dataType The type of configuration data that ensures compatibility with the detector.
     * @param {IInputStream} data The configuration data.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfiguration.setmodeldata
     */
    SetModelData(dataType, data) {
        if (!this.HasProp("__IActivationSignalDetectionConfiguration")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetectionConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetectionConfiguration := IActivationSignalDetectionConfiguration(outPtr)
        }

        return this.__IActivationSignalDetectionConfiguration.SetModelData(dataType, data)
    }

    /**
     * Asynchronously sets the model configuration data (specific to a signal detector).
     * @param {HSTRING} dataType The type of configuration data that ensures compatibility with the detector.
     * @param {IInputStream} data The configuration data.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfiguration.setmodeldataasync
     */
    SetModelDataAsync(dataType, data) {
        if (!this.HasProp("__IActivationSignalDetectionConfiguration")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetectionConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetectionConfiguration := IActivationSignalDetectionConfiguration(outPtr)
        }

        return this.__IActivationSignalDetectionConfiguration.SetModelDataAsync(dataType, data)
    }

    /**
     * Gets the model configuration data type (specific to a signal detector).
     * 
     * > [!Important]
     * > To avoid possible concurrency issues, we recommend using [GetModelDataTypeAsync](activationsignaldetectionconfiguration_getmodeldatatypeasync_1819415867.md) instead.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfiguration.getmodeldatatype
     */
    GetModelDataType() {
        if (!this.HasProp("__IActivationSignalDetectionConfiguration")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetectionConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetectionConfiguration := IActivationSignalDetectionConfiguration(outPtr)
        }

        return this.__IActivationSignalDetectionConfiguration.GetModelDataType()
    }

    /**
     * Asynchronously gets the model configuration data type (specific to a signal detector).
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfiguration.getmodeldatatypeasync
     */
    GetModelDataTypeAsync() {
        if (!this.HasProp("__IActivationSignalDetectionConfiguration")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetectionConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetectionConfiguration := IActivationSignalDetectionConfiguration(outPtr)
        }

        return this.__IActivationSignalDetectionConfiguration.GetModelDataTypeAsync()
    }

    /**
     * Gets the model configuration data (specific to a signal detector).
     * 
     * > [!Important]
     * > To avoid possible concurrency issues, we recommend using [GetModelDataAsync](activationsignaldetectionconfiguration_getmodeldataasync_670700315.md) instead.
     * @returns {IInputStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfiguration.getmodeldata
     */
    GetModelData() {
        if (!this.HasProp("__IActivationSignalDetectionConfiguration")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetectionConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetectionConfiguration := IActivationSignalDetectionConfiguration(outPtr)
        }

        return this.__IActivationSignalDetectionConfiguration.GetModelData()
    }

    /**
     * Asynchronously gets the model configuration data (specific to a signal detector).
     * @returns {IAsyncOperation<IInputStream>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfiguration.getmodeldataasync
     */
    GetModelDataAsync() {
        if (!this.HasProp("__IActivationSignalDetectionConfiguration")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetectionConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetectionConfiguration := IActivationSignalDetectionConfiguration(outPtr)
        }

        return this.__IActivationSignalDetectionConfiguration.GetModelDataAsync()
    }

    /**
     * Deletes all model data for the digital assistant.
     * 
     * > [!Important]
     * > To avoid possible concurrency issues, we recommend using [ClearModelDataAsync](activationsignaldetectionconfiguration_clearmodeldataasync_1781166704.md) instead.
     * @remarks
     * Digital assistant applications can train keyword detectors to more accurately recognize an individual user's voice by algorithmically applying customizations to the detector based on speech data.
     * 
     * This is achieved through a series of [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) training steps, where each step consumes a logical fragment of speech input data.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfiguration.clearmodeldata
     */
    ClearModelData() {
        if (!this.HasProp("__IActivationSignalDetectionConfiguration")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetectionConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetectionConfiguration := IActivationSignalDetectionConfiguration(outPtr)
        }

        return this.__IActivationSignalDetectionConfiguration.ClearModelData()
    }

    /**
     * Asynchronously deletes all model data for the digital assistant.
     * @remarks
     * Digital assistant applications can train keyword detectors to more accurately recognize an individual user's voice by algorithmically applying customizations to the detector based on speech data.
     * 
     * This is achieved through a series of [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) training steps, where each step consumes a logical fragment of speech input data.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfiguration.clearmodeldataasync
     */
    ClearModelDataAsync() {
        if (!this.HasProp("__IActivationSignalDetectionConfiguration")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetectionConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetectionConfiguration := IActivationSignalDetectionConfiguration(outPtr)
        }

        return this.__IActivationSignalDetectionConfiguration.ClearModelDataAsync()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TrainingStepsCompleted() {
        if (!this.HasProp("__IActivationSignalDetectionConfiguration")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetectionConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetectionConfiguration := IActivationSignalDetectionConfiguration(outPtr)
        }

        return this.__IActivationSignalDetectionConfiguration.get_TrainingStepsCompleted()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TrainingStepsRemaining() {
        if (!this.HasProp("__IActivationSignalDetectionConfiguration")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetectionConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetectionConfiguration := IActivationSignalDetectionConfiguration(outPtr)
        }

        return this.__IActivationSignalDetectionConfiguration.get_TrainingStepsRemaining()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TrainingDataFormat() {
        if (!this.HasProp("__IActivationSignalDetectionConfiguration")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetectionConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetectionConfiguration := IActivationSignalDetectionConfiguration(outPtr)
        }

        return this.__IActivationSignalDetectionConfiguration.get_TrainingDataFormat()
    }

    /**
     * Provides input data in the specified format and attempts to complete a training step (if a training process is available for the signal detector of this configuration).
     * 
     * > [!Important]
     * > To avoid possible concurrency issues, we recommend using [ApplyTrainingDataAsync](activationsignaldetectionconfiguration_applytrainingdataasync_907910427.md) instead.
     * @remarks
     * Digital assistant applications can train keyword detectors to more accurately recognize an individual user's voice by algorithmically applying customizations to the detector based on speech data. For example, training a spoken keyword detector to only detect the keyword when spoken by a specific person.
     * 
     * This is achieved through a series of [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) training steps, where each step consumes a logical fragment of speech input data.
     * @param {Integer} trainingDataFormat The voice training data formats supported by the [ActivationSignalDetector](activationsignaldetector.md) for the digital assistant.
     * @param {IInputStream} trainingData The voice training data.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfiguration.applytrainingdata
     */
    ApplyTrainingData(trainingDataFormat, trainingData) {
        if (!this.HasProp("__IActivationSignalDetectionConfiguration")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetectionConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetectionConfiguration := IActivationSignalDetectionConfiguration(outPtr)
        }

        return this.__IActivationSignalDetectionConfiguration.ApplyTrainingData(trainingDataFormat, trainingData)
    }

    /**
     * Asynchronously provides input data in the specified format and attempts to complete a training step (if a training process is available for the signal detector of this configuration).
     * @remarks
     * Digital assistant applications can train keyword detectors to more accurately recognize an individual user's voice by algorithmically applying customizations to the detector based on speech data. For example, training a spoken keyword detector to only detect the keyword when spoken by a specific person.
     * 
     * This is achieved through a series of [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) training steps, where each step consumes a logical fragment of speech input data.
     * @param {Integer} trainingDataFormat The voice training data formats supported by the [ActivationSignalDetector](activationsignaldetector.md) for the digital assistant.
     * @param {IInputStream} trainingData The voice training data.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfiguration.applytrainingdataasync
     */
    ApplyTrainingDataAsync(trainingDataFormat, trainingData) {
        if (!this.HasProp("__IActivationSignalDetectionConfiguration")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetectionConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetectionConfiguration := IActivationSignalDetectionConfiguration(outPtr)
        }

        return this.__IActivationSignalDetectionConfiguration.ApplyTrainingDataAsync(trainingDataFormat, trainingData)
    }

    /**
     * Deletes all voice training data from the [ActivationSignalDetector](activationsignaldetector.md) for the digital assistant.
     * 
     * > [!Important]
     * > To avoid possible concurrency issues, we recommend using [ClearTrainingDataAsync](activationsignaldetectionconfiguration_cleartrainingdataasync_245705916.md) instead.
     * @remarks
     * Digital assistant applications can train keyword detectors to more accurately recognize an individual user's voice by algorithmically applying customizations to the detector based on speech data. For example, training a spoken keyword detector to only detect the keyword when spoken by a specific person.
     * 
     * This is achieved through a series of [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) training steps, where each step consumes a logical fragment of speech input data.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfiguration.cleartrainingdata
     */
    ClearTrainingData() {
        if (!this.HasProp("__IActivationSignalDetectionConfiguration")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetectionConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetectionConfiguration := IActivationSignalDetectionConfiguration(outPtr)
        }

        return this.__IActivationSignalDetectionConfiguration.ClearTrainingData()
    }

    /**
     * Asynchronously deletes all voice training data from the [ActivationSignalDetector](activationsignaldetector.md) for the digital assistant.
     * @remarks
     * Digital assistant applications can train keyword detectors to more accurately recognize an individual user's voice by algorithmically applying customizations to the detector based on speech data. For example, training a spoken keyword detector to only detect the keyword when spoken by a specific person.
     * 
     * This is achieved through a series of [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) training steps, where each step consumes a logical fragment of speech input data.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfiguration.cleartrainingdataasync
     */
    ClearTrainingDataAsync() {
        if (!this.HasProp("__IActivationSignalDetectionConfiguration")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetectionConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetectionConfiguration := IActivationSignalDetectionConfiguration(outPtr)
        }

        return this.__IActivationSignalDetectionConfiguration.ClearTrainingDataAsync()
    }

    /**
     * Closes the [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) object and releases system resources.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfiguration.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

    /**
     * Sets the model configuration data (specific to a signal detector), and returns an indicator of success.
     * @param {HSTRING} dataType The type of configuration data that ensures compatibility with the detector.
     * @param {IInputStream} data The configuration data.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfiguration.setmodeldatawithresult
     */
    SetModelDataWithResult(dataType, data) {
        if (!this.HasProp("__IActivationSignalDetectionConfiguration2")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetectionConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetectionConfiguration2 := IActivationSignalDetectionConfiguration2(outPtr)
        }

        return this.__IActivationSignalDetectionConfiguration2.SetModelDataWithResult(dataType, data)
    }

    /**
     * Asynchronously sets the model configuration data (specific to a signal detector), and returns an indicator of success.
     * @param {HSTRING} dataType The type of configuration data that ensures compatibility with the detector.
     * @param {IInputStream} data The configuration data.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfiguration.setmodeldatawithresultasync
     */
    SetModelDataWithResultAsync(dataType, data) {
        if (!this.HasProp("__IActivationSignalDetectionConfiguration2")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetectionConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetectionConfiguration2 := IActivationSignalDetectionConfiguration2(outPtr)
        }

        return this.__IActivationSignalDetectionConfiguration2.SetModelDataWithResultAsync(dataType, data)
    }

    /**
     * Asynchronously enables or disables the configuration in an application-level manner, independent of system-level settings, and returns an indicator of success. The configuration must be both allowed and enabled for its associated [ActivationSignalDetector](activationsignaldetector.md).
     * 
     * > [!Important]
     * > To avoid possible concurrency issues, we recommend using [SetEnabledAsync](activationsignaldetectionconfiguration_setenabledasync_103285310.md) instead.
     * @remarks
     * Configuration might not be active even if configuration is enabled successfully. For configuration to be active, all necessary resources must be available and configuration permissions must be granted by the user in Settings.
     * @param {Boolean} value True, if enabled. Otherwise, false.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfiguration.setenabledwithresultasync
     */
    SetEnabledWithResultAsync(value) {
        if (!this.HasProp("__IActivationSignalDetectionConfiguration2")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetectionConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetectionConfiguration2 := IActivationSignalDetectionConfiguration2(outPtr)
        }

        return this.__IActivationSignalDetectionConfiguration2.SetEnabledWithResultAsync(value)
    }

    /**
     * Enables or disables the configuration in an application-level manner, independent of system-level settings, and returns an indicator of success. The configuration must be both allowed and enabled for its associated [ActivationSignalDetector](activationsignaldetector.md).
     * 
     * > [!Important]
     * > To avoid possible concurrency issues, we recommend using [SetEnabledAsync](activationsignaldetectionconfiguration_setenabledasync_103285310.md) instead.
     * @remarks
     * Configuration might not be active even if configuration is enabled successfully. For configuration to be active, all necessary resources must be available and configuration permissions must be granted by the user in Settings.
     * @param {Boolean} value True, if enabled. Otherwise, false.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectionconfiguration.setenabledwithresult
     */
    SetEnabledWithResult(value) {
        if (!this.HasProp("__IActivationSignalDetectionConfiguration2")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetectionConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetectionConfiguration2 := IActivationSignalDetectionConfiguration2(outPtr)
        }

        return this.__IActivationSignalDetectionConfiguration2.SetEnabledWithResult(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TrainingStepCompletionMaxAllowedTime() {
        if (!this.HasProp("__IActivationSignalDetectionConfiguration2")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetectionConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetectionConfiguration2 := IActivationSignalDetectionConfiguration2(outPtr)
        }

        return this.__IActivationSignalDetectionConfiguration2.get_TrainingStepCompletionMaxAllowedTime()
    }

;@endregion Instance Methods
}

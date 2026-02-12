#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IActivationSignalDetector.ahk
#Include .\IActivationSignalDetector2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents hardware and software components that can generate activation signals based on input from a user's environment, such as spoken keyword(s), sound detection, or button press.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetector
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class ActivationSignalDetector extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IActivationSignalDetector

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IActivationSignalDetector.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets an identifier unique to the provider of this detector, such as the manufacturer of a hardware-based keyword spotter.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetector.providerid
     * @type {HSTRING} 
     */
    ProviderId {
        get => this.get_ProviderId()
    }

    /**
     * Gets the supported [ActivationSignalDetector](activationsignaldetector.md) types.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetector.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets whether the [ActivationSignalDetector](activationsignaldetector.md) can add or remove items from its collection of [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) objects.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetector.cancreateconfigurations
     * @type {Boolean} 
     */
    CanCreateConfigurations {
        get => this.get_CanCreateConfigurations()
    }

    /**
     * Gets the model configuration data types supported by the signal detector.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetector.supportedmodeldatatypes
     * @type {IVectorView<HSTRING>} 
     */
    SupportedModelDataTypes {
        get => this.get_SupportedModelDataTypes()
    }

    /**
     * Gets the supported formats for training an [ActivationSignalDetector](activationsignaldetector.md).
     * @remarks
     * Digital assistant applications can train keyword detectors to more accurately recognize an individual user's voice by algorithmically applying customizations to the detector based on speech data. For example, training a spoken keyword detector to only detect the keyword when spoken by a specific person.
     * 
     * This is achieved through a series of [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) training steps, where each step consumes a logical fragment of speech input data.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetector.supportedtrainingdataformats
     * @type {IVectorView<Integer>} 
     */
    SupportedTrainingDataFormats {
        get => this.get_SupportedTrainingDataFormats()
    }

    /**
     * Gets the power modes supported by an [ActivationSignalDetector](activationsignaldetector.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetector.supportedpowerstates
     * @type {IVectorView<Integer>} 
     */
    SupportedPowerStates {
        get => this.get_SupportedPowerStates()
    }

    /**
     * Gets the unique identifier of the [ActivationSignalDetector](activationsignaldetector.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetector.detectorid
     * @type {HSTRING} 
     */
    DetectorId {
        get => this.get_DetectorId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProviderId() {
        if (!this.HasProp("__IActivationSignalDetector")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetector := IActivationSignalDetector(outPtr)
        }

        return this.__IActivationSignalDetector.get_ProviderId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IActivationSignalDetector")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetector := IActivationSignalDetector(outPtr)
        }

        return this.__IActivationSignalDetector.get_Kind()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanCreateConfigurations() {
        if (!this.HasProp("__IActivationSignalDetector")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetector := IActivationSignalDetector(outPtr)
        }

        return this.__IActivationSignalDetector.get_CanCreateConfigurations()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_SupportedModelDataTypes() {
        if (!this.HasProp("__IActivationSignalDetector")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetector := IActivationSignalDetector(outPtr)
        }

        return this.__IActivationSignalDetector.get_SupportedModelDataTypes()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedTrainingDataFormats() {
        if (!this.HasProp("__IActivationSignalDetector")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetector := IActivationSignalDetector(outPtr)
        }

        return this.__IActivationSignalDetector.get_SupportedTrainingDataFormats()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedPowerStates() {
        if (!this.HasProp("__IActivationSignalDetector")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetector := IActivationSignalDetector(outPtr)
        }

        return this.__IActivationSignalDetector.get_SupportedPowerStates()
    }

    /**
     * Asynchronously gets the collection of model identifiers supported by this detector for the specified signal identifier. For example, all supported locales for language-specific versions of the "Hey Cortana" keyword.
     * 
     * > [!Important]
     * > To avoid possible concurrency issues, we recommend using [GetSupportedModelIdsForSignalIdAsync](activationsignaldetector_getsupportedmodelidsforsignalidasync_210362887.md) instead.
     * @param {HSTRING} signalId The locale-independent identifier for this configuration.
     * @returns {IVectorView<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetector.getsupportedmodelidsforsignalid
     */
    GetSupportedModelIdsForSignalId(signalId) {
        if (!this.HasProp("__IActivationSignalDetector")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetector := IActivationSignalDetector(outPtr)
        }

        return this.__IActivationSignalDetector.GetSupportedModelIdsForSignalId(signalId)
    }

    /**
     * Asynchronously gets the collection of model identifiers supported by this detector for the specified signal identifier. For example, all supported locales for language-specific versions of the "Hey Cortana" keyword.
     * @param {HSTRING} signalId The locale-independent identifier for this configuration.
     * @returns {IAsyncOperation<IVectorView<HSTRING>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetector.getsupportedmodelidsforsignalidasync
     */
    GetSupportedModelIdsForSignalIdAsync(signalId) {
        if (!this.HasProp("__IActivationSignalDetector")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetector := IActivationSignalDetector(outPtr)
        }

        return this.__IActivationSignalDetector.GetSupportedModelIdsForSignalIdAsync(signalId)
    }

    /**
     * Creates an [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) object associated with the specified [ActivationSignalDetectionConfiguration.SignalId](activationsignaldetectionconfiguration_signalid.md) and [ActivationSignalDetectionConfiguration.ModelId](activationsignaldetectionconfiguration_modelid.md) pair and adds it to the collection of supported configurations for the detector.
     * 
     * > [!Important]
     * > To avoid possible concurrency issues, we recommend using [CreateConfigurationAsync](activationsignaldetector_createconfigurationasync_1444114791.md) instead.
     * @param {HSTRING} signalId The locale-independent identifier for this configuration.
     * @param {HSTRING} modelId The unique identifier, typically locale-specific, for the model data associated with this configuration.
     * @param {HSTRING} displayName The name of the signal in a localizable, human-readable form.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetector.createconfiguration
     */
    CreateConfiguration(signalId, modelId, displayName) {
        if (!this.HasProp("__IActivationSignalDetector")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetector := IActivationSignalDetector(outPtr)
        }

        return this.__IActivationSignalDetector.CreateConfiguration(signalId, modelId, displayName)
    }

    /**
     * Asynchronously creates an [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) object associated with the specified [ActivationSignalDetectionConfiguration.SignalId](activationsignaldetectionconfiguration_signalid.md) and [ActivationSignalDetectionConfiguration.ModelId](activationsignaldetectionconfiguration_modelid.md) pair and adds it to the collection of supported configurations for the detector.
     * @param {HSTRING} signalId The locale-independent identifier for this configuration.
     * @param {HSTRING} modelId The unique identifier, typically locale-specific, for the model data associated with this configuration.
     * @param {HSTRING} displayName The name of the signal in a localizable, human-readable form.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetector.createconfigurationasync
     */
    CreateConfigurationAsync(signalId, modelId, displayName) {
        if (!this.HasProp("__IActivationSignalDetector")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetector := IActivationSignalDetector(outPtr)
        }

        return this.__IActivationSignalDetector.CreateConfigurationAsync(signalId, modelId, displayName)
    }

    /**
     * Gets the collection of [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) objects associated with the [ActivationSignalDetector](activationsignaldetector.md).
     * 
     * > [!Important]
     * > To avoid possible concurrency issues, we recommend using [GetConfigurationsAsync](activationsignaldetector_getconfigurationsasync_2094355586.md) instead.
     * @returns {IVectorView<ActivationSignalDetectionConfiguration>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetector.getconfigurations
     */
    GetConfigurations() {
        if (!this.HasProp("__IActivationSignalDetector")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetector := IActivationSignalDetector(outPtr)
        }

        return this.__IActivationSignalDetector.GetConfigurations()
    }

    /**
     * Asynchronously gets the collection of [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) objects associated with the [ActivationSignalDetector](activationsignaldetector.md).
     * @returns {IAsyncOperation<IVectorView<ActivationSignalDetectionConfiguration>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetector.getconfigurationsasync
     */
    GetConfigurationsAsync() {
        if (!this.HasProp("__IActivationSignalDetector")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetector := IActivationSignalDetector(outPtr)
        }

        return this.__IActivationSignalDetector.GetConfigurationsAsync()
    }

    /**
     * Gets the [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) object associated with the specified [ActivationSignalDetectionConfiguration.SignalId](activationsignaldetectionconfiguration_signalid.md) and [ActivationSignalDetectionConfiguration.ModelId](activationsignaldetectionconfiguration_modelid.md) pair.
     * 
     * > [!Important]
     * > To avoid possible concurrency issues, we recommend using [GetConfigurationAsync](activationsignaldetector_getconfigurationasync_1120837113.md) instead.
     * @param {HSTRING} signalId The unique identifier for the [ConversationalAgentSignal](conversationalagentsignal.md).
     * @param {HSTRING} modelId The unique model identifier of the [Signal](conversationalagentsignal.md) that activated the conversational agent.
     * @returns {ActivationSignalDetectionConfiguration} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetector.getconfiguration
     */
    GetConfiguration(signalId, modelId) {
        if (!this.HasProp("__IActivationSignalDetector")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetector := IActivationSignalDetector(outPtr)
        }

        return this.__IActivationSignalDetector.GetConfiguration(signalId, modelId)
    }

    /**
     * Asynchronously gets the [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) object associated with the specified [ActivationSignalDetectionConfiguration.SignalId](activationsignaldetectionconfiguration_signalid.md) and [ActivationSignalDetectionConfiguration.ModelId](activationsignaldetectionconfiguration_modelid.md) pair.
     * @param {HSTRING} signalId The unique identifier for the [ConversationalAgentSignal](conversationalagentsignal.md).
     * @param {HSTRING} modelId The unique model identifier of the [Signal](conversationalagentsignal.md) that activated the conversational agent.
     * @returns {IAsyncOperation<ActivationSignalDetectionConfiguration>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetector.getconfigurationasync
     */
    GetConfigurationAsync(signalId, modelId) {
        if (!this.HasProp("__IActivationSignalDetector")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetector := IActivationSignalDetector(outPtr)
        }

        return this.__IActivationSignalDetector.GetConfigurationAsync(signalId, modelId)
    }

    /**
     * Removes the ActivationSignalDetectionConfiguration identified by the [ActivationSignalDetectionConfiguration.SignalId](activationsignaldetectionconfiguration_signalid.md) and [ActivationSignalDetectionConfiguration.ModelId](activationsignaldetectionconfiguration_modelid.md) pair.
     * 
     * > [!Important]
     * > To avoid possible concurrency issues, we recommend using [RemoveConfigurationAsync](activationsignaldetector_removeconfigurationasync_1419607809.md) instead.
     * @param {HSTRING} signalId The unique identifier for the [ConversationalAgentSignal](conversationalagentsignal.md).
     * @param {HSTRING} modelId The unique model identifier of the [Signal](conversationalagentsignal.md) that activated the conversational agent.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetector.removeconfiguration
     */
    RemoveConfiguration(signalId, modelId) {
        if (!this.HasProp("__IActivationSignalDetector")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetector := IActivationSignalDetector(outPtr)
        }

        return this.__IActivationSignalDetector.RemoveConfiguration(signalId, modelId)
    }

    /**
     * Asynchronously removes the ActivationSignalDetectionConfiguration identified by the [ActivationSignalDetectionConfiguration.SignalId](activationsignaldetectionconfiguration_signalid.md) and [ActivationSignalDetectionConfiguration.ModelId](activationsignaldetectionconfiguration_modelid.md) pair.
     * @param {HSTRING} signalId The unique identifier for the [ConversationalAgentSignal](conversationalagentsignal.md).
     * @param {HSTRING} modelId The unique model identifier of the [Signal](conversationalagentsignal.md) that activated the conversational agent.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetector.removeconfigurationasync
     */
    RemoveConfigurationAsync(signalId, modelId) {
        if (!this.HasProp("__IActivationSignalDetector")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetector := IActivationSignalDetector(outPtr)
        }

        return this.__IActivationSignalDetector.RemoveConfigurationAsync(signalId, modelId)
    }

    /**
     * Asynchronously gets the collection of model identifiers available to this detector for the specified signal identifier. For example, all supported locales for language-specific versions of the "Hey Cortana" keyword.
     * @param {HSTRING} signalId The locale-independent identifier for this configuration.
     * @returns {IAsyncOperation<IVector<HSTRING>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetector.getavailablemodelidsforsignalidasync
     */
    GetAvailableModelIdsForSignalIdAsync(signalId) {
        if (!this.HasProp("__IActivationSignalDetector2")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetector2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetector2 := IActivationSignalDetector2(outPtr)
        }

        return this.__IActivationSignalDetector2.GetAvailableModelIdsForSignalIdAsync(signalId)
    }

    /**
     * Gets the collection of model identifiers available to this detector for the specified signal identifier. For example, all supported locales for language-specific versions of the "Hey Cortana" keyword.
     * @param {HSTRING} signalId The locale-independent identifier for this configuration.
     * @returns {IVector<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetector.getavailablemodelidsforsignalid
     */
    GetAvailableModelIdsForSignalId(signalId) {
        if (!this.HasProp("__IActivationSignalDetector2")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetector2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetector2 := IActivationSignalDetector2(outPtr)
        }

        return this.__IActivationSignalDetector2.GetAvailableModelIdsForSignalId(signalId)
    }

    /**
     * Aynchronously creates an [ActivationSignalDetectionConfigurationCreationResult](activationsignaldetectionconfigurationcreationresult.md) object associated with the specified [ActivationSignalDetectionConfiguration.SignalId](activationsignaldetectionconfiguration_signalid.md) and [ActivationSignalDetectionConfiguration.ModelId](activationsignaldetectionconfiguration_modelid.md) pair, adds it to the collection of supported configurations for the detector, along with an indicator of success.
     * @param {HSTRING} signalId The locale-independent identifier for this configuration.
     * @param {HSTRING} modelId The unique identifier, typically locale-specific, for the model data associated with this configuration.
     * @param {HSTRING} displayName The name of the signal in a localizable, human-readable form.
     * @returns {IAsyncOperation<ActivationSignalDetectionConfigurationCreationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetector.createconfigurationwithresultasync
     */
    CreateConfigurationWithResultAsync(signalId, modelId, displayName) {
        if (!this.HasProp("__IActivationSignalDetector2")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetector2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetector2 := IActivationSignalDetector2(outPtr)
        }

        return this.__IActivationSignalDetector2.CreateConfigurationWithResultAsync(signalId, modelId, displayName)
    }

    /**
     * Creates an [ActivationSignalDetectionConfigurationCreationResult](activationsignaldetectionconfigurationcreationresult.md) object associated with the specified [ActivationSignalDetectionConfiguration.SignalId](activationsignaldetectionconfiguration_signalid.md) and [ActivationSignalDetectionConfiguration.ModelId](activationsignaldetectionconfiguration_modelid.md) pair, adds it to the collection of supported configurations for the detector, along with an indicator of success.
     * 
     * > [!Important]
     * > To avoid possible concurrency issues, we recommend using [CreateConfigurationWithResultAsync(System.String,System.String,System.String)](activationsignaldetector_createconfigurationwithresultasync_1804847772.md) instead.
     * @param {HSTRING} signalId The locale-independent identifier for this configuration.
     * @param {HSTRING} modelId The unique identifier, typically locale-specific, for the model data associated with this configuration.
     * @param {HSTRING} displayName The name of the signal in a localizable, human-readable form.
     * @returns {ActivationSignalDetectionConfigurationCreationResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetector.createconfigurationwithresult
     */
    CreateConfigurationWithResult(signalId, modelId, displayName) {
        if (!this.HasProp("__IActivationSignalDetector2")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetector2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetector2 := IActivationSignalDetector2(outPtr)
        }

        return this.__IActivationSignalDetector2.CreateConfigurationWithResult(signalId, modelId, displayName)
    }

    /**
     * Asynchronously removes the ActivationSignalDetectionConfiguration identified by the [ActivationSignalDetectionConfiguration.SignalId](activationsignaldetectionconfiguration_signalid.md) and [ActivationSignalDetectionConfiguration.ModelId](activationsignaldetectionconfiguration_modelid.md) pair, and returns an indicator of success.
     * @param {HSTRING} signalId The unique identifier for the [ConversationalAgentSignal](conversationalagentsignal.md).
     * @param {HSTRING} modelId The unique model identifier of the [Signal](conversationalagentsignal.md) that activated the conversational agent.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetector.removeconfigurationwithresultasync
     */
    RemoveConfigurationWithResultAsync(signalId, modelId) {
        if (!this.HasProp("__IActivationSignalDetector2")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetector2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetector2 := IActivationSignalDetector2(outPtr)
        }

        return this.__IActivationSignalDetector2.RemoveConfigurationWithResultAsync(signalId, modelId)
    }

    /**
     * Removes the ActivationSignalDetectionConfiguration identified by the [ActivationSignalDetectionConfiguration.SignalId](activationsignaldetectionconfiguration_signalid.md) and [ActivationSignalDetectionConfiguration.ModelId](activationsignaldetectionconfiguration_modelid.md) pair, and returns an indicator of success.
     * 
     * > [!Important]
     * > To avoid possible concurrency issues, we recommend using [RemoveConfigurationWithResultAsync(System.String,System.String)](activationsignaldetector_removeconfigurationwithresultasync_75558291.md) instead.
     * @param {HSTRING} signalId The unique identifier for the [ConversationalAgentSignal](conversationalagentsignal.md).
     * @param {HSTRING} modelId The unique model identifier of the [Signal](conversationalagentsignal.md) that activated the conversational agent.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetector.removeconfigurationwithresult
     */
    RemoveConfigurationWithResult(signalId, modelId) {
        if (!this.HasProp("__IActivationSignalDetector2")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetector2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetector2 := IActivationSignalDetector2(outPtr)
        }

        return this.__IActivationSignalDetector2.RemoveConfigurationWithResult(signalId, modelId)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DetectorId() {
        if (!this.HasProp("__IActivationSignalDetector2")) {
            if ((queryResult := this.QueryInterface(IActivationSignalDetector2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivationSignalDetector2 := IActivationSignalDetector2(outPtr)
        }

        return this.__IActivationSignalDetector2.get_DetectorId()
    }

;@endregion Instance Methods
}

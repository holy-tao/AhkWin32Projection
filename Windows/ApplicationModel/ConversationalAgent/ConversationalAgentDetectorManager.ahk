#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IConversationalAgentDetectorManager.ahk
#Include .\IConversationalAgentDetectorManager2.ahk
#Include .\IConversationalAgentDetectorManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to existing signal detector and configuration definitions of a digital assistant.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentdetectormanager
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class ConversationalAgentDetectorManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IConversationalAgentDetectorManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IConversationalAgentDetectorManager.IID

    /**
     * Gets the global manager associated with all [ActivationSignalDetector](activationsignaldetector.md) objects available on the system.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentdetectormanager.default
     * @type {ConversationalAgentDetectorManager} 
     */
    static Default {
        get => ConversationalAgentDetectorManager.get_Default()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {ConversationalAgentDetectorManager} 
     */
    static get_Default() {
        if (!ConversationalAgentDetectorManager.HasProp("__IConversationalAgentDetectorManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.ConversationalAgent.ConversationalAgentDetectorManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IConversationalAgentDetectorManagerStatics.IID)
            ConversationalAgentDetectorManager.__IConversationalAgentDetectorManagerStatics := IConversationalAgentDetectorManagerStatics(factoryPtr)
        }

        return ConversationalAgentDetectorManager.__IConversationalAgentDetectorManagerStatics.get_Default()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Retrieves all [ActivationSignalDetector](activationsignaldetector.md) objects available on the system that are associated with this manager and that correspond to the type of detector specified.
     * 
     * > [!Important]
     * > To avoid possible concurrency issues, we recommend using [GetAllActivationSignalDetectorsAsync](conversationalagentdetectormanager_getallactivationsignaldetectorsasync_336274667.md) instead.
     * @returns {IVectorView<ActivationSignalDetector>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentdetectormanager.getallactivationsignaldetectors
     */
    GetAllActivationSignalDetectors() {
        if (!this.HasProp("__IConversationalAgentDetectorManager")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentDetectorManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentDetectorManager := IConversationalAgentDetectorManager(outPtr)
        }

        return this.__IConversationalAgentDetectorManager.GetAllActivationSignalDetectors()
    }

    /**
     * Asynchronously retrieves all [ActivationSignalDetector](activationsignaldetector.md) objects available on the system that are associated with this manager and that correspond to the type of detector specified.
     * @returns {IAsyncOperation<IVectorView<ActivationSignalDetector>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentdetectormanager.getallactivationsignaldetectorsasync
     */
    GetAllActivationSignalDetectorsAsync() {
        if (!this.HasProp("__IConversationalAgentDetectorManager")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentDetectorManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentDetectorManager := IConversationalAgentDetectorManager(outPtr)
        }

        return this.__IConversationalAgentDetectorManager.GetAllActivationSignalDetectorsAsync()
    }

    /**
     * Retrieves all [ActivationSignalDetector](activationsignaldetector.md) objects available on the system that are associated with this manager.
     * 
     * > [!Important]
     * > To avoid possible concurrency issues, we recommend using [GetActivationSignalDetectorsAsync](conversationalagentdetectormanager_getactivationsignaldetectorsasync_591441886.md) instead.
     * @param {Integer} kind A supported [ActivationSignalDetector](activationsignaldetector.md) type.
     * @returns {IVectorView<ActivationSignalDetector>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentdetectormanager.getactivationsignaldetectors
     */
    GetActivationSignalDetectors(kind) {
        if (!this.HasProp("__IConversationalAgentDetectorManager")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentDetectorManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentDetectorManager := IConversationalAgentDetectorManager(outPtr)
        }

        return this.__IConversationalAgentDetectorManager.GetActivationSignalDetectors(kind)
    }

    /**
     * Asynchronously retrieves all [ActivationSignalDetector](activationsignaldetector.md) objects available on the system that are associated with this manager.
     * @param {Integer} kind A supported [ActivationSignalDetector](activationsignaldetector.md) type.
     * @returns {IAsyncOperation<IVectorView<ActivationSignalDetector>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentdetectormanager.getactivationsignaldetectorsasync
     */
    GetActivationSignalDetectorsAsync(kind) {
        if (!this.HasProp("__IConversationalAgentDetectorManager")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentDetectorManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentDetectorManager := IConversationalAgentDetectorManager(outPtr)
        }

        return this.__IConversationalAgentDetectorManager.GetActivationSignalDetectorsAsync(kind)
    }

    /**
     * Retrieves the [ActivationSignalDetector](activationsignaldetector.md) object available on the system that is associated with this manager and that has the [ActivationSignalDetector.DetectorId](activationsignaldetector_detectorid.md) specified.
     * 
     * > [!Important]
     * > To avoid possible concurrency issues, we recommend using [GetActivationSignalDetectorFromIdAsync(System.String)](conversationalagentdetectormanager_getactivationsignaldetectorfromidasync_78182550.md) instead.
     * @param {HSTRING} detectorId The unique identifier of the [ActivationSignalDetector](activationsignaldetector.md).
     * @returns {ActivationSignalDetector} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentdetectormanager.getactivationsignaldetectorfromid
     */
    GetActivationSignalDetectorFromId(detectorId) {
        if (!this.HasProp("__IConversationalAgentDetectorManager2")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentDetectorManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentDetectorManager2 := IConversationalAgentDetectorManager2(outPtr)
        }

        return this.__IConversationalAgentDetectorManager2.GetActivationSignalDetectorFromId(detectorId)
    }

    /**
     * Asynchronously retrieves the [ActivationSignalDetector](activationsignaldetector.md) object available on the system that is associated with this manager and that has the [ActivationSignalDetector.DetectorId](activationsignaldetector_detectorid.md) specified.
     * @param {HSTRING} detectorId The unique identifier of the [ActivationSignalDetector](activationsignaldetector.md).
     * @returns {IAsyncOperation<ActivationSignalDetector>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentdetectormanager.getactivationsignaldetectorfromidasync
     */
    GetActivationSignalDetectorFromIdAsync(detectorId) {
        if (!this.HasProp("__IConversationalAgentDetectorManager2")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentDetectorManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentDetectorManager2 := IConversationalAgentDetectorManager2(outPtr)
        }

        return this.__IConversationalAgentDetectorManager2.GetActivationSignalDetectorFromIdAsync(detectorId)
    }

;@endregion Instance Methods
}

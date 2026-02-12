#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILearningModelSession.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\ILearningModelSessionFactory.ahk
#Include .\ILearningModelSessionFactory2.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!IMPORTANT]
  * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
  * 
  * Used to evaluate machine learning models.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelsession
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class LearningModelSession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILearningModelSession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILearningModelSession.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Creates a session using the default device.
     * @param {LearningModel} model The trained machine learning model for this session.
     * @returns {LearningModelSession} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelsession.#ctor
     */
    static CreateFromModel(model) {
        if (!LearningModelSession.HasProp("__ILearningModelSessionFactory")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.LearningModelSession")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILearningModelSessionFactory.IID)
            LearningModelSession.__ILearningModelSessionFactory := ILearningModelSessionFactory(factoryPtr)
        }

        return LearningModelSession.__ILearningModelSessionFactory.CreateFromModel(model)
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Creates a session using the specified device.
     * @param {LearningModel} model The trained machine learning model for this session.
     * @param {LearningModelDevice} deviceToRunOn The session's evaluation device.
     * @returns {LearningModelSession} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelsession.#ctor
     */
    static CreateFromModelOnDevice(model, deviceToRunOn) {
        if (!LearningModelSession.HasProp("__ILearningModelSessionFactory")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.LearningModelSession")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILearningModelSessionFactory.IID)
            LearningModelSession.__ILearningModelSessionFactory := ILearningModelSessionFactory(factoryPtr)
        }

        return LearningModelSession.__ILearningModelSessionFactory.CreateFromModelOnDevice(model, deviceToRunOn)
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Creates a session using the specified device and additional inference options.
     * @param {LearningModel} model The trained machine learning model for this session.
     * @param {LearningModelDevice} deviceToRunOn The session's evaluation device.
     * @param {LearningModelSessionOptions} learningModelSessionOptions_ The options used to configure session creation and evaluation.
     * @returns {LearningModelSession} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelsession.#ctor
     */
    static CreateFromModelOnDeviceWithSessionOptions(model, deviceToRunOn, learningModelSessionOptions_) {
        if (!LearningModelSession.HasProp("__ILearningModelSessionFactory2")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.LearningModelSession")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILearningModelSessionFactory2.IID)
            LearningModelSession.__ILearningModelSessionFactory2 := ILearningModelSessionFactory2(factoryPtr)
        }

        return LearningModelSession.__ILearningModelSessionFactory2.CreateFromModelOnDeviceWithSessionOptions(model, deviceToRunOn, learningModelSessionOptions_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Returns the trained machine learning model for this session.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelsession.model
     * @type {LearningModel} 
     */
    Model {
        get => this.get_Model()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Returns the session's evaluation device.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelsession.device
     * @type {LearningModelDevice} 
     */
    Device {
        get => this.get_Device()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Set of properties that control model evaluation.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelsession.evaluationproperties
     * @type {IPropertySet} 
     */
    EvaluationProperties {
        get => this.get_EvaluationProperties()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {LearningModel} 
     */
    get_Model() {
        if (!this.HasProp("__ILearningModelSession")) {
            if ((queryResult := this.QueryInterface(ILearningModelSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelSession := ILearningModelSession(outPtr)
        }

        return this.__ILearningModelSession.get_Model()
    }

    /**
     * 
     * @returns {LearningModelDevice} 
     */
    get_Device() {
        if (!this.HasProp("__ILearningModelSession")) {
            if ((queryResult := this.QueryInterface(ILearningModelSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelSession := ILearningModelSession(outPtr)
        }

        return this.__ILearningModelSession.get_Device()
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_EvaluationProperties() {
        if (!this.HasProp("__ILearningModelSession")) {
            if ((queryResult := this.QueryInterface(ILearningModelSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelSession := ILearningModelSession(outPtr)
        }

        return this.__ILearningModelSession.get_EvaluationProperties()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Asynchronously evaluate the machine learning model using the feature values already bound in *bindings*.
     * @param {LearningModelBinding} bindings The values bound to the named input and output features.
     * @param {HSTRING} correlationId_ Optional user-supplied string to connect the output results.
     * @returns {IAsyncOperation<LearningModelEvaluationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelsession.evaluateasync
     */
    EvaluateAsync(bindings, correlationId_) {
        if (!this.HasProp("__ILearningModelSession")) {
            if ((queryResult := this.QueryInterface(ILearningModelSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelSession := ILearningModelSession(outPtr)
        }

        return this.__ILearningModelSession.EvaluateAsync(bindings, correlationId_)
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Asynchronously evaluate the machine learning model using the feature values in *features*.
     * @remarks
     * This method is an alternative to the separated bind then evaluate form that takes a [LearningModelBinding](learningmodelbinding.md). It will take the passed in features, create a **LearningModelBinding** for you, bind the features, and then evaluate the model.
     * @param {IMap<HSTRING, IInspectable>} features A map of features with which to evaluate the model.
     * @param {HSTRING} correlationId_ Optional user supplied string to connect the output results.
     * @returns {IAsyncOperation<LearningModelEvaluationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelsession.evaluatefeaturesasync
     */
    EvaluateFeaturesAsync(features, correlationId_) {
        if (!this.HasProp("__ILearningModelSession")) {
            if ((queryResult := this.QueryInterface(ILearningModelSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelSession := ILearningModelSession(outPtr)
        }

        return this.__ILearningModelSession.EvaluateFeaturesAsync(features, correlationId_)
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Evaluate the machine learning model using the feature values bound in *bindings*.
     * @param {LearningModelBinding} bindings Holder for associations between model inputs and variable instances.
     * @param {HSTRING} correlationId_ Optional user-supplied string to connect the output results.
     * @returns {LearningModelEvaluationResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelsession.evaluate
     */
    Evaluate(bindings, correlationId_) {
        if (!this.HasProp("__ILearningModelSession")) {
            if ((queryResult := this.QueryInterface(ILearningModelSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelSession := ILearningModelSession(outPtr)
        }

        return this.__ILearningModelSession.Evaluate(bindings, correlationId_)
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Evaluate the machine learning model using the feature values in *features*.
     * @param {IMap<HSTRING, IInspectable>} features A map of features with which to evaluate the model.
     * @param {HSTRING} correlationId_ Optional user supplied string to connect the output results.
     * @returns {LearningModelEvaluationResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelsession.evaluatefeatures
     */
    EvaluateFeatures(features, correlationId_) {
        if (!this.HasProp("__ILearningModelSession")) {
            if ((queryResult := this.QueryInterface(ILearningModelSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelSession := ILearningModelSession(outPtr)
        }

        return this.__ILearningModelSession.EvaluateFeatures(features, correlationId_)
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Closes the current LearningModelSession.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelsession.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}

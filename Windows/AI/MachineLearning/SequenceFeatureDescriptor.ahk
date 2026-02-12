#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISequenceFeatureDescriptor.ahk
#Include .\ILearningModelFeatureDescriptor.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!IMPORTANT]
  * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
  * 
  * A sequence is an array of elements.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.sequencefeaturedescriptor
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class SequenceFeatureDescriptor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISequenceFeatureDescriptor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISequenceFeatureDescriptor.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Sequence elements can be feature kinds.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.sequencefeaturedescriptor.elementdescriptor
     * @type {ILearningModelFeatureDescriptor} 
     */
    ElementDescriptor {
        get => this.get_ElementDescriptor()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * The name you use to bind values to this feature.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.sequencefeaturedescriptor.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * A description of what this feature is used for in the model.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.sequencefeaturedescriptor.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * The kind of feature; use this to know which derived class to use.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.sequencefeaturedescriptor.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * If true, you must bind a value to this feature before calling [LearningModelSession.Evaluate](learningmodelsession_evaluate_291797498.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.sequencefeaturedescriptor.isrequired
     * @type {Boolean} 
     */
    IsRequired {
        get => this.get_IsRequired()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {ILearningModelFeatureDescriptor} 
     */
    get_ElementDescriptor() {
        if (!this.HasProp("__ISequenceFeatureDescriptor")) {
            if ((queryResult := this.QueryInterface(ISequenceFeatureDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISequenceFeatureDescriptor := ISequenceFeatureDescriptor(outPtr)
        }

        return this.__ISequenceFeatureDescriptor.get_ElementDescriptor()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__ILearningModelFeatureDescriptor")) {
            if ((queryResult := this.QueryInterface(ILearningModelFeatureDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelFeatureDescriptor := ILearningModelFeatureDescriptor(outPtr)
        }

        return this.__ILearningModelFeatureDescriptor.get_Name()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__ILearningModelFeatureDescriptor")) {
            if ((queryResult := this.QueryInterface(ILearningModelFeatureDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelFeatureDescriptor := ILearningModelFeatureDescriptor(outPtr)
        }

        return this.__ILearningModelFeatureDescriptor.get_Description()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__ILearningModelFeatureDescriptor")) {
            if ((queryResult := this.QueryInterface(ILearningModelFeatureDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelFeatureDescriptor := ILearningModelFeatureDescriptor(outPtr)
        }

        return this.__ILearningModelFeatureDescriptor.get_Kind()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRequired() {
        if (!this.HasProp("__ILearningModelFeatureDescriptor")) {
            if ((queryResult := this.QueryInterface(ILearningModelFeatureDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelFeatureDescriptor := ILearningModelFeatureDescriptor(outPtr)
        }

        return this.__ILearningModelFeatureDescriptor.get_IsRequired()
    }

;@endregion Instance Methods
}

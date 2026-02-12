#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILearningModel.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\ILearningModelStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!IMPORTANT]
  * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
  * 
  * Represents a trained machine learning model.
 * @remarks
 * This is the main object you use to interact with Windows ML. You use it to load, bind, and evaluate trained ONNX models:
 * 
 * 1. Load the model using one of the **Load**\* constructors.  
 * 2. Enumerate the [InputFeatures](learningmodel_inputfeatures.md) and [OutputFeatures](learningmodel_outputfeatures.md) and bind to your model.
 * 3. Create a [LearningModelSession](learningmodelsession.md) and evalaute.
 * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodel
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class LearningModel extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILearningModel

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILearningModel.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Loads an ONNX model from an [IStorageFile](../windows.storage/istoragefile.md) asynchronously.
     * @param {IStorageFile} modelFile The location of the model file.
     * @returns {IAsyncOperation<LearningModel>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodel.loadfromstoragefileasync
     */
    static LoadFromStorageFileAsync(modelFile) {
        if (!LearningModel.HasProp("__ILearningModelStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.LearningModel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILearningModelStatics.IID)
            LearningModel.__ILearningModelStatics := ILearningModelStatics(factoryPtr)
        }

        return LearningModel.__ILearningModelStatics.LoadFromStorageFileAsync(modelFile)
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Loads an ONNX model from a stream asynchronously.
     * @param {IRandomAccessStreamReference} modelStream The stream from which to load the model.
     * @returns {IAsyncOperation<LearningModel>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodel.loadfromstreamasync
     */
    static LoadFromStreamAsync(modelStream) {
        if (!LearningModel.HasProp("__ILearningModelStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.LearningModel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILearningModelStatics.IID)
            LearningModel.__ILearningModelStatics := ILearningModelStatics(factoryPtr)
        }

        return LearningModel.__ILearningModelStatics.LoadFromStreamAsync(modelStream)
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Loads an ONNX model from a file on disk.
     * @remarks
     * This method is meant for desktop (non-UWP) applications. For UWP, see [LoadFromStorageFileAsync](learningmodel_loadfromstoragefileasync_532232733.md).
     * @param {HSTRING} filePath The path to the ONNX model file on disk.
     * @returns {LearningModel} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodel.loadfromfilepath
     */
    static LoadFromFilePath(filePath) {
        if (!LearningModel.HasProp("__ILearningModelStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.LearningModel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILearningModelStatics.IID)
            LearningModel.__ILearningModelStatics := ILearningModelStatics(factoryPtr)
        }

        return LearningModel.__ILearningModelStatics.LoadFromFilePath(filePath)
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Loads an ONNX model from a stream.
     * @param {IRandomAccessStreamReference} modelStream The stream from which to load the model.
     * @returns {LearningModel} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodel.loadfromstream
     */
    static LoadFromStream(modelStream) {
        if (!LearningModel.HasProp("__ILearningModelStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.LearningModel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILearningModelStatics.IID)
            LearningModel.__ILearningModelStatics := ILearningModelStatics(factoryPtr)
        }

        return LearningModel.__ILearningModelStatics.LoadFromStream(modelStream)
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Loads an ONNX model from an [IStorageFile](../windows.storage/istoragefile.md) asynchronously.
     * @param {IStorageFile} modelFile The location of the model file.
     * @param {ILearningModelOperatorProvider} operatorProvider 
     * @returns {IAsyncOperation<LearningModel>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodel.loadfromstoragefileasync
     */
    static LoadFromStorageFileWithOperatorProviderAsync(modelFile, operatorProvider) {
        if (!LearningModel.HasProp("__ILearningModelStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.LearningModel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILearningModelStatics.IID)
            LearningModel.__ILearningModelStatics := ILearningModelStatics(factoryPtr)
        }

        return LearningModel.__ILearningModelStatics.LoadFromStorageFileWithOperatorProviderAsync(modelFile, operatorProvider)
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Loads an ONNX model from a stream asynchronously.
     * @param {IRandomAccessStreamReference} modelStream The stream from which to load the model.
     * @param {ILearningModelOperatorProvider} operatorProvider 
     * @returns {IAsyncOperation<LearningModel>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodel.loadfromstreamasync
     */
    static LoadFromStreamWithOperatorProviderAsync(modelStream, operatorProvider) {
        if (!LearningModel.HasProp("__ILearningModelStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.LearningModel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILearningModelStatics.IID)
            LearningModel.__ILearningModelStatics := ILearningModelStatics(factoryPtr)
        }

        return LearningModel.__ILearningModelStatics.LoadFromStreamWithOperatorProviderAsync(modelStream, operatorProvider)
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Loads an ONNX model from a file on disk.
     * @remarks
     * This method is meant for desktop (non-UWP) applications. For UWP, see [LoadFromStorageFileAsync](learningmodel_loadfromstoragefileasync_532232733.md).
     * @param {HSTRING} filePath The path to the ONNX model file on disk.
     * @param {ILearningModelOperatorProvider} operatorProvider 
     * @returns {LearningModel} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodel.loadfromfilepath
     */
    static LoadFromFilePathWithOperatorProvider(filePath, operatorProvider) {
        if (!LearningModel.HasProp("__ILearningModelStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.LearningModel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILearningModelStatics.IID)
            LearningModel.__ILearningModelStatics := ILearningModelStatics(factoryPtr)
        }

        return LearningModel.__ILearningModelStatics.LoadFromFilePathWithOperatorProvider(filePath, operatorProvider)
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Loads an ONNX model from a stream.
     * @param {IRandomAccessStreamReference} modelStream The stream from which to load the model.
     * @param {ILearningModelOperatorProvider} operatorProvider 
     * @returns {LearningModel} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodel.loadfromstream
     */
    static LoadFromStreamWithOperatorProvider(modelStream, operatorProvider) {
        if (!LearningModel.HasProp("__ILearningModelStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.LearningModel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILearningModelStatics.IID)
            LearningModel.__ILearningModelStatics := ILearningModelStatics(factoryPtr)
        }

        return LearningModel.__ILearningModelStatics.LoadFromStreamWithOperatorProvider(modelStream, operatorProvider)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * The name of the model author.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodel.author
     * @type {HSTRING} 
     */
    Author {
        get => this.get_Author()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * The name of the model.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodel.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * The domain of the model.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodel.domain
     * @type {HSTRING} 
     */
    Domain {
        get => this.get_Domain()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * A description of the model.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodel.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * The version of the model.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodel.version
     * @type {Integer} 
     */
    Version {
        get => this.get_Version()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * The raw &lt;string,string&gt; metadata from the ONNX model.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodel.metadata
     * @type {IMapView<HSTRING, HSTRING>} 
     */
    Metadata {
        get => this.get_Metadata()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * A list of the model's input features.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodel.inputfeatures
     * @type {IVectorView<ILearningModelFeatureDescriptor>} 
     */
    InputFeatures {
        get => this.get_InputFeatures()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * A list of the model's output features.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodel.outputfeatures
     * @type {IVectorView<ILearningModelFeatureDescriptor>} 
     */
    OutputFeatures {
        get => this.get_OutputFeatures()
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
     * @returns {HSTRING} 
     */
    get_Author() {
        if (!this.HasProp("__ILearningModel")) {
            if ((queryResult := this.QueryInterface(ILearningModel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModel := ILearningModel(outPtr)
        }

        return this.__ILearningModel.get_Author()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__ILearningModel")) {
            if ((queryResult := this.QueryInterface(ILearningModel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModel := ILearningModel(outPtr)
        }

        return this.__ILearningModel.get_Name()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Domain() {
        if (!this.HasProp("__ILearningModel")) {
            if ((queryResult := this.QueryInterface(ILearningModel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModel := ILearningModel(outPtr)
        }

        return this.__ILearningModel.get_Domain()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__ILearningModel")) {
            if ((queryResult := this.QueryInterface(ILearningModel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModel := ILearningModel(outPtr)
        }

        return this.__ILearningModel.get_Description()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Version() {
        if (!this.HasProp("__ILearningModel")) {
            if ((queryResult := this.QueryInterface(ILearningModel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModel := ILearningModel(outPtr)
        }

        return this.__ILearningModel.get_Version()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, HSTRING>} 
     */
    get_Metadata() {
        if (!this.HasProp("__ILearningModel")) {
            if ((queryResult := this.QueryInterface(ILearningModel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModel := ILearningModel(outPtr)
        }

        return this.__ILearningModel.get_Metadata()
    }

    /**
     * 
     * @returns {IVectorView<ILearningModelFeatureDescriptor>} 
     */
    get_InputFeatures() {
        if (!this.HasProp("__ILearningModel")) {
            if ((queryResult := this.QueryInterface(ILearningModel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModel := ILearningModel(outPtr)
        }

        return this.__ILearningModel.get_InputFeatures()
    }

    /**
     * 
     * @returns {IVectorView<ILearningModelFeatureDescriptor>} 
     */
    get_OutputFeatures() {
        if (!this.HasProp("__ILearningModel")) {
            if ((queryResult := this.QueryInterface(ILearningModel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModel := ILearningModel(outPtr)
        }

        return this.__ILearningModel.get_OutputFeatures()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Releases the in-memory ONNX model. After calling this, you cannot create any more [LearningModelSession](learningmodelsession.md) objects.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodel.close
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

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * > [!IMPORTANT]
  * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
  * 
  * Input and output feature kinds for a machine learning model.
 * @remarks
 * Each of these maps to a corresponding feature descriptor that can be used to learn more about how to pass the feature into and out of the model.
 * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelfeaturekind
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class LearningModelFeatureKind extends Win32Enum{

    /**
     * The feature is a tensor, so use [TensorFeatureDescriptor](tensorfeaturedescriptor.md).
     * @type {Integer (Int32)}
     */
    static Tensor => 0

    /**
     * The feature is a sequence, so use [SequenceFeatureDescriptor](sequencefeaturedescriptor.md).
     * @type {Integer (Int32)}
     */
    static Sequence => 1

    /**
     * The feature is a map, so use [MapFeatureDescriptor](mapfeaturedescriptor.md).
     * @type {Integer (Int32)}
     */
    static Map => 2

    /**
     * The feature is an image, so use [ImageFeatureDescriptor](imagefeaturedescriptor.md).
     * @type {Integer (Int32)}
     */
    static Image => 3
}

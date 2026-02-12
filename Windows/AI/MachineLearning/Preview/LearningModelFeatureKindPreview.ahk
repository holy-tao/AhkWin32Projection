#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * **Deprecated.** Defines the list of data types for a model feature
 * @remarks
 * > [!Warning]
 * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
 * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodelfeaturekindpreview
 * @namespace Windows.AI.MachineLearning.Preview
 * @version WindowsRuntime 1.4
 */
class LearningModelFeatureKindPreview extends Win32Enum{

    /**
     * The feature type is Undefined.
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * The feature type is a Tensor.
     * @type {Integer (Int32)}
     */
    static Tensor => 1

    /**
     * The feature type is a Sequence.
     * @type {Integer (Int32)}
     */
    static Sequence => 2

    /**
     * The feature type is a Map.
     * @type {Integer (Int32)}
     */
    static Map => 3

    /**
     * The feature type is an Image.
     * @type {Integer (Int32)}
     */
    static Image => 4
}

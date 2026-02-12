#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * **Deprecated.** Defines the list of constants representing Windows Machine Learning supported device kinds.
 * @remarks
 * > [!Warning]
 * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
 * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.learningmodeldevicekindpreview
 * @namespace Windows.AI.MachineLearning.Preview
 * @version WindowsRuntime 1.4
 */
class LearningModelDeviceKindPreview extends Win32Enum{

    /**
     * The defualt value. Any device.
     * @type {Integer (Int32)}
     */
    static LearningDeviceAny => 0

    /**
     * A central processor.
     * @type {Integer (Int32)}
     */
    static LearningDeviceCpu => 1

    /**
     * A graphics processor.
     * @type {Integer (Int32)}
     */
    static LearningDeviceGpu => 2

    /**
     * A neural processor.
     * @type {Integer (Int32)}
     */
    static LearningDeviceNpu => 3

    /**
     * A digital signal proccesor.
     * @type {Integer (Int32)}
     */
    static LearningDeviceDsp => 4

    /**
     * A field-programmable gate array.
     * @type {Integer (Int32)}
     */
    static LearningDeviceFpga => 5
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * > [!IMPORTANT]
  * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
  * 
  * Defines the list of device kinds that can evaluate a machine learning model.
 * @remarks
 * If not specified, the system will decide which device to use.
 * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodeldevicekind
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class LearningModelDeviceKind extends Win32Enum{

    /**
     * Let the system decide which device to use.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Use the CPU to evaluate the model.
     * @type {Integer (Int32)}
     */
    static Cpu => 1

    /**
     * Use a GPU or other DirectX device to evaluate the model.
     * @type {Integer (Int32)}
     */
    static DirectX => 2

    /**
     * Use the system policy-defined device for high performance.
     * @type {Integer (Int32)}
     */
    static DirectXHighPerformance => 3

    /**
     * Use the system policy-defined device for minimum power.
     * @type {Integer (Int32)}
     */
    static DirectXMinPower => 4
}

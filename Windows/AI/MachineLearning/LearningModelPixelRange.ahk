#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * > [!IMPORTANT]
  * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
  * 
  * Defines the list of image nominal pixel range suppored by Windows ML. The proper value is specified in a machine learning model's metadata.
 * @remarks
 * If this value is not specified, the system will default to the **ZeroTo255** value.
 * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.learningmodelpixelrange
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class LearningModelPixelRange extends Win32Enum{

    /**
     * The pixel range is [0...255] for 8bpp(8 Bits per Pixel) samples.
     * @type {Integer (Int32)}
     */
    static ZeroTo255 => 0

    /**
     * The [0...1] pixel data is stored normalized.
     * @type {Integer (Int32)}
     */
    static ZeroToOne => 1

    /**
     * The [-1...1] pixel data is stored normalized.
     * @type {Integer (Int32)}
     */
    static MinusOneToOne => 2
}

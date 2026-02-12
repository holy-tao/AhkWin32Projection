#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IImageFeatureDescriptor.ahk
#Include .\IImageFeatureDescriptor2.ahk
#Include .\ILearningModelFeatureDescriptor.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!IMPORTANT]
  * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
  * 
  * Describes the properties of the image the model is expecting.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.imagefeaturedescriptor
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class ImageFeatureDescriptor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IImageFeatureDescriptor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IImageFeatureDescriptor.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Specifies the expected pixel format (channel ordering, bit depth, and data type).
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.imagefeaturedescriptor.bitmappixelformat
     * @type {Integer} 
     */
    BitmapPixelFormat {
        get => this.get_BitmapPixelFormat()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Specifies the expected alpha mode of the image.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.imagefeaturedescriptor.bitmapalphamode
     * @type {Integer} 
     */
    BitmapAlphaMode {
        get => this.get_BitmapAlphaMode()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * The expected image width.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.imagefeaturedescriptor.width
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * The expected image height.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.imagefeaturedescriptor.height
     * @type {Integer} 
     */
    Height {
        get => this.get_Height()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Provides the expected [LearningModelPixelRange](learningmodelpixelrange.md) information for use with the model.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.imagefeaturedescriptor.pixelrange
     * @type {Integer} 
     */
    PixelRange {
        get => this.get_PixelRange()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * The name you use to bind values to this feature.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.imagefeaturedescriptor.name
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
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.imagefeaturedescriptor.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * The kind of feature&mdash;use this to know which derived class to use.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.imagefeaturedescriptor.kind
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
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.imagefeaturedescriptor.isrequired
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
     * @returns {Integer} 
     */
    get_BitmapPixelFormat() {
        if (!this.HasProp("__IImageFeatureDescriptor")) {
            if ((queryResult := this.QueryInterface(IImageFeatureDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageFeatureDescriptor := IImageFeatureDescriptor(outPtr)
        }

        return this.__IImageFeatureDescriptor.get_BitmapPixelFormat()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BitmapAlphaMode() {
        if (!this.HasProp("__IImageFeatureDescriptor")) {
            if ((queryResult := this.QueryInterface(IImageFeatureDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageFeatureDescriptor := IImageFeatureDescriptor(outPtr)
        }

        return this.__IImageFeatureDescriptor.get_BitmapAlphaMode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Width() {
        if (!this.HasProp("__IImageFeatureDescriptor")) {
            if ((queryResult := this.QueryInterface(IImageFeatureDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageFeatureDescriptor := IImageFeatureDescriptor(outPtr)
        }

        return this.__IImageFeatureDescriptor.get_Width()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Height() {
        if (!this.HasProp("__IImageFeatureDescriptor")) {
            if ((queryResult := this.QueryInterface(IImageFeatureDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageFeatureDescriptor := IImageFeatureDescriptor(outPtr)
        }

        return this.__IImageFeatureDescriptor.get_Height()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PixelRange() {
        if (!this.HasProp("__IImageFeatureDescriptor2")) {
            if ((queryResult := this.QueryInterface(IImageFeatureDescriptor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageFeatureDescriptor2 := IImageFeatureDescriptor2(outPtr)
        }

        return this.__IImageFeatureDescriptor2.get_PixelRange()
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

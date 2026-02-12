#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IImageFeatureValue.ahk
#Include .\ILearningModelFeatureValue.ahk
#Include .\IImageFeatureValueStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!IMPORTANT]
  * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
  * 
  * Describes the properties of the image used to pass into a model.
 * @remarks
 * This is the recommended way of passing images as inputs and outputs. It allows you to focus on the image and not have to worry about either conversions or tensorization. You can create an **ImageFeatureValue** using the [ImageFeatureValue.CreateFromVideoFrame](imagefeaturevalue_createfromvideoframe_748588531.md) method.
 * 
 * Windows ML supports two types of [VideoFrame](../windows.media/videoframe.md): [SoftwareBitmap](../windows.graphics.imaging/softwarebitmap.md) and [IDirect3DSurface](../windows.graphics.directx.direct3d11/idirect3dsurface.md). The system takes care of both conversion and tensorization for the images to match the format the model requires. The currently supported model format types are Gray8, Rgb8, and Bgr8, and the currently supported pixel range is 0-255.
 * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.imagefeaturevalue
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class ImageFeatureValue extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IImageFeatureValue

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IImageFeatureValue.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Creates an [ImageFeatureValue](imagefeaturevalue.md) using the given video frame.
     * @param {VideoFrame} image_ The video frame to use to create the **ImageFeatureValue**.
     * @returns {ImageFeatureValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.imagefeaturevalue.createfromvideoframe
     */
    static CreateFromVideoFrame(image_) {
        if (!ImageFeatureValue.HasProp("__IImageFeatureValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.MachineLearning.ImageFeatureValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IImageFeatureValueStatics.IID)
            ImageFeatureValue.__IImageFeatureValueStatics := IImageFeatureValueStatics(factoryPtr)
        }

        return ImageFeatureValue.__IImageFeatureValueStatics.CreateFromVideoFrame(image_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Gets the video frame.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.imagefeaturevalue.videoframe
     * @type {VideoFrame} 
     */
    VideoFrame {
        get => this.get_VideoFrame()
    }

    /**
     * > [!IMPORTANT]
     * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
     * 
     * Returns the Kind associated with the feature.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.imagefeaturevalue.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {VideoFrame} 
     */
    get_VideoFrame() {
        if (!this.HasProp("__IImageFeatureValue")) {
            if ((queryResult := this.QueryInterface(IImageFeatureValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageFeatureValue := IImageFeatureValue(outPtr)
        }

        return this.__IImageFeatureValue.get_VideoFrame()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__ILearningModelFeatureValue")) {
            if ((queryResult := this.QueryInterface(ILearningModelFeatureValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILearningModelFeatureValue := ILearningModelFeatureValue(outPtr)
        }

        return this.__ILearningModelFeatureValue.get_Kind()
    }

;@endregion Instance Methods
}

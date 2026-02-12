#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVideoEffectDefinition.ahk
#Include .\IVideoTransformEffectDefinition.ahk
#Include .\IVideoTransformEffectDefinition2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the definition of a video transform effect.
 * @remarks
 * Use this class to add transformation effects to a video stream. Supported effects include rotation, mirroring, source clipping, destination mapping, spherical projection, and setting a padding color for areas in the frame that are not filled with input video.
 * @see https://learn.microsoft.com/uwp/api/windows.media.effects.videotransformeffectdefinition
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class VideoTransformEffectDefinition extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVideoEffectDefinition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVideoEffectDefinition.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the activatable class ID of the video transform effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.videotransformeffectdefinition.activatableclassid
     * @type {HSTRING} 
     */
    ActivatableClassId {
        get => this.get_ActivatableClassId()
    }

    /**
     * Gets the set of properties for configuring the [VideoTransformEffectDefinition](videotransformeffectdefinition.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.videotransformeffectdefinition.properties
     * @type {IPropertySet} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets or sets the color that will be used to fill pixels in the frame that are not filled with video, such as when video is letterboxed.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.videotransformeffectdefinition.paddingcolor
     * @type {Color} 
     */
    PaddingColor {
        get => this.get_PaddingColor()
        set => this.put_PaddingColor(value)
    }

    /**
     * Gets or sets the output size of the video, in pixels.
     * @remarks
     * When video is scaled using this property, the aspect ratio of the video is preserved.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.videotransformeffectdefinition.outputsize
     * @type {SIZE} 
     */
    OutputSize {
        get => this.get_OutputSize()
        set => this.put_OutputSize(value)
    }

    /**
     * Gets or sets the rectangle within which the video will be cropped, specified in pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.videotransformeffectdefinition.croprectangle
     * @type {RECT} 
     */
    CropRectangle {
        get => this.get_CropRectangle()
        set => this.put_CropRectangle(value)
    }

    /**
     * Gets or sets the angle and direction in which the video will be rotated.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.videotransformeffectdefinition.rotation
     * @type {Integer} 
     */
    Rotation {
        get => this.get_Rotation()
        set => this.put_Rotation(value)
    }

    /**
     * Gets or sets the direction in which the video will be mirrored.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.videotransformeffectdefinition.mirror
     * @type {Integer} 
     */
    Mirror {
        get => this.get_Mirror()
        set => this.put_Mirror(value)
    }

    /**
     * Gets or sets the media processing algorithm that is used for the video transform.
     * @remarks
     * Set this value to [MrfCrf444](../windows.media.transcoding/mediavideoprocessingalgorithm.md) to cause the video transform to use a high-quality resampler so that all operations are done using 4:4:4 sampling for the highest video quality. The algorithm applies to all transform properties except for [PaddingColor](videotransformeffectdefinition_paddingcolor.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.videotransformeffectdefinition.processingalgorithm
     * @type {Integer} 
     */
    ProcessingAlgorithm {
        get => this.get_ProcessingAlgorithm()
        set => this.put_ProcessingAlgorithm(value)
    }

    /**
     * Gets a [VideoTransformSphericalProjection](videotransformsphericalprojection.md) object that allows you to configure the spherical projection parameters used by the video transform effect.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.videotransformeffectdefinition.sphericalprojection
     * @type {VideoTransformSphericalProjection} 
     */
    SphericalProjection {
        get => this.get_SphericalProjection()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [VideoTransformEffectDefinition](videotransformeffectdefinition.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Effects.VideoTransformEffectDefinition")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ActivatableClassId() {
        if (!this.HasProp("__IVideoEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IVideoEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoEffectDefinition := IVideoEffectDefinition(outPtr)
        }

        return this.__IVideoEffectDefinition.get_ActivatableClassId()
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_Properties() {
        if (!this.HasProp("__IVideoEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IVideoEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoEffectDefinition := IVideoEffectDefinition(outPtr)
        }

        return this.__IVideoEffectDefinition.get_Properties()
    }

    /**
     * 
     * @returns {Color} 
     */
    get_PaddingColor() {
        if (!this.HasProp("__IVideoTransformEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IVideoTransformEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTransformEffectDefinition := IVideoTransformEffectDefinition(outPtr)
        }

        return this.__IVideoTransformEffectDefinition.get_PaddingColor()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_PaddingColor(value) {
        if (!this.HasProp("__IVideoTransformEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IVideoTransformEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTransformEffectDefinition := IVideoTransformEffectDefinition(outPtr)
        }

        return this.__IVideoTransformEffectDefinition.put_PaddingColor(value)
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_OutputSize() {
        if (!this.HasProp("__IVideoTransformEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IVideoTransformEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTransformEffectDefinition := IVideoTransformEffectDefinition(outPtr)
        }

        return this.__IVideoTransformEffectDefinition.get_OutputSize()
    }

    /**
     * 
     * @param {SIZE} value 
     * @returns {HRESULT} 
     */
    put_OutputSize(value) {
        if (!this.HasProp("__IVideoTransformEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IVideoTransformEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTransformEffectDefinition := IVideoTransformEffectDefinition(outPtr)
        }

        return this.__IVideoTransformEffectDefinition.put_OutputSize(value)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_CropRectangle() {
        if (!this.HasProp("__IVideoTransformEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IVideoTransformEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTransformEffectDefinition := IVideoTransformEffectDefinition(outPtr)
        }

        return this.__IVideoTransformEffectDefinition.get_CropRectangle()
    }

    /**
     * 
     * @param {RECT} value 
     * @returns {HRESULT} 
     */
    put_CropRectangle(value) {
        if (!this.HasProp("__IVideoTransformEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IVideoTransformEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTransformEffectDefinition := IVideoTransformEffectDefinition(outPtr)
        }

        return this.__IVideoTransformEffectDefinition.put_CropRectangle(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Rotation() {
        if (!this.HasProp("__IVideoTransformEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IVideoTransformEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTransformEffectDefinition := IVideoTransformEffectDefinition(outPtr)
        }

        return this.__IVideoTransformEffectDefinition.get_Rotation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Rotation(value) {
        if (!this.HasProp("__IVideoTransformEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IVideoTransformEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTransformEffectDefinition := IVideoTransformEffectDefinition(outPtr)
        }

        return this.__IVideoTransformEffectDefinition.put_Rotation(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Mirror() {
        if (!this.HasProp("__IVideoTransformEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IVideoTransformEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTransformEffectDefinition := IVideoTransformEffectDefinition(outPtr)
        }

        return this.__IVideoTransformEffectDefinition.get_Mirror()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Mirror(value) {
        if (!this.HasProp("__IVideoTransformEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IVideoTransformEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTransformEffectDefinition := IVideoTransformEffectDefinition(outPtr)
        }

        return this.__IVideoTransformEffectDefinition.put_Mirror(value)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ProcessingAlgorithm(value) {
        if (!this.HasProp("__IVideoTransformEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IVideoTransformEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTransformEffectDefinition := IVideoTransformEffectDefinition(outPtr)
        }

        return this.__IVideoTransformEffectDefinition.put_ProcessingAlgorithm(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProcessingAlgorithm() {
        if (!this.HasProp("__IVideoTransformEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IVideoTransformEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTransformEffectDefinition := IVideoTransformEffectDefinition(outPtr)
        }

        return this.__IVideoTransformEffectDefinition.get_ProcessingAlgorithm()
    }

    /**
     * 
     * @returns {VideoTransformSphericalProjection} 
     */
    get_SphericalProjection() {
        if (!this.HasProp("__IVideoTransformEffectDefinition2")) {
            if ((queryResult := this.QueryInterface(IVideoTransformEffectDefinition2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoTransformEffectDefinition2 := IVideoTransformEffectDefinition2(outPtr)
        }

        return this.__IVideoTransformEffectDefinition2.get_SphericalProjection()
    }

;@endregion Instance Methods
}

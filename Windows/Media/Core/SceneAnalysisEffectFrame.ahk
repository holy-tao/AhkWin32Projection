#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISceneAnalysisEffectFrame.ahk
#Include ..\IMediaFrame.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\ISceneAnalysisEffectFrame2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a video frame that includes the results of the scene analysis operation.
 * @remarks
 * Get an instance of this class by handling the [SceneAnalysisEffect.SceneAnalyzed](sceneanalysiseffect_sceneanalyzed.md) event.
 * 
 * For how-to guidance on using the **SceneAnalysisEffect**, see [Scene anlysis for MediaCapture](/windows/uwp/audio-video-camera/scene-analysis-for-media-capture).
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.sceneanalysiseffectframe
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class SceneAnalysisEffectFrame extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISceneAnalysisEffectFrame

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISceneAnalysisEffectFrame.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a [CapturedFrameControlValues](../windows.media.capture/capturedframecontrolvalues.md) object that indicates the capture settings used for the frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.sceneanalysiseffectframe.framecontrolvalues
     * @type {CapturedFrameControlValues} 
     */
    FrameControlValues {
        get => this.get_FrameControlValues()
    }

    /**
     * Gets a [HighDynamicRangeOutput](highdynamicrangeoutput.md) object that provides recommended FrameController objects and a value indicating the certainty of the HDR analysis.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.sceneanalysiseffectframe.highdynamicrange
     * @type {HighDynamicRangeOutput} 
     */
    HighDynamicRange {
        get => this.get_HighDynamicRange()
    }

    /**
     * Gets a string indicating the type of data the frame contains.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.sceneanalysiseffectframe.type
     * @type {HSTRING} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets a value indicating whether the frame is read-only.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.sceneanalysiseffectframe.isreadonly
     * @type {Boolean} 
     */
    IsReadOnly {
        get => this.get_IsReadOnly()
    }

    /**
     * Gets or sets the relative time of the frame within the video stream.
     * @remarks
     * Use [SystemRelativeTime](sceneanalysiseffectframe_systemrelativetime.md) to get a timestamp that is relative to the system and is correlatable across multiple media sources on the same device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.sceneanalysiseffectframe.relativetime
     * @type {IReference<TimeSpan>} 
     */
    RelativeTime {
        get => this.get_RelativeTime()
        set => this.put_RelativeTime(value)
    }

    /**
     * Gets or sets a timestamp that is relative to the system and is correlatable across multiple media sources on the same device.
     * @remarks
     * Use [RelativeTime](sceneanalysiseffectframe_relativetime.md) to get a timestamp that is relative to the video stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.sceneanalysiseffectframe.systemrelativetime
     * @type {IReference<TimeSpan>} 
     */
    SystemRelativeTime {
        get => this.get_SystemRelativeTime()
        set => this.put_SystemRelativeTime(value)
    }

    /**
     * Gets or sets the duration of the scene analysis effect frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.sceneanalysiseffectframe.duration
     * @type {IReference<TimeSpan>} 
     */
    Duration {
        get => this.get_Duration()
        set => this.put_Duration(value)
    }

    /**
     * Gets or sets a value that indicates whether a video frame is the first frame after a gap in the stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.sceneanalysiseffectframe.isdiscontinuous
     * @type {Boolean} 
     */
    IsDiscontinuous {
        get => this.get_IsDiscontinuous()
        set => this.put_IsDiscontinuous(value)
    }

    /**
     * Gets the extended property set which enables getting and setting properties on the media frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.sceneanalysiseffectframe.extendedproperties
     * @type {IPropertySet} 
     */
    ExtendedProperties {
        get => this.get_ExtendedProperties()
    }

    /**
     * Gets a value that specifies the recommended image processing to improve image quality and fidelity of captured images based on the current capture conditions.
     * @remarks
     * If the effect recommends using HDR, you can do this in the following ways:
     * 
     * * Use the [AdvancedPhotoCapture](/uwp/api/Windows.Media.Capture.AdvancedPhotoCapture) class to capture photos using the Windows built-in HDR processing algorithm. For more information, see [High Dynamic Range (HDR) and low-light photo capture](/windows/uwp/audio-video-camera/high-dynamic-range-hdr-photo-capture).
     * * Use the [HdrVideoControl](/uwp/api/Windows.Media.Devices.HdrVideoControl) to capture video using the Windows built-in HDR processing algorithm. For more information, see [Capture device controls for video capture](/windows/uwp/audio-video-camera/capture-device-controls-for-video-capture).
     * * Use [VariablePhotoSequenceCapture](/uwp/api/Windows.Media.Capture.Core.VariablePhotoSequenceCapture) to capture a sequence of frames that you can then composite using a custom HDR implementation. For more information, see [Variable photo sequence](/windows/uwp/audio-video-camera/variable-photo-sequence).
     * 
     * If the effect recomends low-light processing, you can implement this in the following ways:
     * 
     * * Use the [AdvancedPhotoCapture](/uwp/api/Windows.Media.Capture.AdvancedPhotoCapture) class to capture photos using the Windows built-in low-light processing algorithm. For more information, see [High Dynamic Range (HDR) and low-light photo capture](/windows/uwp/audio-video-camera/high-dynamic-range-hdr-photo-capture).
     * 
     * * Use the [LowLightFusion](/uwp/api/windows.media.core.lowlightfusion) class to use the Windows built-in low-light processing algorithm on images that you capture without using **AdvancedPhotoCapture**.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.sceneanalysiseffectframe.analysisrecommendation
     * @type {Integer} 
     */
    AnalysisRecommendation {
        get => this.get_AnalysisRecommendation()
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
     * @returns {CapturedFrameControlValues} 
     */
    get_FrameControlValues() {
        if (!this.HasProp("__ISceneAnalysisEffectFrame")) {
            if ((queryResult := this.QueryInterface(ISceneAnalysisEffectFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneAnalysisEffectFrame := ISceneAnalysisEffectFrame(outPtr)
        }

        return this.__ISceneAnalysisEffectFrame.get_FrameControlValues()
    }

    /**
     * 
     * @returns {HighDynamicRangeOutput} 
     */
    get_HighDynamicRange() {
        if (!this.HasProp("__ISceneAnalysisEffectFrame")) {
            if ((queryResult := this.QueryInterface(ISceneAnalysisEffectFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneAnalysisEffectFrame := ISceneAnalysisEffectFrame(outPtr)
        }

        return this.__ISceneAnalysisEffectFrame.get_HighDynamicRange()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Type() {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.get_Type()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReadOnly() {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.get_IsReadOnly()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_RelativeTime(value) {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.put_RelativeTime(value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_RelativeTime() {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.get_RelativeTime()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_SystemRelativeTime(value) {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.put_SystemRelativeTime(value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_SystemRelativeTime() {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.get_SystemRelativeTime()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_Duration(value) {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.put_Duration(value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_Duration() {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.get_Duration()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDiscontinuous(value) {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.put_IsDiscontinuous(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDiscontinuous() {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.get_IsDiscontinuous()
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_ExtendedProperties() {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.get_ExtendedProperties()
    }

    /**
     * Disposes of the object and associated resources.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.sceneanalysiseffectframe.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AnalysisRecommendation() {
        if (!this.HasProp("__ISceneAnalysisEffectFrame2")) {
            if ((queryResult := this.QueryInterface(ISceneAnalysisEffectFrame2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneAnalysisEffectFrame2 := ISceneAnalysisEffectFrame2(outPtr)
        }

        return this.__ISceneAnalysisEffectFrame2.get_AnalysisRecommendation()
    }

;@endregion Instance Methods
}

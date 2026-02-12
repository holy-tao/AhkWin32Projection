#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISceneAnalysisEffect.ahk
#Include ..\IMediaExtension.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\SceneAnalysisEffect.ahk
#Include .\SceneAnalyzedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents an effect that analyzes video frames to determine if any of the supported variable photo sequence capture techniques may produce a higher-quality captured image.
 * @remarks
 * Get an instance of this class by passing a [SceneAnalysisEffectDefinition](sceneanalysiseffectdefinition.md) object into [MediaCapture.AddVideoEffectAsync](../windows.media.capture/mediacapture_addvideoeffectasync_1410216019.md).
 * 
 * Just like other effects, the scene analyzer effect is added to the capture pipeline by calling [AddEffectAsync](../windows.media.capture/mediacapture_addeffectasync_262788603.md). After capture is started, the [SceneAnalyzed](sceneanalysiseffect_sceneanalyzed.md) event is raised. In the handler for this event, you can get access to the output object that indicates the likelihood that a particular technique will improve the captured image. The output object also provides a set of [FrameController](highdynamicrangeoutput_framecontrollers.md) objects with recommended settings that can be assigned directly to the [VariablePhotoSequenceController.DesiredFrameControllers](../windows.media.devices.core/variablephotosequencecontroller_desiredframecontrollers.md) collection to enable the capture technique.
 * 
 * In the current release, the only analyzer supported is the High Dynamic Range (HDR) analyzer.
 * 
 * For how-to guidance on using the **SceneAnalysisEffect**, see [Scene anlysis for MediaCapture](/windows/uwp/audio-video-camera/scene-analysis-for-media-capture).
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.sceneanalysiseffect
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class SceneAnalysisEffect extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISceneAnalysisEffect

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISceneAnalysisEffect.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a [HighDynamicRangeControl](highdynamicrangecontrol.md) object that is used to enable or disable High Dynamic Range (HDR) analysis.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.sceneanalysiseffect.highdynamicrangeanalyzer
     * @type {HighDynamicRangeControl} 
     */
    HighDynamicRangeAnalyzer {
        get => this.get_HighDynamicRangeAnalyzer()
    }

    /**
     * Gets or sets the duration of the time window during which video frames are analyzed.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.sceneanalysiseffect.desiredanalysisinterval
     * @type {TimeSpan} 
     */
    DesiredAnalysisInterval {
        get => this.get_DesiredAnalysisInterval()
        set => this.put_DesiredAnalysisInterval(value)
    }

    /**
     * Raised when the scene analysis is complete. See [SceneAnalyzedEventArgs](sceneanalyzedeventargs.md)
     * @type {TypedEventHandler<SceneAnalysisEffect, SceneAnalyzedEventArgs>}
    */
    OnSceneAnalyzed {
        get {
            if(!this.HasProp("__OnSceneAnalyzed")){
                this.__OnSceneAnalyzed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{48630f8c-dbde-569e-a0c8-7588d1d2bd03}"),
                    SceneAnalysisEffect,
                    SceneAnalyzedEventArgs
                )
                this.__OnSceneAnalyzedToken := this.add_SceneAnalyzed(this.__OnSceneAnalyzed.iface)
            }
            return this.__OnSceneAnalyzed
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSceneAnalyzedToken")) {
            this.remove_SceneAnalyzed(this.__OnSceneAnalyzedToken)
            this.__OnSceneAnalyzed.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HighDynamicRangeControl} 
     */
    get_HighDynamicRangeAnalyzer() {
        if (!this.HasProp("__ISceneAnalysisEffect")) {
            if ((queryResult := this.QueryInterface(ISceneAnalysisEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneAnalysisEffect := ISceneAnalysisEffect(outPtr)
        }

        return this.__ISceneAnalysisEffect.get_HighDynamicRangeAnalyzer()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_DesiredAnalysisInterval(value) {
        if (!this.HasProp("__ISceneAnalysisEffect")) {
            if ((queryResult := this.QueryInterface(ISceneAnalysisEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneAnalysisEffect := ISceneAnalysisEffect(outPtr)
        }

        return this.__ISceneAnalysisEffect.put_DesiredAnalysisInterval(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_DesiredAnalysisInterval() {
        if (!this.HasProp("__ISceneAnalysisEffect")) {
            if ((queryResult := this.QueryInterface(ISceneAnalysisEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneAnalysisEffect := ISceneAnalysisEffect(outPtr)
        }

        return this.__ISceneAnalysisEffect.get_DesiredAnalysisInterval()
    }

    /**
     * 
     * @param {TypedEventHandler<SceneAnalysisEffect, SceneAnalyzedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SceneAnalyzed(handler) {
        if (!this.HasProp("__ISceneAnalysisEffect")) {
            if ((queryResult := this.QueryInterface(ISceneAnalysisEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneAnalysisEffect := ISceneAnalysisEffect(outPtr)
        }

        return this.__ISceneAnalysisEffect.add_SceneAnalyzed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_SceneAnalyzed(cookie) {
        if (!this.HasProp("__ISceneAnalysisEffect")) {
            if ((queryResult := this.QueryInterface(ISceneAnalysisEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneAnalysisEffect := ISceneAnalysisEffect(outPtr)
        }

        return this.__ISceneAnalysisEffect.remove_SceneAnalyzed(cookie)
    }

    /**
     * Sets properties on the [IMediaExtension](../windows.media/imediaextension.md).
     * @remarks
     * This method is inherited from the [IMediaExtension](../windows.media/imediaextension.md) interface and is not intended to be used from your code. Instead, set the properties of the [SceneAnalysisEffect](sceneanalysiseffect.md) directly.
     * @param {IPropertySet} configuration The property set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.sceneanalysiseffect.setproperties
     */
    SetProperties(configuration) {
        if (!this.HasProp("__IMediaExtension")) {
            if ((queryResult := this.QueryInterface(IMediaExtension.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaExtension := IMediaExtension(outPtr)
        }

        return this.__IMediaExtension.SetProperties(configuration)
    }

;@endregion Instance Methods
}

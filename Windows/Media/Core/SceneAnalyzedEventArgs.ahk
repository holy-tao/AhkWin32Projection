#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISceneAnalyzedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [SceneAnalysisEffect.SceneAnalyzed](sceneanalysiseffect_sceneanalyzed.md) event.
 * @remarks
 * Get an instance of this class by handling the [SceneAnalysisEffect.SceneAnalyzed](sceneanalysiseffect_sceneanalyzed.md) event.
 * 
 * For how-to guidance on using the **SceneAnalysisEffect**, see [Scene anlysis for MediaCapture](/windows/uwp/audio-video-camera/scene-analysis-for-media-capture).
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.sceneanalyzedeventargs
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class SceneAnalyzedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISceneAnalyzedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISceneAnalyzedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the result frame from the scene analysis operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.sceneanalyzedeventargs.resultframe
     * @type {SceneAnalysisEffectFrame} 
     */
    ResultFrame {
        get => this.get_ResultFrame()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SceneAnalysisEffectFrame} 
     */
    get_ResultFrame() {
        if (!this.HasProp("__ISceneAnalyzedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISceneAnalyzedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneAnalyzedEventArgs := ISceneAnalyzedEventArgs(outPtr)
        }

        return this.__ISceneAnalyzedEventArgs.get_ResultFrame()
    }

;@endregion Instance Methods
}

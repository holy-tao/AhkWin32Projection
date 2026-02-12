#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHighDynamicRangeControl.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the ability to enable and disable High Dynamic Range (HDR) analysis for the [SceneAnalysisEffect](sceneanalysiseffect.md).
 * @remarks
 * Get an instance of this class by accessing the [SceneAnalysisEffect.HighDynamicRangeAnalyzer](sceneanalysiseffect_highdynamicrangeanalyzer.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.highdynamicrangecontrol
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class HighDynamicRangeControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHighDynamicRangeControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHighDynamicRangeControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that specifies whether High Dynamic Range (HDR) analysis is enabled for the [SceneAnalysisEffect](sceneanalysiseffect.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.highdynamicrangecontrol.enabled
     * @type {Boolean} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Enabled(value) {
        if (!this.HasProp("__IHighDynamicRangeControl")) {
            if ((queryResult := this.QueryInterface(IHighDynamicRangeControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHighDynamicRangeControl := IHighDynamicRangeControl(outPtr)
        }

        return this.__IHighDynamicRangeControl.put_Enabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Enabled() {
        if (!this.HasProp("__IHighDynamicRangeControl")) {
            if ((queryResult := this.QueryInterface(IHighDynamicRangeControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHighDynamicRangeControl := IHighDynamicRangeControl(outPtr)
        }

        return this.__IHighDynamicRangeControl.get_Enabled()
    }

;@endregion Instance Methods
}

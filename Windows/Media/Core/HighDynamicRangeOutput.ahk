#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHighDynamicRangeOutput.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the results of a High Dynamic Range (HDR) analysis operation from the [SceneAnalysisEffect](sceneanalysiseffect.md).
 * @remarks
 * Get an instance of this class by accessing the [SceneAnalysisEffectFrame.HighDynamicRange](sceneanalysiseffectframe_highdynamicrange.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.highdynamicrangeoutput
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class HighDynamicRangeOutput extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHighDynamicRangeOutput

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHighDynamicRangeOutput.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating the certainty of the results of the HDR analysis.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.highdynamicrangeoutput.certainty
     * @type {Float} 
     */
    Certainty {
        get => this.get_Certainty()
    }

    /**
     * Gets a set of FrameController objects representing the suggested frame controllers settings for capturing a variable photo sequence with the High Dynamic Range (HDR) technique.
     * @remarks
     * The frame controller list can be assigned to the [VariablePhotoSequenceController.DesiredFrameControllers](../windows.media.devices.core/variablephotosequencecontroller_desiredframecontrollers.md) collection to enable the HDR capture technique with suggested settings from the analysis.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.highdynamicrangeoutput.framecontrollers
     * @type {IVectorView<FrameController>} 
     */
    FrameControllers {
        get => this.get_FrameControllers()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Certainty() {
        if (!this.HasProp("__IHighDynamicRangeOutput")) {
            if ((queryResult := this.QueryInterface(IHighDynamicRangeOutput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHighDynamicRangeOutput := IHighDynamicRangeOutput(outPtr)
        }

        return this.__IHighDynamicRangeOutput.get_Certainty()
    }

    /**
     * 
     * @returns {IVectorView<FrameController>} 
     */
    get_FrameControllers() {
        if (!this.HasProp("__IHighDynamicRangeOutput")) {
            if ((queryResult := this.QueryInterface(IHighDynamicRangeOutput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHighDynamicRangeOutput := IHighDynamicRangeOutput(outPtr)
        }

        return this.__IHighDynamicRangeOutput.get_FrameControllers()
    }

;@endregion Instance Methods
}

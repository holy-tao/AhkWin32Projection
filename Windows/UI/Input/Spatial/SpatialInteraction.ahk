#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialInteraction.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an interaction caused by a hand, motion controller, or the user's voice.
 * @remarks
 * SpatialInteraction objects are not generally meant to be interpreted directly. Instead, you should target the interaction to a particular hologram based on the SpatialPointerPose from the InteractionDetected event arguments. You can then route recognition of this interaction to that hologram's SpatialGestureRecognizer by calling its CaptureInteraction method.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteraction
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialInteraction extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialInteraction

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialInteraction.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the state associated with the source update that triggered this gesture.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteraction.sourcestate
     * @type {SpatialInteractionSourceState} 
     */
    SourceState {
        get => this.get_SourceState()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SpatialInteractionSourceState} 
     */
    get_SourceState() {
        if (!this.HasProp("__ISpatialInteraction")) {
            if ((queryResult := this.QueryInterface(ISpatialInteraction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteraction := ISpatialInteraction(outPtr)
        }

        return this.__ISpatialInteraction.get_SourceState()
    }

;@endregion Instance Methods
}

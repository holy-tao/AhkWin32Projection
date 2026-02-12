#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHolographicKeyboardPlacementOverridePreview.ahk
#Include .\IHolographicKeyboardPlacementOverridePreviewStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides preview functionality that let apps influence the placement of the system keyboard in the holographic shell. This API is available only to a limited set of apps while in the preview phase.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.holographic.holographickeyboardplacementoverridepreview
 * @namespace Windows.ApplicationModel.Preview.Holographic
 * @version WindowsRuntime 1.4
 */
class HolographicKeyboardPlacementOverridePreview extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHolographicKeyboardPlacementOverridePreview

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHolographicKeyboardPlacementOverridePreview.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets an object that allows for override of the placement of the system keyboard in the holographic shell while the current view is visible. This API is available only to a limited set of apps while in the preview phase.
     * @returns {HolographicKeyboardPlacementOverridePreview} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.holographic.holographickeyboardplacementoverridepreview.getforcurrentview
     */
    static GetForCurrentView() {
        if (!HolographicKeyboardPlacementOverridePreview.HasProp("__IHolographicKeyboardPlacementOverridePreviewStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Preview.Holographic.HolographicKeyboardPlacementOverridePreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHolographicKeyboardPlacementOverridePreviewStatics.IID)
            HolographicKeyboardPlacementOverridePreview.__IHolographicKeyboardPlacementOverridePreviewStatics := IHolographicKeyboardPlacementOverridePreviewStatics(factoryPtr)
        }

        return HolographicKeyboardPlacementOverridePreview.__IHolographicKeyboardPlacementOverridePreviewStatics.GetForCurrentView()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Overrides the placement of the system keyboard to appear at a specific position and orientation, while keeping its natural size. This API is available only to a limited set of apps while in the preview phase.
     * @param {SpatialCoordinateSystem} coordinateSystem The coordinate system relative to which the keyboard will be placed.
     * @param {Vector3} topCenterPosition The position of the top-center of the keyboard.
     * @param {Vector3} normal The normal of the keyboard.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.holographic.holographickeyboardplacementoverridepreview.setplacementoverride
     */
    SetPlacementOverride(coordinateSystem, topCenterPosition, normal) {
        if (!this.HasProp("__IHolographicKeyboardPlacementOverridePreview")) {
            if ((queryResult := this.QueryInterface(IHolographicKeyboardPlacementOverridePreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicKeyboardPlacementOverridePreview := IHolographicKeyboardPlacementOverridePreview(outPtr)
        }

        return this.__IHolographicKeyboardPlacementOverridePreview.SetPlacementOverride(coordinateSystem, topCenterPosition, normal)
    }

    /**
     * Overrides the placement of the system keyboard to appear at a specific position and orientation, setting a custom maximum keyboard size. This API is available only to a limited set of apps while in the preview phase.
     * @param {SpatialCoordinateSystem} coordinateSystem The coordinate system relative to which the keyboard will be placed.
     * @param {Vector3} topCenterPosition The position of the top-center of the keyboard.
     * @param {Vector3} normal The normal of the keyboard.
     * @param {Vector2} maxSize The maximum size for the keyboard.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.holographic.holographickeyboardplacementoverridepreview.setplacementoverride
     */
    SetPlacementOverrideWithMaxSize(coordinateSystem, topCenterPosition, normal, maxSize) {
        if (!this.HasProp("__IHolographicKeyboardPlacementOverridePreview")) {
            if ((queryResult := this.QueryInterface(IHolographicKeyboardPlacementOverridePreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicKeyboardPlacementOverridePreview := IHolographicKeyboardPlacementOverridePreview(outPtr)
        }

        return this.__IHolographicKeyboardPlacementOverridePreview.SetPlacementOverrideWithMaxSize(coordinateSystem, topCenterPosition, normal, maxSize)
    }

    /**
     * Resets the placement of the system keyboard in the holographic shell to its natural position. This API is available only to a limited set of apps while in the preview phase.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.preview.holographic.holographickeyboardplacementoverridepreview.resetplacementoverride
     */
    ResetPlacementOverride() {
        if (!this.HasProp("__IHolographicKeyboardPlacementOverridePreview")) {
            if ((queryResult := this.QueryInterface(IHolographicKeyboardPlacementOverridePreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicKeyboardPlacementOverridePreview := IHolographicKeyboardPlacementOverridePreview(outPtr)
        }

        return this.__IHolographicKeyboardPlacementOverridePreview.ResetPlacementOverride()
    }

;@endregion Instance Methods
}

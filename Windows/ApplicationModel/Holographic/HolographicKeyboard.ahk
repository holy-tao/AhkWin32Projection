#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHolographicKeyboard.ahk
#Include .\IHolographicKeyboardStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Enables apps to configure the system-provided Holographic keyboard.
 * @remarks
 * Get an instance of this class by calling [HolographicKeyboard.GetDefault](holographickeyboard_getdefault_846721868.md).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.holographic.holographickeyboard
 * @namespace Windows.ApplicationModel.Holographic
 * @version WindowsRuntime 1.4
 */
class HolographicKeyboard extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHolographicKeyboard

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHolographicKeyboard.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the default instance of the [HolographicKeyboard](holographickeyboard.md) class.
     * @returns {HolographicKeyboard} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.holographic.holographickeyboard.getdefault
     */
    static GetDefault() {
        if (!HolographicKeyboard.HasProp("__IHolographicKeyboardStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Holographic.HolographicKeyboard")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHolographicKeyboardStatics.IID)
            HolographicKeyboard.__IHolographicKeyboardStatics := IHolographicKeyboardStatics(factoryPtr)
        }

        return HolographicKeyboard.__IHolographicKeyboardStatics.GetDefault()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Overrides the placement of the Holographic keyboard.
     * @param {SpatialCoordinateSystem} coordinateSystem The spatial coordinate system relative to which the other parameters are interpreted.
     * @param {Vector3} topCenterPosition The point in space where the center of the top edge of the keyboard should be placed.
     * @param {Quaternion} orientation_ A quaternion describing how the keyboard should be rotated; horizontal alignment is the caller’s responsibility.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.holographic.holographickeyboard.setplacementoverride
     */
    SetPlacementOverride(coordinateSystem, topCenterPosition, orientation_) {
        if (!this.HasProp("__IHolographicKeyboard")) {
            if ((queryResult := this.QueryInterface(IHolographicKeyboard.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicKeyboard := IHolographicKeyboard(outPtr)
        }

        return this.__IHolographicKeyboard.SetPlacementOverride(coordinateSystem, topCenterPosition, orientation_)
    }

    /**
     * Overrides the placement of the Holographic keyboard.
     * @param {SpatialCoordinateSystem} coordinateSystem The spatial coordinate system relative to which the other parameters are interpreted.
     * @param {Vector3} topCenterPosition The point in space where the center of the top edge of the keyboard should be placed.
     * @param {Quaternion} orientation_ A quaternion describing how the keyboard should be rotated; horizontal alignment is the caller’s responsibility.
     * @param {Vector2} maxSize The maximum height and width of the keyboard, in meters.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.holographic.holographickeyboard.setplacementoverride
     */
    SetPlacementOverrideWithMaxSize(coordinateSystem, topCenterPosition, orientation_, maxSize) {
        if (!this.HasProp("__IHolographicKeyboard")) {
            if ((queryResult := this.QueryInterface(IHolographicKeyboard.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicKeyboard := IHolographicKeyboard(outPtr)
        }

        return this.__IHolographicKeyboard.SetPlacementOverrideWithMaxSize(coordinateSystem, topCenterPosition, orientation_, maxSize)
    }

    /**
     * Resets the placement override, allowing the keyboard to return to its default placement.
     * @remarks
     * Set the placement override by calling one of the overloads of [HolographicKeyboard.SetPlacementOverride](holographickeyboard_setplacementoverride_502492960.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.holographic.holographickeyboard.resetplacementoverride
     */
    ResetPlacementOverride() {
        if (!this.HasProp("__IHolographicKeyboard")) {
            if ((queryResult := this.QueryInterface(IHolographicKeyboard.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicKeyboard := IHolographicKeyboard(outPtr)
        }

        return this.__IHolographicKeyboard.ResetPlacementOverride()
    }

;@endregion Instance Methods
}

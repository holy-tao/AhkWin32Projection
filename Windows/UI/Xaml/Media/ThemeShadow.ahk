#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Shadow.ahk
#Include .\IThemeShadow.ahk
#Include .\IThemeShadowFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A ThemeShadow is a preconfigured shadow effect that can be applied to any XAML element to draw shadows appropriately based on x, y, z coordinates. ThemeShadow also automatically adjusts for other environmental specifications:
  * 
  * - Adapts to changes in lighting, user theme, app environment, and shell.
  * - Shadows elements automatically based on their elevation.
  * - Keeps elements in sync as they move and change elevation.
  * - Keeps shadows consistent throughout and across applications.
 * @remarks
 * > [!TIP]
 * > For more info, design guidance, and code examples, see [Z-depth and shadow](/windows/uwp/design/layout/depth-shadow).
 * 
 * A ThemeShadow can be applied to any XAML element to draw shadows based on the relative x, y, and z coordinates between a conceptual caster UIElement and one or more receiver UIElements which have the caster's shadow rendered onto them. 
 * 
 * ThemeShadow supports only rectangular shadows. For custom shadow effects, you can use a [DropShadow](../windows.ui.composition/dropshadow.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.themeshadow
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class ThemeShadow extends Shadow {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IThemeShadow

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IThemeShadow.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {ThemeShadow} 
     */
    static CreateInstance() {
        if (!ThemeShadow.HasProp("__IThemeShadowFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.ThemeShadow")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IThemeShadowFactory.IID)
            ThemeShadow.__IThemeShadowFactory := IThemeShadowFactory(factoryPtr)
        }

        return ThemeShadow.__IThemeShadowFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a collection of UI elements that this ThemeShadow is cast on.
     * @remarks
     * > [!TIP]
     * > For more info, design guidance, and code examples, see [Z-depth and shadow](/windows/uwp/design/layout/depth-shadow).
     * 
     * To cast a shadow effect from a XAML UI element that isn't in a [Popup](../windows.ui.xaml.controls.primitives/popup.md), you must explicitly specify the other UI elements that can receive the shadow by adding them to this Receivers collection.
     * 
     * Receivers cannot be an ancestor of the caster in the visual tree.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.themeshadow.receivers
     * @type {UIElementWeakCollection} 
     */
    Receivers {
        get => this.get_Receivers()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {UIElementWeakCollection} 
     */
    get_Receivers() {
        if (!this.HasProp("__IThemeShadow")) {
            if ((queryResult := this.QueryInterface(IThemeShadow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IThemeShadow := IThemeShadow(outPtr)
        }

        return this.__IThemeShadow.get_Receivers()
    }

;@endregion Instance Methods
}

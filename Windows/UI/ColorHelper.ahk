#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IColorHelper.ahk
#Include .\IColorHelperStatics.ahk
#Include .\IColorHelperStatics2.ahk
#Include ..\..\Guid.ahk

/**
 * Provides static helper methods for processing [Color](color.md) values. C# and Microsoft Visual Basic code should use methods of [Color](color.md) instead.
 * @remarks
 * [Color](color.md) is a Windows Runtime structure that represents a color that has four channels: **A** (alpha), **R** (red), **G** (green), **B** (blue). Each of the values is stored as a **Byte** type with value 0-255. The most frequent application of [Color](color.md) is to define color-related properties in a UI element as part of a UWP app using C++, C#, or Visual Basic and its XAML UI definition.
 * 
 * ColorHelper is one of several **Helper** classes that are intended to provide utility methods for Windows Runtime structure values. C# and Microsoft Visual Basic code can use methods of [Color](color.md) instead, because utility methods are available directly on the structure due to .NET Framework runtime support. C++ code including Visual C++ component extensions (C++/CX) can only access the data values on [Color](color.md), for example the **A** field value. For C++ developers, some of the utility features that C# and Microsoft Visual Basic can use directly on [Color](color.md) as nondata members are available from the ColorHelper class.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.colorhelper
 * @namespace Windows.UI
 * @version WindowsRuntime 1.4
 */
class ColorHelper extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IColorHelper

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IColorHelper.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Generates a [Color](color.md) structure, based on discrete **Byte** values for **ARGB** components. C# and Microsoft Visual Basic code should use **Color.FromArgb** instead.
     * @remarks
     * > **C#/Visual Basic**
     * > The [ColorHelper](colorhelper.md) class is available for use from C# and Visual Basic code but it's not commonly used. The **FromArgb** method that's available as a static method of the [Color](color.md) structure has exactly the same functionality, and you also have other API there that's more convenient to use from [Color](color.md) itself rather than using the [ColorHelper](colorhelper.md) class. [ColorHelper](colorhelper.md) is mainly intended for C++ code, which doesn't have access to the nondata API of the [Color](color.md) structure.
     * 
     * The most common reason for creating a [Color](color.md) value is to use it as an argument for the [SolidColorBrush](../windows.ui.xaml.media/solidcolorbrush_solidcolorbrush_2106742027.md) constructor, then assign that brush to a XAML UI property.
     * @param {Integer} a The **A** (transparency) component of the desired color. Range is 0-255.
     * @param {Integer} r The **R** component of the desired color. Range is 0-255.
     * @param {Integer} g The **G** component of the desired color. Range is 0-255.
     * @param {Integer} b The **B** component of the desired color. Range is 0-255.
     * @returns {Color} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colorhelper.fromargb
     */
    static FromArgb(a, r, g, b) {
        if (!ColorHelper.HasProp("__IColorHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ColorHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorHelperStatics.IID)
            ColorHelper.__IColorHelperStatics := IColorHelperStatics(factoryPtr)
        }

        return ColorHelper.__IColorHelperStatics.FromArgb(a, r, g, b)
    }

    /**
     * Retrieves the display name of the specified color.
     * @param {Color} color_ The color to get the name for.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colorhelper.todisplayname
     */
    static ToDisplayName(color_) {
        if (!ColorHelper.HasProp("__IColorHelperStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.ColorHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorHelperStatics2.IID)
            ColorHelper.__IColorHelperStatics2 := IColorHelperStatics2(factoryPtr)
        }

        return ColorHelper.__IColorHelperStatics2.ToDisplayName(color_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}

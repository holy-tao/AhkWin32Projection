#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITextConstantsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Defines a set of constants that are used with various methods in the [Windows.UI.Text](windows_ui_text.md) namespace.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.textconstants
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class TextConstants extends IInspectable {
;@region Static Properties
    /**
     * Gets the default color.
     * @remarks
     * When a color argument has this value, the appropriate system default color is used.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.textconstants.autocolor
     * @type {Color} 
     */
    static AutoColor {
        get => TextConstants.get_AutoColor()
    }

    /**
     * Gets the minimum unit count.
     * @remarks
     * This value is used as a large negative count for the [ITextRange.Move](itextrange_move_1126378751.md), [ITextRange.MoveEnd](itextrange_moveend_1212634036.md), and [ITextRange.MoveStart](itextrange_movestart_65838126.md) methods.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.textconstants.minunitcount
     * @type {Integer} 
     */
    static MinUnitCount {
        get => TextConstants.get_MinUnitCount()
    }

    /**
     * Gets the maximum unit count.
     * @remarks
     * This value is used as a large positive count for the [ITextRange.Move](itextrange_move_1126378751.md), [ITextRange.MoveEnd](itextrange_moveend_1212634036.md), and [ITextRange.MoveStart](itextrange_movestart_65838126.md) methods.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.textconstants.maxunitcount
     * @type {Integer} 
     */
    static MaxUnitCount {
        get => TextConstants.get_MaxUnitCount()
    }

    /**
     * Gets the undefined color value.
     * @remarks
     * When retrieving a character-format color property, this value indicates that a range has at least two text runs with different values of that character-format color property. When setting a character-format color property, this value indicates that the property is undefined; that is, it will not be applied if the [ITextCharacterFormat](itextcharacterformat.md) is applied to a range. This value is used with properties such as [ITextCharacterFormat.BackgroundColor](itextcharacterformat_backgroundcolor.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.textconstants.undefinedcolor
     * @type {Color} 
     */
    static UndefinedColor {
        get => TextConstants.get_UndefinedColor()
    }

    /**
     * Gets the undefined floating-point value.
     * @remarks
     * When retrieving a floating-point format property, this value indicates that a range has at least two text runs with different values of that property. When setting such a property, this value indicates that the property is undefined; that is, it will not be applied if the [ITextCharacterFormat](itextcharacterformat.md) or [ITextParagraphFormat](itextparagraphformat.md) is applied to a range. This value is used with properties such as [ITextCharacterFormat.Size](itextcharacterformat_size.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.textconstants.undefinedfloatvalue
     * @type {Float} 
     */
    static UndefinedFloatValue {
        get => TextConstants.get_UndefinedFloatValue()
    }

    /**
     * Gets the undefined 32-bit integer value.
     * @remarks
     * When retrieving an integer format property, this value indicates that a range has at least two text runs with different values of that property. When setting such a property, this value indicates that the property is undefined; that is, it will not be applied if the [ITextCharacterFormat](itextcharacterformat.md) or [ITextParagraphFormat](itextparagraphformat.md) is applied to a range. This value is used with properties such as [ITextCharacterFormat.ListStart](itextparagraphformat_liststart.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.textconstants.undefinedint32value
     * @type {Integer} 
     */
    static UndefinedInt32Value {
        get => TextConstants.get_UndefinedInt32Value()
    }

    /**
     * Gets the undefined font stretch value.
     * @remarks
     * When retrieving the font-stretch property, this value indicates that a range has at least two text runs with different values of that property. When setting a font-stretch property, this value indicates that the property is undefined; that is, it will not be applied if the [ITextCharacterFormat](itextcharacterformat.md) is applied to a range. This value is used with the [ITextCharacterFormat.FontStretch](itextcharacterformat_fontstretch.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.textconstants.undefinedfontstretch
     * @type {Integer} 
     */
    static UndefinedFontStretch {
        get => TextConstants.get_UndefinedFontStretch()
    }

    /**
     * Gets the undefined font style.
     * @remarks
     * When retrieving the font-style property, this value indicates that a range has at least two text runs with different values of that property. When setting the font-style property, this value indicates that the property is undefined; that is, it will not be applied if the [ITextCharacterFormat](itextcharacterformat.md) is applied to a range. This value is used with the [ITextCharacterFormat.FontStyle](itextcharacterformat_fontstyle.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.textconstants.undefinedfontstyle
     * @type {Integer} 
     */
    static UndefinedFontStyle {
        get => TextConstants.get_UndefinedFontStyle()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Color} 
     */
    static get_AutoColor() {
        if (!TextConstants.HasProp("__ITextConstantsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Text.TextConstants")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextConstantsStatics.IID)
            TextConstants.__ITextConstantsStatics := ITextConstantsStatics(factoryPtr)
        }

        return TextConstants.__ITextConstantsStatics.get_AutoColor()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MinUnitCount() {
        if (!TextConstants.HasProp("__ITextConstantsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Text.TextConstants")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextConstantsStatics.IID)
            TextConstants.__ITextConstantsStatics := ITextConstantsStatics(factoryPtr)
        }

        return TextConstants.__ITextConstantsStatics.get_MinUnitCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MaxUnitCount() {
        if (!TextConstants.HasProp("__ITextConstantsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Text.TextConstants")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextConstantsStatics.IID)
            TextConstants.__ITextConstantsStatics := ITextConstantsStatics(factoryPtr)
        }

        return TextConstants.__ITextConstantsStatics.get_MaxUnitCount()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_UndefinedColor() {
        if (!TextConstants.HasProp("__ITextConstantsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Text.TextConstants")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextConstantsStatics.IID)
            TextConstants.__ITextConstantsStatics := ITextConstantsStatics(factoryPtr)
        }

        return TextConstants.__ITextConstantsStatics.get_UndefinedColor()
    }

    /**
     * 
     * @returns {Float} 
     */
    static get_UndefinedFloatValue() {
        if (!TextConstants.HasProp("__ITextConstantsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Text.TextConstants")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextConstantsStatics.IID)
            TextConstants.__ITextConstantsStatics := ITextConstantsStatics(factoryPtr)
        }

        return TextConstants.__ITextConstantsStatics.get_UndefinedFloatValue()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_UndefinedInt32Value() {
        if (!TextConstants.HasProp("__ITextConstantsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Text.TextConstants")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextConstantsStatics.IID)
            TextConstants.__ITextConstantsStatics := ITextConstantsStatics(factoryPtr)
        }

        return TextConstants.__ITextConstantsStatics.get_UndefinedInt32Value()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_UndefinedFontStretch() {
        if (!TextConstants.HasProp("__ITextConstantsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Text.TextConstants")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextConstantsStatics.IID)
            TextConstants.__ITextConstantsStatics := ITextConstantsStatics(factoryPtr)
        }

        return TextConstants.__ITextConstantsStatics.get_UndefinedFontStretch()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_UndefinedFontStyle() {
        if (!TextConstants.HasProp("__ITextConstantsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Text.TextConstants")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextConstantsStatics.IID)
            TextConstants.__ITextConstantsStatics := ITextConstantsStatics(factoryPtr)
        }

        return TextConstants.__ITextConstantsStatics.get_UndefinedFontStyle()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}

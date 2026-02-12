#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFontFamily.ahk
#Include .\IFontFamilyStatics2.ahk
#Include .\IFontFamilyFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a family of related fonts.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.fontfamily
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class FontFamily extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFontFamily

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFontFamily.IID

    /**
     * Gets the default font family based on an app's language settings.
     * @remarks
     * XamlAutoFontFamily is the default **FontFamily** property setting for all XAML controls. The [FontFamily](fontfamily.md) that this property gets at run time depends on the app language.
     * 
     * <table>
     *    <tr><th>Language</th><th>Default FontFamily</th></tr>
     *    <tr><td>Japanese</td><td>Yu Gothic UI</td></tr>
     *    <tr><td>Korean</td><td>Malgun Gothic</td></tr>
     *    <tr><td>All others</td><td>Segoe UI</td></tr>
     * </table>
     * 
     * 
     * 
     * <!--<p>	FontFamily.XamlAutoFontFamily.Source returns the actual font family for the app, for example, "Segoe UI" or "Yu Gothic UI", rather than "XamlAutoFontFamily".</p>-->
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.fontfamily.xamlautofontfamily
     * @type {FontFamily} 
     */
    static XamlAutoFontFamily {
        get => FontFamily.get_XamlAutoFontFamily()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {FontFamily} 
     */
    static get_XamlAutoFontFamily() {
        if (!FontFamily.HasProp("__IFontFamilyStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.FontFamily")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFontFamilyStatics2.IID)
            FontFamily.__IFontFamilyStatics2 := IFontFamilyStatics2(factoryPtr)
        }

        return FontFamily.__IFontFamilyStatics2.get_XamlAutoFontFamily()
    }

    /**
     * 
     * @param {HSTRING} familyName 
     * @returns {FontFamily} 
     */
    static CreateInstanceWithName(familyName) {
        if (!FontFamily.HasProp("__IFontFamilyFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.FontFamily")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFontFamilyFactory.IID)
            FontFamily.__IFontFamilyFactory := IFontFamilyFactory(factoryPtr)
        }

        return FontFamily.__IFontFamilyFactory.CreateInstanceWithName(familyName, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the font family name that is used to construct the [FontFamily](fontfamily.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.fontfamily.source
     * @type {HSTRING} 
     */
    Source {
        get => this.get_Source()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Source() {
        if (!this.HasProp("__IFontFamily")) {
            if ((queryResult := this.QueryInterface(IFontFamily.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFontFamily := IFontFamily(outPtr)
        }

        return this.__IFontFamily.get_Source()
    }

;@endregion Instance Methods
}

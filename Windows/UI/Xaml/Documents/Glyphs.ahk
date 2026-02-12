#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\FrameworkElement.ahk
#Include .\IGlyphs.ahk
#Include .\IGlyphs2.ahk
#Include .\IGlyphsStatics.ahk
#Include .\IGlyphsStatics2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides a visual representation of letters, characters, or symbols, in a specific font and style.
 * @remarks
 * The Glyphs class provides a light weight text element that you can use to display small amounts of text, such as icons. The Glyphs element can be faster than a [TextBlock](../windows.ui.xaml.controls/textblock.md) in some cases, so you should consider using Glyphs when performance is a concern. However, the Glyphs element doesn't have the same localization and stylistic properties as a [TextBlock](../windows.ui.xaml.controls/textblock.md) control. For example, Glyphs does not support [FontWeight](../windows.ui.xaml.controls/textblock_fontweight.md) or bidirectional text.
 * 
 * The Glyphs element can be used only with a font that is included in the app package as a resource. Only use fonts that you have the rights to ship with your app. Take this into consideration when choosing between [TextBlock](../windows.ui.xaml.controls/textblock.md) and Glyphs.
 * 
 * Starting in Windows 10, the Glyphs control supports the display of color fonts. (See [IsColorFontEnabled](glyphs_iscolorfontenabled.md) and [ColorFontPaletteIndex](glyphs_colorfontpaletteindex.md).)
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.glyphs
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class Glyphs extends FrameworkElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGlyphs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGlyphs.IID

    /**
     * Identifies the [UnicodeString](glyphs_unicodestring.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.glyphs.unicodestringproperty
     * @type {DependencyProperty} 
     */
    static UnicodeStringProperty {
        get => Glyphs.get_UnicodeStringProperty()
    }

    /**
     * Identifies the [Indices](glyphs_indices.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.glyphs.indicesproperty
     * @type {DependencyProperty} 
     */
    static IndicesProperty {
        get => Glyphs.get_IndicesProperty()
    }

    /**
     * Identifies the [FontUri](glyphs_fonturi.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.glyphs.fonturiproperty
     * @type {DependencyProperty} 
     */
    static FontUriProperty {
        get => Glyphs.get_FontUriProperty()
    }

    /**
     * Identifies the [StyleSimulations](glyphs_stylesimulations.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.glyphs.stylesimulationsproperty
     * @type {DependencyProperty} 
     */
    static StyleSimulationsProperty {
        get => Glyphs.get_StyleSimulationsProperty()
    }

    /**
     * Identifies the [FontRenderingEmSize](glyphs_fontrenderingemsize.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.glyphs.fontrenderingemsizeproperty
     * @type {DependencyProperty} 
     */
    static FontRenderingEmSizeProperty {
        get => Glyphs.get_FontRenderingEmSizeProperty()
    }

    /**
     * Identifies the [OriginX](glyphs_originx.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.glyphs.originxproperty
     * @type {DependencyProperty} 
     */
    static OriginXProperty {
        get => Glyphs.get_OriginXProperty()
    }

    /**
     * Identifies the [OriginY](glyphs_originy.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.glyphs.originyproperty
     * @type {DependencyProperty} 
     */
    static OriginYProperty {
        get => Glyphs.get_OriginYProperty()
    }

    /**
     * Identifies the [Fill](glyphs_fill.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.glyphs.fillproperty
     * @type {DependencyProperty} 
     */
    static FillProperty {
        get => Glyphs.get_FillProperty()
    }

    /**
     * Identifies the [IsColorFontEnabled](glyphs_iscolorfontenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.glyphs.iscolorfontenabledproperty
     * @type {DependencyProperty} 
     */
    static IsColorFontEnabledProperty {
        get => Glyphs.get_IsColorFontEnabledProperty()
    }

    /**
     * Identifies the [ColorFontPaletteIndex](glyphs_colorfontpaletteindex.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.glyphs.colorfontpaletteindexproperty
     * @type {DependencyProperty} 
     */
    static ColorFontPaletteIndexProperty {
        get => Glyphs.get_ColorFontPaletteIndexProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_UnicodeStringProperty() {
        if (!Glyphs.HasProp("__IGlyphsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Glyphs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGlyphsStatics.IID)
            Glyphs.__IGlyphsStatics := IGlyphsStatics(factoryPtr)
        }

        return Glyphs.__IGlyphsStatics.get_UnicodeStringProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IndicesProperty() {
        if (!Glyphs.HasProp("__IGlyphsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Glyphs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGlyphsStatics.IID)
            Glyphs.__IGlyphsStatics := IGlyphsStatics(factoryPtr)
        }

        return Glyphs.__IGlyphsStatics.get_IndicesProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontUriProperty() {
        if (!Glyphs.HasProp("__IGlyphsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Glyphs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGlyphsStatics.IID)
            Glyphs.__IGlyphsStatics := IGlyphsStatics(factoryPtr)
        }

        return Glyphs.__IGlyphsStatics.get_FontUriProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StyleSimulationsProperty() {
        if (!Glyphs.HasProp("__IGlyphsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Glyphs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGlyphsStatics.IID)
            Glyphs.__IGlyphsStatics := IGlyphsStatics(factoryPtr)
        }

        return Glyphs.__IGlyphsStatics.get_StyleSimulationsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontRenderingEmSizeProperty() {
        if (!Glyphs.HasProp("__IGlyphsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Glyphs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGlyphsStatics.IID)
            Glyphs.__IGlyphsStatics := IGlyphsStatics(factoryPtr)
        }

        return Glyphs.__IGlyphsStatics.get_FontRenderingEmSizeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OriginXProperty() {
        if (!Glyphs.HasProp("__IGlyphsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Glyphs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGlyphsStatics.IID)
            Glyphs.__IGlyphsStatics := IGlyphsStatics(factoryPtr)
        }

        return Glyphs.__IGlyphsStatics.get_OriginXProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OriginYProperty() {
        if (!Glyphs.HasProp("__IGlyphsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Glyphs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGlyphsStatics.IID)
            Glyphs.__IGlyphsStatics := IGlyphsStatics(factoryPtr)
        }

        return Glyphs.__IGlyphsStatics.get_OriginYProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FillProperty() {
        if (!Glyphs.HasProp("__IGlyphsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Glyphs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGlyphsStatics.IID)
            Glyphs.__IGlyphsStatics := IGlyphsStatics(factoryPtr)
        }

        return Glyphs.__IGlyphsStatics.get_FillProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsColorFontEnabledProperty() {
        if (!Glyphs.HasProp("__IGlyphsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Glyphs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGlyphsStatics2.IID)
            Glyphs.__IGlyphsStatics2 := IGlyphsStatics2(factoryPtr)
        }

        return Glyphs.__IGlyphsStatics2.get_IsColorFontEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ColorFontPaletteIndexProperty() {
        if (!Glyphs.HasProp("__IGlyphsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Glyphs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGlyphsStatics2.IID)
            Glyphs.__IGlyphsStatics2 := IGlyphsStatics2(factoryPtr)
        }

        return Glyphs.__IGlyphsStatics2.get_ColorFontPaletteIndexProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the Unicode string to render in glyphs.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.glyphs.unicodestring
     * @type {HSTRING} 
     */
    UnicodeString {
        get => this.get_UnicodeString()
        set => this.put_UnicodeString(value)
    }

    /**
     * Gets or sets a collection of glyph specifications that represents the Glyphs object.
     * @remarks
     * A sequence of glyphs forms a single cluster. The specification of the first glyph in the cluster is preceded by a specification of how many glyphs and how many code points combine to form the cluster. The Indices property collects in one string the following properties:
     * 
     * - Glyph indices
     * - Glyph advance widths
     * - Combining glyph attachment vectors
     * - Cluster mapping from code points to glyphs
     * - Glyph flags
     * 
     * Each glyph specification has the following form.
     * 
     * `[GlyphIndex][,[Advance][,[uOffset][,[vOffset][,[Flags]]]]]`
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.glyphs.indices
     * @type {HSTRING} 
     */
    Indices {
        get => this.get_Indices()
        set => this.put_Indices(value)
    }

    /**
     * Gets or sets the location of the font used for rendering the glyphs.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.glyphs.fonturi
     * @type {Uri} 
     */
    FontUri {
        get => this.get_FontUri()
        set => this.put_FontUri(value)
    }

    /**
     * Gets or sets the style simulations applied to the glyphs.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.glyphs.stylesimulations
     * @type {Integer} 
     */
    StyleSimulations {
        get => this.get_StyleSimulations()
        set => this.put_StyleSimulations(value)
    }

    /**
     * Gets or sets the em size used for rendering the glyphs.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.glyphs.fontrenderingemsize
     * @type {Float} 
     */
    FontRenderingEmSize {
        get => this.get_FontRenderingEmSize()
        set => this.put_FontRenderingEmSize(value)
    }

    /**
     * Gets or sets the x origin for the glyphs.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.glyphs.originx
     * @type {Float} 
     */
    OriginX {
        get => this.get_OriginX()
        set => this.put_OriginX(value)
    }

    /**
     * Gets or sets the y origin for the glyphs.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.glyphs.originy
     * @type {Float} 
     */
    OriginY {
        get => this.get_OriginY()
        set => this.put_OriginY(value)
    }

    /**
     * Gets or sets the [Brush](../windows.ui.xaml.media/brush.md) that is used to render the glyphs.
     * @remarks
     * Because the default is **null**, you almost always should define a value for Fill somehow if you want your [Glyphs](glyphs.md) to render in UI.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.glyphs.fill
     * @type {Brush} 
     */
    Fill {
        get => this.get_Fill()
        set => this.put_Fill(value)
    }

    /**
     * Gets or sets a value that determines whether font glyphs that contain color layers, such as Segoe UI Emoji, are rendered in color.
     * @remarks
     * Starting in Windows 10, you can set the IsColorFontEnabled property on the [Glyphs](glyphs.md) element. Prior to Windows 10, you could enable or disable color fonts only on text controls, like [TextBlock](../windows.ui.xaml.controls/textblock.md).
     * 
     * 
     * 
     * 
     * <!--The following remark is relevant for Windows 8 > 8.1 migration. See Windows Blue bug 452226.-->
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.glyphs.iscolorfontenabled
     * @type {Boolean} 
     */
    IsColorFontEnabled {
        get => this.get_IsColorFontEnabled()
        set => this.put_IsColorFontEnabled(value)
    }

    /**
     * Gets or sets the index of the palette to use for the color font.
     * @remarks
     * If [IsColorFontEnabled](glyphs_iscolorfontenabled.md) is **false**, the ColorFontPaletteIndex is ignored.
     * 
     * Color fonts can have different color palettes that specify the colors of the layers in the font. You can set the ColorFontPaletteIndex value to specify which palette to use. If the specified value isn't valid for the font, color is disabled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.glyphs.colorfontpaletteindex
     * @type {Integer} 
     */
    ColorFontPaletteIndex {
        get => this.get_ColorFontPaletteIndex()
        set => this.put_ColorFontPaletteIndex(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [Glyphs](glyphs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Glyphs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UnicodeString() {
        if (!this.HasProp("__IGlyphs")) {
            if ((queryResult := this.QueryInterface(IGlyphs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlyphs := IGlyphs(outPtr)
        }

        return this.__IGlyphs.get_UnicodeString()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_UnicodeString(value) {
        if (!this.HasProp("__IGlyphs")) {
            if ((queryResult := this.QueryInterface(IGlyphs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlyphs := IGlyphs(outPtr)
        }

        return this.__IGlyphs.put_UnicodeString(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Indices() {
        if (!this.HasProp("__IGlyphs")) {
            if ((queryResult := this.QueryInterface(IGlyphs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlyphs := IGlyphs(outPtr)
        }

        return this.__IGlyphs.get_Indices()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Indices(value) {
        if (!this.HasProp("__IGlyphs")) {
            if ((queryResult := this.QueryInterface(IGlyphs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlyphs := IGlyphs(outPtr)
        }

        return this.__IGlyphs.put_Indices(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_FontUri() {
        if (!this.HasProp("__IGlyphs")) {
            if ((queryResult := this.QueryInterface(IGlyphs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlyphs := IGlyphs(outPtr)
        }

        return this.__IGlyphs.get_FontUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_FontUri(value) {
        if (!this.HasProp("__IGlyphs")) {
            if ((queryResult := this.QueryInterface(IGlyphs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlyphs := IGlyphs(outPtr)
        }

        return this.__IGlyphs.put_FontUri(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StyleSimulations() {
        if (!this.HasProp("__IGlyphs")) {
            if ((queryResult := this.QueryInterface(IGlyphs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlyphs := IGlyphs(outPtr)
        }

        return this.__IGlyphs.get_StyleSimulations()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_StyleSimulations(value) {
        if (!this.HasProp("__IGlyphs")) {
            if ((queryResult := this.QueryInterface(IGlyphs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlyphs := IGlyphs(outPtr)
        }

        return this.__IGlyphs.put_StyleSimulations(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FontRenderingEmSize() {
        if (!this.HasProp("__IGlyphs")) {
            if ((queryResult := this.QueryInterface(IGlyphs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlyphs := IGlyphs(outPtr)
        }

        return this.__IGlyphs.get_FontRenderingEmSize()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_FontRenderingEmSize(value) {
        if (!this.HasProp("__IGlyphs")) {
            if ((queryResult := this.QueryInterface(IGlyphs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlyphs := IGlyphs(outPtr)
        }

        return this.__IGlyphs.put_FontRenderingEmSize(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OriginX() {
        if (!this.HasProp("__IGlyphs")) {
            if ((queryResult := this.QueryInterface(IGlyphs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlyphs := IGlyphs(outPtr)
        }

        return this.__IGlyphs.get_OriginX()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_OriginX(value) {
        if (!this.HasProp("__IGlyphs")) {
            if ((queryResult := this.QueryInterface(IGlyphs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlyphs := IGlyphs(outPtr)
        }

        return this.__IGlyphs.put_OriginX(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OriginY() {
        if (!this.HasProp("__IGlyphs")) {
            if ((queryResult := this.QueryInterface(IGlyphs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlyphs := IGlyphs(outPtr)
        }

        return this.__IGlyphs.get_OriginY()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_OriginY(value) {
        if (!this.HasProp("__IGlyphs")) {
            if ((queryResult := this.QueryInterface(IGlyphs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlyphs := IGlyphs(outPtr)
        }

        return this.__IGlyphs.put_OriginY(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_Fill() {
        if (!this.HasProp("__IGlyphs")) {
            if ((queryResult := this.QueryInterface(IGlyphs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlyphs := IGlyphs(outPtr)
        }

        return this.__IGlyphs.get_Fill()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_Fill(value) {
        if (!this.HasProp("__IGlyphs")) {
            if ((queryResult := this.QueryInterface(IGlyphs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlyphs := IGlyphs(outPtr)
        }

        return this.__IGlyphs.put_Fill(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsColorFontEnabled() {
        if (!this.HasProp("__IGlyphs2")) {
            if ((queryResult := this.QueryInterface(IGlyphs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlyphs2 := IGlyphs2(outPtr)
        }

        return this.__IGlyphs2.get_IsColorFontEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsColorFontEnabled(value) {
        if (!this.HasProp("__IGlyphs2")) {
            if ((queryResult := this.QueryInterface(IGlyphs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlyphs2 := IGlyphs2(outPtr)
        }

        return this.__IGlyphs2.put_IsColorFontEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ColorFontPaletteIndex() {
        if (!this.HasProp("__IGlyphs2")) {
            if ((queryResult := this.QueryInterface(IGlyphs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlyphs2 := IGlyphs2(outPtr)
        }

        return this.__IGlyphs2.get_ColorFontPaletteIndex()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ColorFontPaletteIndex(value) {
        if (!this.HasProp("__IGlyphs2")) {
            if ((queryResult := this.QueryInterface(IGlyphs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlyphs2 := IGlyphs2(outPtr)
        }

        return this.__IGlyphs2.put_ColorFontPaletteIndex(value)
    }

;@endregion Instance Methods
}

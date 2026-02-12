#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITypography.ahk
#Include .\ITypographyStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides access to a set of Microsoft OpenType typography properties. These properties are implemented as XAML attached properties such that they can be set from text object model properties as well as from specific text controls.
 * @remarks
 * You typically use Typography attached properties with the text of [TextBlock](../windows.ui.xaml.controls/textblock.md) or [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) controls. 
 * 
 * > [!NOTE]
 * > You cannot use these properties with the [TextBox](../windows.ui.xaml.controls/textbox.md) or [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) controls. 
 * 
 * The Typography object exposes the set of features that the Microsoft OpenType font supports. By setting the properties of Typography in markup or code, you can author documents that take advantage of Microsoft OpenType features, and turn those features on at a per-element level if desired.
 * 
 * Some fonts contain stylistic variant glyphs that correspond to portions of a character set. Glyphs in stylistic sets may be designed to harmonize visually, interact in particular ways, or work together in other ways. Some of these variants are identified by particular conventions, for example the font might have discretionary ligatures. In this example case, the typography behavior can be enabled by setting [Typography.DiscretionaryLigatures](/uwp/api/windows.ui.xaml.documents.typography.discretionaryligatures) to true. Other stylistic variants are not identified by any Microsoft OpenType set or convention, and are instead specific to that particular font's typography design. These variants can be accessed by setting any of the **StylisticSet#** attached properties to true.
 * 
 * 
 * 
 * > [!NOTE]
 * > Whenever possible, [TextBlock](../windows.ui.xaml.controls/textblock.md) renders text using an efficient *fast path*. Only the default values for the various Typography attached properties are fast path. Non-default values require [TextBlock](../windows.ui.xaml.controls/textblock.md) to fall back to a more CPU intensive code path for text rendering. For more info, see the [TextBlock control guide](/windows/uwp/controls-and-patterns/text-block).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class Typography extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITypography

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITypography.IID

    /**
     * Identifies the [AnnotationAlternates](typography_annotationalternates.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.annotationalternatesproperty
     * @type {DependencyProperty} 
     */
    static AnnotationAlternatesProperty {
        get => Typography.get_AnnotationAlternatesProperty()
    }

    /**
     * Identifies the [EastAsianExpertForms](typography_eastasianexpertforms.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.eastasianexpertformsproperty
     * @type {DependencyProperty} 
     */
    static EastAsianExpertFormsProperty {
        get => Typography.get_EastAsianExpertFormsProperty()
    }

    /**
     * Identifies the [EastAsianLanguage](typography_eastasianlanguage.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.eastasianlanguageproperty
     * @type {DependencyProperty} 
     */
    static EastAsianLanguageProperty {
        get => Typography.get_EastAsianLanguageProperty()
    }

    /**
     * Identifies the [EastAsianWidths](typography_eastasianwidths.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.eastasianwidthsproperty
     * @type {DependencyProperty} 
     */
    static EastAsianWidthsProperty {
        get => Typography.get_EastAsianWidthsProperty()
    }

    /**
     * Identifies the [StandardLigatures](typography_standardligatures.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.standardligaturesproperty
     * @type {DependencyProperty} 
     */
    static StandardLigaturesProperty {
        get => Typography.get_StandardLigaturesProperty()
    }

    /**
     * Identifies the [ContextualLigatures](typography_contextualligatures.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.contextualligaturesproperty
     * @type {DependencyProperty} 
     */
    static ContextualLigaturesProperty {
        get => Typography.get_ContextualLigaturesProperty()
    }

    /**
     * Identifies the [DiscretionaryLigatures](typography_discretionaryligatures.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.discretionaryligaturesproperty
     * @type {DependencyProperty} 
     */
    static DiscretionaryLigaturesProperty {
        get => Typography.get_DiscretionaryLigaturesProperty()
    }

    /**
     * Identifies the [HistoricalLigatures](typography_historicalligatures.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.historicalligaturesproperty
     * @type {DependencyProperty} 
     */
    static HistoricalLigaturesProperty {
        get => Typography.get_HistoricalLigaturesProperty()
    }

    /**
     * Identifies the [StandardSwashes](typography_standardswashes.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.standardswashesproperty
     * @type {DependencyProperty} 
     */
    static StandardSwashesProperty {
        get => Typography.get_StandardSwashesProperty()
    }

    /**
     * Identifies the [ContextualSwashes](typography_contextualswashes.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.contextualswashesproperty
     * @type {DependencyProperty} 
     */
    static ContextualSwashesProperty {
        get => Typography.get_ContextualSwashesProperty()
    }

    /**
     * Identifies the [ContextualAlternates](typography_contextualalternates.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.contextualalternatesproperty
     * @type {DependencyProperty} 
     */
    static ContextualAlternatesProperty {
        get => Typography.get_ContextualAlternatesProperty()
    }

    /**
     * Identifies the [StylisticAlternates](typography_stylisticalternates.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.stylisticalternatesproperty
     * @type {DependencyProperty} 
     */
    static StylisticAlternatesProperty {
        get => Typography.get_StylisticAlternatesProperty()
    }

    /**
     * Identifies the [StylisticSet1](typography_stylisticset1.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.stylisticset1property
     * @type {DependencyProperty} 
     */
    static StylisticSet1Property {
        get => Typography.get_StylisticSet1Property()
    }

    /**
     * Identifies the [StylisticSet2](typography_stylisticset2.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.stylisticset2property
     * @type {DependencyProperty} 
     */
    static StylisticSet2Property {
        get => Typography.get_StylisticSet2Property()
    }

    /**
     * Identifies the [StylisticSet3](typography_stylisticset3.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.stylisticset3property
     * @type {DependencyProperty} 
     */
    static StylisticSet3Property {
        get => Typography.get_StylisticSet3Property()
    }

    /**
     * Identifies the [StylisticSet4](typography_stylisticset4.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.stylisticset4property
     * @type {DependencyProperty} 
     */
    static StylisticSet4Property {
        get => Typography.get_StylisticSet4Property()
    }

    /**
     * Identifies the [StylisticSet5](typography_stylisticset5.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.stylisticset5property
     * @type {DependencyProperty} 
     */
    static StylisticSet5Property {
        get => Typography.get_StylisticSet5Property()
    }

    /**
     * Identifies the [StylisticSet6](typography_stylisticset6.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.stylisticset6property
     * @type {DependencyProperty} 
     */
    static StylisticSet6Property {
        get => Typography.get_StylisticSet6Property()
    }

    /**
     * Identifies the [StylisticSet7](typography_stylisticset7.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.stylisticset7property
     * @type {DependencyProperty} 
     */
    static StylisticSet7Property {
        get => Typography.get_StylisticSet7Property()
    }

    /**
     * Identifies the [StylisticSet8](typography_stylisticset8.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.stylisticset8property
     * @type {DependencyProperty} 
     */
    static StylisticSet8Property {
        get => Typography.get_StylisticSet8Property()
    }

    /**
     * Identifies the [StylisticSet9](typography_stylisticset9.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.stylisticset9property
     * @type {DependencyProperty} 
     */
    static StylisticSet9Property {
        get => Typography.get_StylisticSet9Property()
    }

    /**
     * Identifies the [StylisticSet10](typography_stylisticset10.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.stylisticset10property
     * @type {DependencyProperty} 
     */
    static StylisticSet10Property {
        get => Typography.get_StylisticSet10Property()
    }

    /**
     * Identifies the [StylisticSet11](typography_stylisticset11.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.stylisticset11property
     * @type {DependencyProperty} 
     */
    static StylisticSet11Property {
        get => Typography.get_StylisticSet11Property()
    }

    /**
     * Identifies the [StylisticSet12](typography_stylisticset12.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.stylisticset12property
     * @type {DependencyProperty} 
     */
    static StylisticSet12Property {
        get => Typography.get_StylisticSet12Property()
    }

    /**
     * Identifies the [StylisticSet13](typography_stylisticset13.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.stylisticset13property
     * @type {DependencyProperty} 
     */
    static StylisticSet13Property {
        get => Typography.get_StylisticSet13Property()
    }

    /**
     * Identifies the [StylisticSet14](typography_stylisticset14.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.stylisticset14property
     * @type {DependencyProperty} 
     */
    static StylisticSet14Property {
        get => Typography.get_StylisticSet14Property()
    }

    /**
     * Identifies the [StylisticSet15](typography_stylisticset15.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.stylisticset15property
     * @type {DependencyProperty} 
     */
    static StylisticSet15Property {
        get => Typography.get_StylisticSet15Property()
    }

    /**
     * Identifies the [StylisticSet16](typography_stylisticset16.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.stylisticset16property
     * @type {DependencyProperty} 
     */
    static StylisticSet16Property {
        get => Typography.get_StylisticSet16Property()
    }

    /**
     * Identifies the [StylisticSet17](typography_stylisticset17.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.stylisticset17property
     * @type {DependencyProperty} 
     */
    static StylisticSet17Property {
        get => Typography.get_StylisticSet17Property()
    }

    /**
     * Identifies the [StylisticSet18](typography_stylisticset18.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.stylisticset18property
     * @type {DependencyProperty} 
     */
    static StylisticSet18Property {
        get => Typography.get_StylisticSet18Property()
    }

    /**
     * Identifies the [StylisticSet19](typography_stylisticset19.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.stylisticset19property
     * @type {DependencyProperty} 
     */
    static StylisticSet19Property {
        get => Typography.get_StylisticSet19Property()
    }

    /**
     * Identifies the [StylisticSet20](typography_stylisticset20.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.stylisticset20property
     * @type {DependencyProperty} 
     */
    static StylisticSet20Property {
        get => Typography.get_StylisticSet20Property()
    }

    /**
     * Identifies the [Capitals](typography_capitals.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.capitalsproperty
     * @type {DependencyProperty} 
     */
    static CapitalsProperty {
        get => Typography.get_CapitalsProperty()
    }

    /**
     * Identifies the [CapitalSpacing](typography_capitalspacing.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.capitalspacingproperty
     * @type {DependencyProperty} 
     */
    static CapitalSpacingProperty {
        get => Typography.get_CapitalSpacingProperty()
    }

    /**
     * Identifies the [Kerning](typography_kerning.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.kerningproperty
     * @type {DependencyProperty} 
     */
    static KerningProperty {
        get => Typography.get_KerningProperty()
    }

    /**
     * Identifies the [CaseSensitiveForms](typography_casesensitiveforms.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.casesensitiveformsproperty
     * @type {DependencyProperty} 
     */
    static CaseSensitiveFormsProperty {
        get => Typography.get_CaseSensitiveFormsProperty()
    }

    /**
     * Identifies the [HistoricalForms](typography_historicalforms.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.historicalformsproperty
     * @type {DependencyProperty} 
     */
    static HistoricalFormsProperty {
        get => Typography.get_HistoricalFormsProperty()
    }

    /**
     * Identifies the [Fraction](typography_fraction.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.fractionproperty
     * @type {DependencyProperty} 
     */
    static FractionProperty {
        get => Typography.get_FractionProperty()
    }

    /**
     * Identifies the [NumeralStyle](typography_numeralstyle.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.numeralstyleproperty
     * @type {DependencyProperty} 
     */
    static NumeralStyleProperty {
        get => Typography.get_NumeralStyleProperty()
    }

    /**
     * Identifies the [NumeralAlignment](typography_numeralalignment.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.numeralalignmentproperty
     * @type {DependencyProperty} 
     */
    static NumeralAlignmentProperty {
        get => Typography.get_NumeralAlignmentProperty()
    }

    /**
     * Identifies the [SlashedZero](typography_slashedzero.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.slashedzeroproperty
     * @type {DependencyProperty} 
     */
    static SlashedZeroProperty {
        get => Typography.get_SlashedZeroProperty()
    }

    /**
     * Identifies the [MathematicalGreek](typography_mathematicalgreek.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.mathematicalgreekproperty
     * @type {DependencyProperty} 
     */
    static MathematicalGreekProperty {
        get => Typography.get_MathematicalGreekProperty()
    }

    /**
     * Identifies the [Variants](typography_variants.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.variantsproperty
     * @type {DependencyProperty} 
     */
    static VariantsProperty {
        get => Typography.get_VariantsProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AnnotationAlternatesProperty() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_AnnotationAlternatesProperty()
    }

    /**
     * Returns the value of the [AnnotationAlternates](typography_annotationalternates.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [AnnotationAlternates](typography_annotationalternates.md) property.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getannotationalternates
     */
    static GetAnnotationAlternates(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetAnnotationAlternates(element)
    }

    /**
     * Sets the value of the [AnnotationAlternates](typography_annotationalternates.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [AnnotationAlternates](typography_annotationalternates.md) property.
     * @param {Integer} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setannotationalternates
     */
    static SetAnnotationAlternates(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetAnnotationAlternates(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_EastAsianExpertFormsProperty() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_EastAsianExpertFormsProperty()
    }

    /**
     * Returns the value of the [EastAsianExpertForms](typography_eastasianexpertforms.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [EastAsianExpertForms](typography_eastasianexpertforms.md) property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.geteastasianexpertforms
     */
    static GetEastAsianExpertForms(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetEastAsianExpertForms(element)
    }

    /**
     * Sets the value of the [EastAsianExpertForms](typography_eastasianexpertforms.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [EastAsianExpertForms](typography_eastasianexpertforms.md) property.
     * @param {Boolean} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.seteastasianexpertforms
     */
    static SetEastAsianExpertForms(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetEastAsianExpertForms(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_EastAsianLanguageProperty() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_EastAsianLanguageProperty()
    }

    /**
     * Returns the value of the [EastAsianLanguage](typography_eastasianlanguage.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [EastAsianLanguage](typography_eastasianlanguage.md) property.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.geteastasianlanguage
     */
    static GetEastAsianLanguage(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetEastAsianLanguage(element)
    }

    /**
     * Sets the value of the [EastAsianLanguage](typography_eastasianlanguage.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [EastAsianLanguage](typography_eastasianlanguage.md) property.
     * @param {Integer} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.seteastasianlanguage
     */
    static SetEastAsianLanguage(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetEastAsianLanguage(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_EastAsianWidthsProperty() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_EastAsianWidthsProperty()
    }

    /**
     * Returns the value of the [EastAsianWidths](typography_eastasianwidths.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [EastAsianWidths](typography_eastasianwidths.md) property.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.geteastasianwidths
     */
    static GetEastAsianWidths(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetEastAsianWidths(element)
    }

    /**
     * Sets the value of the [EastAsianWidths](typography_eastasianwidths.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [EastAsianWidths](typography_eastasianwidths.md) property.
     * @param {Integer} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.seteastasianwidths
     */
    static SetEastAsianWidths(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetEastAsianWidths(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StandardLigaturesProperty() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_StandardLigaturesProperty()
    }

    /**
     * Returns the value of the [StandardLigatures](typography_standardligatures.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [StandardLigatures](typography_standardligatures.md) property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getstandardligatures
     */
    static GetStandardLigatures(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetStandardLigatures(element)
    }

    /**
     * Sets the value of the [StandardLigatures](typography_standardligatures.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [StandardLigatures](typography_standardligatures.md) property.
     * @param {Boolean} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setstandardligatures
     */
    static SetStandardLigatures(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetStandardLigatures(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContextualLigaturesProperty() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_ContextualLigaturesProperty()
    }

    /**
     * Returns the value of the [ContextualLigatures](typography_contextualligatures.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [ContextualLigatures](typography_contextualligatures.md) property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getcontextualligatures
     */
    static GetContextualLigatures(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetContextualLigatures(element)
    }

    /**
     * Sets the value of the [ContextualLigatures](typography_contextualligatures.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [ContextualLigatures](typography_contextualligatures.md) property.
     * @param {Boolean} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setcontextualligatures
     */
    static SetContextualLigatures(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetContextualLigatures(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DiscretionaryLigaturesProperty() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_DiscretionaryLigaturesProperty()
    }

    /**
     * Returns the value of the [DiscretionaryLigatures](typography_discretionaryligatures.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [DiscretionaryLigatures](typography_discretionaryligatures.md) property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getdiscretionaryligatures
     */
    static GetDiscretionaryLigatures(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetDiscretionaryLigatures(element)
    }

    /**
     * Sets the value of the [DiscretionaryLigatures](typography_discretionaryligatures.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [DiscretionaryLigatures](typography_discretionaryligatures.md) property.
     * @param {Boolean} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setdiscretionaryligatures
     */
    static SetDiscretionaryLigatures(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetDiscretionaryLigatures(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HistoricalLigaturesProperty() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_HistoricalLigaturesProperty()
    }

    /**
     * Returns the value of the [HistoricalLigatures](typography_historicalligatures.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [HistoricalLigatures](typography_historicalligatures.md) property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.gethistoricalligatures
     */
    static GetHistoricalLigatures(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetHistoricalLigatures(element)
    }

    /**
     * Sets the value of the [HistoricalLigatures](typography_historicalligatures.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [HistoricalLigatures](typography_historicalligatures.md) property.
     * @param {Boolean} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.sethistoricalligatures
     */
    static SetHistoricalLigatures(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetHistoricalLigatures(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StandardSwashesProperty() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_StandardSwashesProperty()
    }

    /**
     * Returns the value of the [StandardSwashes](typography_standardswashes.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [StandardSwashes](typography_standardswashes.md) property.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getstandardswashes
     */
    static GetStandardSwashes(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetStandardSwashes(element)
    }

    /**
     * Sets the value of the [StandardSwashes](typography_standardswashes.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [StandardSwashes](typography_standardswashes.md) property.
     * @param {Integer} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setstandardswashes
     */
    static SetStandardSwashes(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetStandardSwashes(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContextualSwashesProperty() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_ContextualSwashesProperty()
    }

    /**
     * Returns the value of the [ContextualSwashes](typography_contextualswashes.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [ContextualSwashes](typography_contextualswashes.md) property.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getcontextualswashes
     */
    static GetContextualSwashes(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetContextualSwashes(element)
    }

    /**
     * Sets the value of the [ContextualSwashes](typography_contextualswashes.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [ContextualSwashes](typography_contextualswashes.md) property.
     * @param {Integer} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setcontextualswashes
     */
    static SetContextualSwashes(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetContextualSwashes(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContextualAlternatesProperty() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_ContextualAlternatesProperty()
    }

    /**
     * Returns the value of the [ContextualAlternates](typography_contextualalternates.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [ContextualAlternates](typography_contextualalternates.md) property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getcontextualalternates
     */
    static GetContextualAlternates(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetContextualAlternates(element)
    }

    /**
     * Sets the value of the [ContextualAlternates](typography_contextualalternates.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [ContextualAlternates](typography_contextualalternates.md) property.
     * @param {Boolean} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setcontextualalternates
     */
    static SetContextualAlternates(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetContextualAlternates(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StylisticAlternatesProperty() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_StylisticAlternatesProperty()
    }

    /**
     * Returns the value of the [StylisticAlternates](typography_stylisticalternates.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [StylisticAlternates](typography_stylisticalternates.md) property.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getstylisticalternates
     */
    static GetStylisticAlternates(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetStylisticAlternates(element)
    }

    /**
     * Sets the value of the [StylisticAlternates](typography_stylisticalternates.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [StylisticAlternates](typography_stylisticalternates.md) property.
     * @param {Integer} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setstylisticalternates
     */
    static SetStylisticAlternates(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetStylisticAlternates(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StylisticSet1Property() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_StylisticSet1Property()
    }

    /**
     * Returns the value of the [StylisticSet1](typography_stylisticset1.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [StylisticSet1](typography_stylisticset1.md) property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getstylisticset1
     */
    static GetStylisticSet1(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetStylisticSet1(element)
    }

    /**
     * Sets the value of the [StylisticSet1](typography_stylisticset1.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [StylisticSet1](typography_stylisticset1.md) property.
     * @param {Boolean} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setstylisticset1
     */
    static SetStylisticSet1(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetStylisticSet1(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StylisticSet2Property() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_StylisticSet2Property()
    }

    /**
     * Returns the value of the [StylisticSet2](typography_stylisticset2.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [StylisticSet2](typography_stylisticset2.md) property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getstylisticset2
     */
    static GetStylisticSet2(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetStylisticSet2(element)
    }

    /**
     * Sets the value of the [StylisticSet2](typography_stylisticset2.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [StylisticSet2](typography_stylisticset2.md) property.
     * @param {Boolean} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setstylisticset2
     */
    static SetStylisticSet2(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetStylisticSet2(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StylisticSet3Property() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_StylisticSet3Property()
    }

    /**
     * Returns the value of the [StylisticSet3](typography_stylisticset3.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [StylisticSet3](typography_stylisticset3.md) property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getstylisticset3
     */
    static GetStylisticSet3(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetStylisticSet3(element)
    }

    /**
     * Sets the value of the [StylisticSet3](typography_stylisticset3.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [StylisticSet3](typography_stylisticset3.md) property.
     * @param {Boolean} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setstylisticset3
     */
    static SetStylisticSet3(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetStylisticSet3(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StylisticSet4Property() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_StylisticSet4Property()
    }

    /**
     * Returns the value of the [StylisticSet4](typography_stylisticset4.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [StylisticSet4](typography_stylisticset4.md) property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getstylisticset4
     */
    static GetStylisticSet4(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetStylisticSet4(element)
    }

    /**
     * Sets the value of the [StylisticSet4](typography_stylisticset4.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [StylisticSet4](typography_stylisticset4.md) property.
     * @param {Boolean} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setstylisticset4
     */
    static SetStylisticSet4(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetStylisticSet4(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StylisticSet5Property() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_StylisticSet5Property()
    }

    /**
     * Returns the value of the [StylisticSet5](typography_stylisticset5.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [StylisticSet5](typography_stylisticset5.md) property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getstylisticset5
     */
    static GetStylisticSet5(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetStylisticSet5(element)
    }

    /**
     * Sets the value of the [StylisticSet5](typography_stylisticset5.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [StylisticSet5](typography_stylisticset5.md) property.
     * @param {Boolean} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setstylisticset5
     */
    static SetStylisticSet5(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetStylisticSet5(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StylisticSet6Property() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_StylisticSet6Property()
    }

    /**
     * Returns the value of the [StylisticSet6](typography_stylisticset6.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [StylisticSet6](typography_stylisticset6.md) property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getstylisticset6
     */
    static GetStylisticSet6(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetStylisticSet6(element)
    }

    /**
     * Sets the value of the [StylisticSet6](typography_stylisticset6.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [StylisticSet6](typography_stylisticset6.md) property.
     * @param {Boolean} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setstylisticset6
     */
    static SetStylisticSet6(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetStylisticSet6(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StylisticSet7Property() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_StylisticSet7Property()
    }

    /**
     * Returns the value of the [StylisticSet7](typography_stylisticset7.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [StylisticSet7](typography_stylisticset7.md) property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getstylisticset7
     */
    static GetStylisticSet7(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetStylisticSet7(element)
    }

    /**
     * Sets the value of the [StylisticSet7](typography_stylisticset7.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [StylisticSet7](typography_stylisticset7.md) property.
     * @param {Boolean} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setstylisticset7
     */
    static SetStylisticSet7(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetStylisticSet7(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StylisticSet8Property() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_StylisticSet8Property()
    }

    /**
     * Returns the value of the [StylisticSet8](typography_stylisticset8.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [StylisticSet8](typography_stylisticset8.md) property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getstylisticset8
     */
    static GetStylisticSet8(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetStylisticSet8(element)
    }

    /**
     * Sets the value of the [StylisticSet8](typography_stylisticset8.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [StylisticSet8](typography_stylisticset8.md) property.
     * @param {Boolean} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setstylisticset8
     */
    static SetStylisticSet8(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetStylisticSet8(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StylisticSet9Property() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_StylisticSet9Property()
    }

    /**
     * Returns the value of the [StylisticSet9](typography_stylisticset9.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [StylisticSet9](typography_stylisticset9.md) property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getstylisticset9
     */
    static GetStylisticSet9(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetStylisticSet9(element)
    }

    /**
     * Sets the value of the [StylisticSet9](typography_stylisticset9.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [StylisticSet9](typography_stylisticset9.md) property.
     * @param {Boolean} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setstylisticset9
     */
    static SetStylisticSet9(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetStylisticSet9(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StylisticSet10Property() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_StylisticSet10Property()
    }

    /**
     * Returns the value of the [StylisticSet10](typography_stylisticset10.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [StylisticSet10](typography_stylisticset10.md) property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getstylisticset10
     */
    static GetStylisticSet10(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetStylisticSet10(element)
    }

    /**
     * Sets the value of the [StylisticSet10](typography_stylisticset10.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [StylisticSet10](typography_stylisticset10.md) property.
     * @param {Boolean} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setstylisticset10
     */
    static SetStylisticSet10(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetStylisticSet10(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StylisticSet11Property() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_StylisticSet11Property()
    }

    /**
     * Returns the value of the [StylisticSet11](typography_stylisticset11.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [StylisticSet11](typography_stylisticset11.md) property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getstylisticset11
     */
    static GetStylisticSet11(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetStylisticSet11(element)
    }

    /**
     * Sets the value of the [StylisticSet11](typography_stylisticset11.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [StylisticSet11](typography_stylisticset11.md) property.
     * @param {Boolean} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setstylisticset11
     */
    static SetStylisticSet11(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetStylisticSet11(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StylisticSet12Property() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_StylisticSet12Property()
    }

    /**
     * Returns the value of the [StylisticSet12](typography_stylisticset12.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [StylisticSet12](typography_stylisticset12.md) property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getstylisticset12
     */
    static GetStylisticSet12(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetStylisticSet12(element)
    }

    /**
     * Sets the value of the [StylisticSet12](typography_stylisticset12.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [StylisticSet12](typography_stylisticset12.md) property.
     * @param {Boolean} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setstylisticset12
     */
    static SetStylisticSet12(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetStylisticSet12(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StylisticSet13Property() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_StylisticSet13Property()
    }

    /**
     * Returns the value of the [StylisticSet13](typography_stylisticset13.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [StylisticSet13](typography_stylisticset13.md) property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getstylisticset13
     */
    static GetStylisticSet13(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetStylisticSet13(element)
    }

    /**
     * Sets the value of the [StylisticSet13](typography_stylisticset13.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [StylisticSet13](typography_stylisticset13.md) property.
     * @param {Boolean} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setstylisticset13
     */
    static SetStylisticSet13(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetStylisticSet13(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StylisticSet14Property() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_StylisticSet14Property()
    }

    /**
     * Returns the value of the [StylisticSet14](typography_stylisticset14.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [StylisticSet14](typography_stylisticset14.md) property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getstylisticset14
     */
    static GetStylisticSet14(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetStylisticSet14(element)
    }

    /**
     * Sets the value of the [StylisticSet14](typography_stylisticset14.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [StylisticSet14](typography_stylisticset14.md) property.
     * @param {Boolean} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setstylisticset14
     */
    static SetStylisticSet14(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetStylisticSet14(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StylisticSet15Property() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_StylisticSet15Property()
    }

    /**
     * Returns the value of the [StylisticSet15](typography_stylisticset15.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [StylisticSet15](typography_stylisticset15.md) property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getstylisticset15
     */
    static GetStylisticSet15(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetStylisticSet15(element)
    }

    /**
     * Sets the value of the [StylisticSet15](typography_stylisticset15.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [StylisticSet15](typography_stylisticset15.md) property.
     * @param {Boolean} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setstylisticset15
     */
    static SetStylisticSet15(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetStylisticSet15(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StylisticSet16Property() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_StylisticSet16Property()
    }

    /**
     * Returns the value of the [StylisticSet16](typography_stylisticset16.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [StylisticSet16](typography_stylisticset16.md) property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getstylisticset16
     */
    static GetStylisticSet16(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetStylisticSet16(element)
    }

    /**
     * Sets the value of the [StylisticSet16](typography_stylisticset16.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [StylisticSet16](typography_stylisticset16.md) property.
     * @param {Boolean} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setstylisticset16
     */
    static SetStylisticSet16(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetStylisticSet16(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StylisticSet17Property() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_StylisticSet17Property()
    }

    /**
     * Returns the value of the [StylisticSet17](typography_stylisticset17.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [StylisticSet17](typography_stylisticset17.md) property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getstylisticset17
     */
    static GetStylisticSet17(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetStylisticSet17(element)
    }

    /**
     * Sets the value of the [StylisticSet17](typography_stylisticset17.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [StylisticSet17](typography_stylisticset17.md) property.
     * @param {Boolean} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setstylisticset17
     */
    static SetStylisticSet17(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetStylisticSet17(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StylisticSet18Property() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_StylisticSet18Property()
    }

    /**
     * Returns the value of the [StylisticSet18](typography_stylisticset18.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [StylisticSet18](typography_stylisticset18.md) property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getstylisticset18
     */
    static GetStylisticSet18(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetStylisticSet18(element)
    }

    /**
     * Sets the value of the [StylisticSet18](typography_stylisticset18.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [StylisticSet18](typography_stylisticset18.md) property.
     * @param {Boolean} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setstylisticset18
     */
    static SetStylisticSet18(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetStylisticSet18(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StylisticSet19Property() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_StylisticSet19Property()
    }

    /**
     * Returns the value of the [StylisticSet19](typography_stylisticset19.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [StylisticSet19](typography_stylisticset19.md) property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getstylisticset19
     */
    static GetStylisticSet19(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetStylisticSet19(element)
    }

    /**
     * Sets the value of the [StylisticSet19](typography_stylisticset19.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [StylisticSet19](typography_stylisticset19.md) property.
     * @param {Boolean} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setstylisticset19
     */
    static SetStylisticSet19(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetStylisticSet19(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StylisticSet20Property() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_StylisticSet20Property()
    }

    /**
     * Returns the value of the [StylisticSet20](typography_stylisticset20.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [StylisticSet20](typography_stylisticset20.md) property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getstylisticset20
     */
    static GetStylisticSet20(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetStylisticSet20(element)
    }

    /**
     * Sets the value of the [StylisticSet20](typography_stylisticset20.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [StylisticSet20](typography_stylisticset20.md) property.
     * @param {Boolean} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setstylisticset20
     */
    static SetStylisticSet20(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetStylisticSet20(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CapitalsProperty() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_CapitalsProperty()
    }

    /**
     * Returns the value of the [Capitals](typography_capitals.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [Capitals](typography_capitals.md) property.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getcapitals
     */
    static GetCapitals(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetCapitals(element)
    }

    /**
     * Sets the value of the [Capitals](typography_capitals.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [Capitals](typography_capitals.md) property.
     * @param {Integer} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setcapitals
     */
    static SetCapitals(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetCapitals(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CapitalSpacingProperty() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_CapitalSpacingProperty()
    }

    /**
     * Returns the value of the [CapitalSpacing](typography_capitalspacing.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [CapitalSpacing](typography_capitalspacing.md) property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getcapitalspacing
     */
    static GetCapitalSpacing(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetCapitalSpacing(element)
    }

    /**
     * Sets the value of the [CapitalSpacing](typography_capitalspacing.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [CapitalSpacing](typography_capitalspacing.md) property.
     * @param {Boolean} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setcapitalspacing
     */
    static SetCapitalSpacing(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetCapitalSpacing(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_KerningProperty() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_KerningProperty()
    }

    /**
     * Returns the value of the [Kerning](typography_kerning.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [Kerning](typography_kerning.md) property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getkerning
     */
    static GetKerning(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetKerning(element)
    }

    /**
     * Sets the value of the [Kerning](typography_kerning.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [Kerning](typography_kerning.md) property.
     * @param {Boolean} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setkerning
     */
    static SetKerning(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetKerning(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CaseSensitiveFormsProperty() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_CaseSensitiveFormsProperty()
    }

    /**
     * Returns the value of the [CaseSensitiveForms](typography_casesensitiveforms.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [CaseSensitiveForms](typography_casesensitiveforms.md) property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getcasesensitiveforms
     */
    static GetCaseSensitiveForms(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetCaseSensitiveForms(element)
    }

    /**
     * Sets the value of the [CaseSensitiveForms](typography_casesensitiveforms.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [CaseSensitiveForms](typography_casesensitiveforms.md) property.
     * @param {Boolean} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setcasesensitiveforms
     */
    static SetCaseSensitiveForms(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetCaseSensitiveForms(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HistoricalFormsProperty() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_HistoricalFormsProperty()
    }

    /**
     * Returns the value of the [HistoricalForms](typography_historicalforms.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [HistoricalForms](typography_historicalforms.md) property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.gethistoricalforms
     */
    static GetHistoricalForms(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetHistoricalForms(element)
    }

    /**
     * Sets the value of the [HistoricalForms](typography_historicalforms.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [HistoricalForms](typography_historicalforms.md) property.
     * @param {Boolean} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.sethistoricalforms
     */
    static SetHistoricalForms(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetHistoricalForms(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FractionProperty() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_FractionProperty()
    }

    /**
     * Returns the value of the [Fraction](typography_fraction.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [Fraction](typography_fraction.md) property.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getfraction
     */
    static GetFraction(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetFraction(element)
    }

    /**
     * Sets the value of the [Fraction](typography_fraction.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [Fraction](typography_fraction.md) property.
     * @param {Integer} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setfraction
     */
    static SetFraction(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetFraction(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_NumeralStyleProperty() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_NumeralStyleProperty()
    }

    /**
     * Returns the value of the [NumeralStyle](typography_numeralstyle.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [NumeralStyle](typography_numeralstyle.md) property.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getnumeralstyle
     */
    static GetNumeralStyle(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetNumeralStyle(element)
    }

    /**
     * Sets the value of the [NumeralStyle](typography_numeralstyle.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [NumeralStyle](typography_numeralstyle.md) property.
     * @param {Integer} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setnumeralstyle
     */
    static SetNumeralStyle(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetNumeralStyle(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_NumeralAlignmentProperty() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_NumeralAlignmentProperty()
    }

    /**
     * Returns the value of the [NumeralAlignment](typography_numeralalignment.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [NumeralAlignment](typography_numeralalignment.md) property.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getnumeralalignment
     */
    static GetNumeralAlignment(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetNumeralAlignment(element)
    }

    /**
     * Sets the value of the [NumeralAlignment](typography_numeralalignment.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [NumeralAlignment](typography_numeralalignment.md) property.
     * @param {Integer} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setnumeralalignment
     */
    static SetNumeralAlignment(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetNumeralAlignment(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SlashedZeroProperty() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_SlashedZeroProperty()
    }

    /**
     * Returns the value of the [SlashedZero](typography_slashedzero.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [SlashedZero](typography_slashedzero.md) property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getslashedzero
     */
    static GetSlashedZero(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetSlashedZero(element)
    }

    /**
     * Sets the value of the [SlashedZero](typography_slashedzero.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [SlashedZero](typography_slashedzero.md) property.
     * @param {Boolean} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setslashedzero
     */
    static SetSlashedZero(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetSlashedZero(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MathematicalGreekProperty() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_MathematicalGreekProperty()
    }

    /**
     * Returns the value of the [MathematicalGreek](typography_mathematicalgreek.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [MathematicalGreek](typography_mathematicalgreek.md) property.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getmathematicalgreek
     */
    static GetMathematicalGreek(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetMathematicalGreek(element)
    }

    /**
     * Sets the value of the [MathematicalGreek](typography_mathematicalgreek.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [MathematicalGreek](typography_mathematicalgreek.md) property.
     * @param {Boolean} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setmathematicalgreek
     */
    static SetMathematicalGreek(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetMathematicalGreek(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_VariantsProperty() {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.get_VariantsProperty()
    }

    /**
     * Returns the value of the [Variants](typography_variants.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to retrieve the value of the [Variants](typography_variants.md) property.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.getvariants
     */
    static GetVariants(element) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.GetVariants(element)
    }

    /**
     * Sets the value of the [Variants](typography_variants.md) attached property for a specified dependency object.
     * @param {DependencyObject} element The dependency object for which to set the value of the [Variants](typography_variants.md) property.
     * @param {Integer} value The new value to set the property to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.typography.setvariants
     */
    static SetVariants(element, value) {
        if (!Typography.HasProp("__ITypographyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.Typography")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITypographyStatics.IID)
            Typography.__ITypographyStatics := ITypographyStatics(factoryPtr)
        }

        return Typography.__ITypographyStatics.SetVariants(element, value)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\FrameworkElement.ahk
#Include .\IContentPresenter.ahk
#Include .\IContentPresenter2.ahk
#Include .\IContentPresenter3.ahk
#Include .\IContentPresenter4.ahk
#Include .\IContentPresenter5.ahk
#Include .\IContentPresenterOverrides.ahk
#Include .\IContentPresenterStatics5.ahk
#Include .\IContentPresenterStatics.ahk
#Include .\IContentPresenterStatics3.ahk
#Include .\IContentPresenterStatics2.ahk
#Include .\IContentPresenterFactory.ahk
#Include .\IContentPresenterStatics4.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Displays the content of a [ContentControl](contentcontrol.md). Can also provide content presentation for non-controls. Provides a base class for specialized presenters such as [ScrollContentPresenter](scrollcontentpresenter.md).
 * @remarks
 * Typically, you use the ContentPresenter directly within the [ControlTemplate](controltemplate.md) of a [ContentControl](contentcontrol.md) to mark where the content to be presented appears.
 * 
 * A ContentPresenter is often used to apply characteristics to text content, which are set into a **Content** property using only a string for the text (or some indirect equivalent such as a [Binding](../windows.ui.xaml.data/binding.md) or a RESX resource). For this reason the properties of a ContentPresenter are similar to the properties of the [TextElement](../windows.ui.xaml.documents/textelement.md) class. (The [TextElement](../windows.ui.xaml.documents/textelement.md) class is a base class for several elements that aren't controls but are used to format the text that might appear in a control or layout container.)
 * 
 * A ContentPresenter can use a logic class to influence which template to use for templated data content at run-time. For more info, see the [ContentTemplateSelector](contentcontrol_contenttemplateselector.md) property.
 * 
 * If the ContentPresenter is in the [ControlTemplate](controltemplate.md) of a [ContentControl](contentcontrol.md), the ContentPresenter behavior will implicitly bind to the [ContentTemplate](contentcontrol_contenttemplate.md) and [Content](contentcontrol_content.md) properties of the templated [ContentControl](contentcontrol.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ContentPresenter extends FrameworkElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContentPresenter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContentPresenter.IID

    /**
     * Identifies the BackgroundSizing dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.backgroundsizingproperty
     * @type {DependencyProperty} 
     */
    static BackgroundSizingProperty {
        get => ContentPresenter.get_BackgroundSizingProperty()
    }

    /**
     * Identifies the [Content](contentpresenter_content.md) dependency property
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.contentproperty
     * @type {DependencyProperty} 
     */
    static ContentProperty {
        get => ContentPresenter.get_ContentProperty()
    }

    /**
     * Identifies the [ContentTemplate](contentpresenter_contenttemplate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.contenttemplateproperty
     * @type {DependencyProperty} 
     */
    static ContentTemplateProperty {
        get => ContentPresenter.get_ContentTemplateProperty()
    }

    /**
     * Identifies the [ContentTemplateSelector](contentpresenter_contenttemplateselector.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.contenttemplateselectorproperty
     * @type {DependencyProperty} 
     */
    static ContentTemplateSelectorProperty {
        get => ContentPresenter.get_ContentTemplateSelectorProperty()
    }

    /**
     * Identifies the [ContentTransitions](contentpresenter_contenttransitions.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.contenttransitionsproperty
     * @type {DependencyProperty} 
     */
    static ContentTransitionsProperty {
        get => ContentPresenter.get_ContentTransitionsProperty()
    }

    /**
     * Identifies the [FontSize](contentpresenter_fontsize.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.fontsizeproperty
     * @type {DependencyProperty} 
     */
    static FontSizeProperty {
        get => ContentPresenter.get_FontSizeProperty()
    }

    /**
     * Identifies the [FontFamily](contentpresenter_fontfamily.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.fontfamilyproperty
     * @type {DependencyProperty} 
     */
    static FontFamilyProperty {
        get => ContentPresenter.get_FontFamilyProperty()
    }

    /**
     * Identifies the [FontWeight](contentpresenter_fontweight.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.fontweightproperty
     * @type {DependencyProperty} 
     */
    static FontWeightProperty {
        get => ContentPresenter.get_FontWeightProperty()
    }

    /**
     * Identifies the [FontStyle](contentpresenter_fontstyle.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.fontstyleproperty
     * @type {DependencyProperty} 
     */
    static FontStyleProperty {
        get => ContentPresenter.get_FontStyleProperty()
    }

    /**
     * Identifies the [FontStretch](contentpresenter_fontstretch.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.fontstretchproperty
     * @type {DependencyProperty} 
     */
    static FontStretchProperty {
        get => ContentPresenter.get_FontStretchProperty()
    }

    /**
     * Identifies the [CharacterSpacing](contentpresenter_characterspacing.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.characterspacingproperty
     * @type {DependencyProperty} 
     */
    static CharacterSpacingProperty {
        get => ContentPresenter.get_CharacterSpacingProperty()
    }

    /**
     * Identifies the [Foreground](contentpresenter_foreground.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.foregroundproperty
     * @type {DependencyProperty} 
     */
    static ForegroundProperty {
        get => ContentPresenter.get_ForegroundProperty()
    }

    /**
     * Identifies the [IsTextScaleFactorEnabled](contentpresenter_istextscalefactorenabled.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.istextscalefactorenabledproperty
     * @type {DependencyProperty} 
     */
    static IsTextScaleFactorEnabledProperty {
        get => ContentPresenter.get_IsTextScaleFactorEnabledProperty()
    }

    /**
     * Identifies the [OpticalMarginAlignment](contentpresenter_opticalmarginalignment.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.opticalmarginalignmentproperty
     * @type {DependencyProperty} 
     */
    static OpticalMarginAlignmentProperty {
        get => ContentPresenter.get_OpticalMarginAlignmentProperty()
    }

    /**
     * Identifies the [TextLineBounds](contentpresenter_textlinebounds.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.textlineboundsproperty
     * @type {DependencyProperty} 
     */
    static TextLineBoundsProperty {
        get => ContentPresenter.get_TextLineBoundsProperty()
    }

    /**
     * Identifies the [TextWrapping](contentpresenter_textwrapping.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.textwrappingproperty
     * @type {DependencyProperty} 
     */
    static TextWrappingProperty {
        get => ContentPresenter.get_TextWrappingProperty()
    }

    /**
     * Identifies the [MaxLines](contentpresenter_maxlines.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.maxlinesproperty
     * @type {DependencyProperty} 
     */
    static MaxLinesProperty {
        get => ContentPresenter.get_MaxLinesProperty()
    }

    /**
     * Identifies the [LineStackingStrategy](contentpresenter_linestackingstrategy.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.linestackingstrategyproperty
     * @type {DependencyProperty} 
     */
    static LineStackingStrategyProperty {
        get => ContentPresenter.get_LineStackingStrategyProperty()
    }

    /**
     * Identifies the [LineHeight](contentpresenter_lineheight.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.lineheightproperty
     * @type {DependencyProperty} 
     */
    static LineHeightProperty {
        get => ContentPresenter.get_LineHeightProperty()
    }

    /**
     * Identifies the [BorderBrush](contentpresenter_borderbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.borderbrushproperty
     * @type {DependencyProperty} 
     */
    static BorderBrushProperty {
        get => ContentPresenter.get_BorderBrushProperty()
    }

    /**
     * Identifies the [BorderThickness](contentpresenter_borderthickness.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.borderthicknessproperty
     * @type {DependencyProperty} 
     */
    static BorderThicknessProperty {
        get => ContentPresenter.get_BorderThicknessProperty()
    }

    /**
     * Identifies the [CornerRadius](contentpresenter_cornerradius.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.cornerradiusproperty
     * @type {DependencyProperty} 
     */
    static CornerRadiusProperty {
        get => ContentPresenter.get_CornerRadiusProperty()
    }

    /**
     * Identifies the [Padding](contentpresenter_padding.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.paddingproperty
     * @type {DependencyProperty} 
     */
    static PaddingProperty {
        get => ContentPresenter.get_PaddingProperty()
    }

    /**
     * Identifies the [Background](contentpresenter_background.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.backgroundproperty
     * @type {DependencyProperty} 
     */
    static BackgroundProperty {
        get => ContentPresenter.get_BackgroundProperty()
    }

    /**
     * Identifies the [HorizontalContentAlignment](contentpresenter_horizontalcontentalignment.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.horizontalcontentalignmentproperty
     * @type {DependencyProperty} 
     */
    static HorizontalContentAlignmentProperty {
        get => ContentPresenter.get_HorizontalContentAlignmentProperty()
    }

    /**
     * Identifies the [VerticalContentAlignment](contentpresenter_verticalcontentalignment.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.verticalcontentalignmentproperty
     * @type {DependencyProperty} 
     */
    static VerticalContentAlignmentProperty {
        get => ContentPresenter.get_VerticalContentAlignmentProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BackgroundSizingProperty() {
        if (!ContentPresenter.HasProp("__IContentPresenterStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentPresenterStatics5.IID)
            ContentPresenter.__IContentPresenterStatics5 := IContentPresenterStatics5(factoryPtr)
        }

        return ContentPresenter.__IContentPresenterStatics5.get_BackgroundSizingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContentProperty() {
        if (!ContentPresenter.HasProp("__IContentPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentPresenterStatics.IID)
            ContentPresenter.__IContentPresenterStatics := IContentPresenterStatics(factoryPtr)
        }

        return ContentPresenter.__IContentPresenterStatics.get_ContentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContentTemplateProperty() {
        if (!ContentPresenter.HasProp("__IContentPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentPresenterStatics.IID)
            ContentPresenter.__IContentPresenterStatics := IContentPresenterStatics(factoryPtr)
        }

        return ContentPresenter.__IContentPresenterStatics.get_ContentTemplateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContentTemplateSelectorProperty() {
        if (!ContentPresenter.HasProp("__IContentPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentPresenterStatics.IID)
            ContentPresenter.__IContentPresenterStatics := IContentPresenterStatics(factoryPtr)
        }

        return ContentPresenter.__IContentPresenterStatics.get_ContentTemplateSelectorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContentTransitionsProperty() {
        if (!ContentPresenter.HasProp("__IContentPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentPresenterStatics.IID)
            ContentPresenter.__IContentPresenterStatics := IContentPresenterStatics(factoryPtr)
        }

        return ContentPresenter.__IContentPresenterStatics.get_ContentTransitionsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontSizeProperty() {
        if (!ContentPresenter.HasProp("__IContentPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentPresenterStatics.IID)
            ContentPresenter.__IContentPresenterStatics := IContentPresenterStatics(factoryPtr)
        }

        return ContentPresenter.__IContentPresenterStatics.get_FontSizeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontFamilyProperty() {
        if (!ContentPresenter.HasProp("__IContentPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentPresenterStatics.IID)
            ContentPresenter.__IContentPresenterStatics := IContentPresenterStatics(factoryPtr)
        }

        return ContentPresenter.__IContentPresenterStatics.get_FontFamilyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontWeightProperty() {
        if (!ContentPresenter.HasProp("__IContentPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentPresenterStatics.IID)
            ContentPresenter.__IContentPresenterStatics := IContentPresenterStatics(factoryPtr)
        }

        return ContentPresenter.__IContentPresenterStatics.get_FontWeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontStyleProperty() {
        if (!ContentPresenter.HasProp("__IContentPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentPresenterStatics.IID)
            ContentPresenter.__IContentPresenterStatics := IContentPresenterStatics(factoryPtr)
        }

        return ContentPresenter.__IContentPresenterStatics.get_FontStyleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FontStretchProperty() {
        if (!ContentPresenter.HasProp("__IContentPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentPresenterStatics.IID)
            ContentPresenter.__IContentPresenterStatics := IContentPresenterStatics(factoryPtr)
        }

        return ContentPresenter.__IContentPresenterStatics.get_FontStretchProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CharacterSpacingProperty() {
        if (!ContentPresenter.HasProp("__IContentPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentPresenterStatics.IID)
            ContentPresenter.__IContentPresenterStatics := IContentPresenterStatics(factoryPtr)
        }

        return ContentPresenter.__IContentPresenterStatics.get_CharacterSpacingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ForegroundProperty() {
        if (!ContentPresenter.HasProp("__IContentPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentPresenterStatics.IID)
            ContentPresenter.__IContentPresenterStatics := IContentPresenterStatics(factoryPtr)
        }

        return ContentPresenter.__IContentPresenterStatics.get_ForegroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsTextScaleFactorEnabledProperty() {
        if (!ContentPresenter.HasProp("__IContentPresenterStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentPresenterStatics3.IID)
            ContentPresenter.__IContentPresenterStatics3 := IContentPresenterStatics3(factoryPtr)
        }

        return ContentPresenter.__IContentPresenterStatics3.get_IsTextScaleFactorEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OpticalMarginAlignmentProperty() {
        if (!ContentPresenter.HasProp("__IContentPresenterStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentPresenterStatics2.IID)
            ContentPresenter.__IContentPresenterStatics2 := IContentPresenterStatics2(factoryPtr)
        }

        return ContentPresenter.__IContentPresenterStatics2.get_OpticalMarginAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextLineBoundsProperty() {
        if (!ContentPresenter.HasProp("__IContentPresenterStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentPresenterStatics2.IID)
            ContentPresenter.__IContentPresenterStatics2 := IContentPresenterStatics2(factoryPtr)
        }

        return ContentPresenter.__IContentPresenterStatics2.get_TextLineBoundsProperty()
    }

    /**
     * 
     * @returns {ContentPresenter} 
     */
    static CreateInstance() {
        if (!ContentPresenter.HasProp("__IContentPresenterFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentPresenterFactory.IID)
            ContentPresenter.__IContentPresenterFactory := IContentPresenterFactory(factoryPtr)
        }

        return ContentPresenter.__IContentPresenterFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextWrappingProperty() {
        if (!ContentPresenter.HasProp("__IContentPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentPresenterStatics4.IID)
            ContentPresenter.__IContentPresenterStatics4 := IContentPresenterStatics4(factoryPtr)
        }

        return ContentPresenter.__IContentPresenterStatics4.get_TextWrappingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MaxLinesProperty() {
        if (!ContentPresenter.HasProp("__IContentPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentPresenterStatics4.IID)
            ContentPresenter.__IContentPresenterStatics4 := IContentPresenterStatics4(factoryPtr)
        }

        return ContentPresenter.__IContentPresenterStatics4.get_MaxLinesProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LineStackingStrategyProperty() {
        if (!ContentPresenter.HasProp("__IContentPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentPresenterStatics4.IID)
            ContentPresenter.__IContentPresenterStatics4 := IContentPresenterStatics4(factoryPtr)
        }

        return ContentPresenter.__IContentPresenterStatics4.get_LineStackingStrategyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LineHeightProperty() {
        if (!ContentPresenter.HasProp("__IContentPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentPresenterStatics4.IID)
            ContentPresenter.__IContentPresenterStatics4 := IContentPresenterStatics4(factoryPtr)
        }

        return ContentPresenter.__IContentPresenterStatics4.get_LineHeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BorderBrushProperty() {
        if (!ContentPresenter.HasProp("__IContentPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentPresenterStatics4.IID)
            ContentPresenter.__IContentPresenterStatics4 := IContentPresenterStatics4(factoryPtr)
        }

        return ContentPresenter.__IContentPresenterStatics4.get_BorderBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BorderThicknessProperty() {
        if (!ContentPresenter.HasProp("__IContentPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentPresenterStatics4.IID)
            ContentPresenter.__IContentPresenterStatics4 := IContentPresenterStatics4(factoryPtr)
        }

        return ContentPresenter.__IContentPresenterStatics4.get_BorderThicknessProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CornerRadiusProperty() {
        if (!ContentPresenter.HasProp("__IContentPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentPresenterStatics4.IID)
            ContentPresenter.__IContentPresenterStatics4 := IContentPresenterStatics4(factoryPtr)
        }

        return ContentPresenter.__IContentPresenterStatics4.get_CornerRadiusProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PaddingProperty() {
        if (!ContentPresenter.HasProp("__IContentPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentPresenterStatics4.IID)
            ContentPresenter.__IContentPresenterStatics4 := IContentPresenterStatics4(factoryPtr)
        }

        return ContentPresenter.__IContentPresenterStatics4.get_PaddingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BackgroundProperty() {
        if (!ContentPresenter.HasProp("__IContentPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentPresenterStatics4.IID)
            ContentPresenter.__IContentPresenterStatics4 := IContentPresenterStatics4(factoryPtr)
        }

        return ContentPresenter.__IContentPresenterStatics4.get_BackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HorizontalContentAlignmentProperty() {
        if (!ContentPresenter.HasProp("__IContentPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentPresenterStatics4.IID)
            ContentPresenter.__IContentPresenterStatics4 := IContentPresenterStatics4(factoryPtr)
        }

        return ContentPresenter.__IContentPresenterStatics4.get_HorizontalContentAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_VerticalContentAlignmentProperty() {
        if (!ContentPresenter.HasProp("__IContentPresenterStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentPresenterStatics4.IID)
            ContentPresenter.__IContentPresenterStatics4 := IContentPresenterStatics4(factoryPtr)
        }

        return ContentPresenter.__IContentPresenterStatics4.get_VerticalContentAlignmentProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the data that is used to generate the child elements of a [ContentPresenter](contentpresenter.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.content
     * @type {IInspectable} 
     */
    Content {
        get => this.get_Content()
        set => this.put_Content(value)
    }

    /**
     * Gets or sets the template that is used to display the content of the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.contenttemplate
     * @type {DataTemplate} 
     */
    ContentTemplate {
        get => this.get_ContentTemplate()
        set => this.put_ContentTemplate(value)
    }

    /**
     * Gets or sets a selection object that changes the [DataTemplate](../windows.ui.xaml/datatemplate.md) to apply for content presented in the [ContentPresenter](contentpresenter.md), based on processing information about the content item or its container at run time.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.contenttemplateselector
     * @type {DataTemplateSelector} 
     */
    ContentTemplateSelector {
        get => this.get_ContentTemplateSelector()
        set => this.put_ContentTemplateSelector(value)
    }

    /**
     * Gets or sets the collection of [Transition](../windows.ui.xaml.media.animation/transition.md) style elements that apply to content presented by the [ContentPresenter](contentpresenter.md).
     * @remarks
     * > [!IMPORTANT]
     * > The XAML syntax for all properties that use a [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) value is unusual in that you must declare an explicit [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) object element as the value, and then provide object elements as child elements of [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) for each of the transition animations you want to use. For most other XAML collection properties you could omit the collection object element because it can be implicit, but properties that use [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) don't support the implicit collection usage. For more info on implicit collections and XAML, see [XAML syntax guide](/windows/uwp/xaml-platform/xaml-syntax-guide).
     * 
     * Transition animations play a particular role in UI design of your app. The basic idea is that when there is a change or transition, the animation draws the attention of the user to the change.
     * <!-- For more info, see  Transition animations and theme animations.-->
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.contenttransitions
     * @type {TransitionCollection} 
     */
    ContentTransitions {
        get => this.get_ContentTransitions()
        set => this.put_ContentTransitions(value)
    }

    /**
     * Gets or sets the font size for the text content presented by the [ContentPresenter](contentpresenter.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.fontsize
     * @type {Float} 
     */
    FontSize {
        get => this.get_FontSize()
        set => this.put_FontSize(value)
    }

    /**
     * Gets or sets the preferred top-level font family for the text content presented by the [ContentPresenter](contentpresenter.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.fontfamily
     * @type {FontFamily} 
     */
    FontFamily {
        get => this.get_FontFamily()
        set => this.put_FontFamily(value)
    }

    /**
     * Gets or sets the top-level font weight for the text content presented by the [ContentPresenter](contentpresenter.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.fontweight
     * @type {FontWeight} 
     */
    FontWeight {
        get => this.get_FontWeight()
        set => this.put_FontWeight(value)
    }

    /**
     * Gets or sets the font style for the presented content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.fontstyle
     * @type {Integer} 
     */
    FontStyle {
        get => this.get_FontStyle()
        set => this.put_FontStyle(value)
    }

    /**
     * Gets or sets the font stretch for the text content presented by the [ContentPresenter](contentpresenter.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.fontstretch
     * @type {Integer} 
     */
    FontStretch {
        get => this.get_FontStretch()
        set => this.put_FontStretch(value)
    }

    /**
     * Gets or sets the uniform spacing between characters, in units of 1/1000 of an em.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.characterspacing
     * @type {Integer} 
     */
    CharacterSpacing {
        get => this.get_CharacterSpacing()
        set => this.put_CharacterSpacing(value)
    }

    /**
     * Gets or sets the [Brush](../windows.ui.xaml.media/brush.md) to apply to the text content handled by the [ContentPresenter](contentpresenter.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.foreground
     * @type {Brush} 
     */
    Foreground {
        get => this.get_Foreground()
        set => this.put_Foreground(value)
    }

    /**
     * Get or sets a value that indicates how the font is modified to align with fonts of different sizes.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.opticalmarginalignment
     * @type {Integer} 
     */
    OpticalMarginAlignment {
        get => this.get_OpticalMarginAlignment()
        set => this.put_OpticalMarginAlignment(value)
    }

    /**
     * Gets or sets a value that indicates how the line box height is determined for each line of text displayed in the [ContentPresenter](contentpresenter.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.textlinebounds
     * @type {Integer} 
     */
    TextLineBounds {
        get => this.get_TextLineBounds()
        set => this.put_TextLineBounds(value)
    }

    /**
     * Gets or sets whether automatic text enlargement, to reflect the system text size setting, is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.istextscalefactorenabled
     * @type {Boolean} 
     */
    IsTextScaleFactorEnabled {
        get => this.get_IsTextScaleFactorEnabled()
        set => this.put_IsTextScaleFactorEnabled(value)
    }

    /**
     * Gets or sets how the element wraps text.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.textwrapping
     * @type {Integer} 
     */
    TextWrapping {
        get => this.get_TextWrapping()
        set => this.put_TextWrapping(value)
    }

    /**
     * Gets or sets the maximum lines of text shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.maxlines
     * @type {Integer} 
     */
    MaxLines {
        get => this.get_MaxLines()
        set => this.put_MaxLines(value)
    }

    /**
     * Gets or sets a value that indicates how a line box is determined for each line of text.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.linestackingstrategy
     * @type {Integer} 
     */
    LineStackingStrategy {
        get => this.get_LineStackingStrategy()
        set => this.put_LineStackingStrategy(value)
    }

    /**
     * Gets or sets the height of each line of text content presented by the [ContentPresenter](contentpresenter.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.lineheight
     * @type {Float} 
     */
    LineHeight {
        get => this.get_LineHeight()
        set => this.put_LineHeight(value)
    }

    /**
     * Gets or sets a brush that describes the border fill of the content presenter.
     * @remarks
     * The [BorderThickness](contentpresenter_borderthickness.md) value must be greater than 0 in order to see the BorderBrush value take effect.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.borderbrush
     * @type {Brush} 
     */
    BorderBrush {
        get => this.get_BorderBrush()
        set => this.put_BorderBrush(value)
    }

    /**
     * Gets or sets the border thickness of the content presenter.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.borderthickness
     * @type {Thickness} 
     */
    BorderThickness {
        get => this.get_BorderThickness()
        set => this.put_BorderThickness(value)
    }

    /**
     * Gets or sets the radius for the corners of the content presenter's border.
     * @remarks
     * Member components of a [CornerRadius](../windows.ui.xaml/cornerradius.md) value cannot be negative.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.cornerradius
     * @type {CornerRadius} 
     */
    CornerRadius {
        get => this.get_CornerRadius()
        set => this.put_CornerRadius(value)
    }

    /**
     * Gets or sets the distance between the border and its child object.
     * @remarks
     * A related property is [Margin](../windows.ui.xaml/frameworkelement_margin.md) (a property of [FrameworkElement](../windows.ui.xaml/frameworkelement.md)). For more info about the relationship between margin and padding, see [Alignment, margin, and padding](/windows/uwp/layout/alignment-margin-padding) or [Define layouts with XAML](/windows/uwp/layout/layouts-with-xaml).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.padding
     * @type {Thickness} 
     */
    Padding {
        get => this.get_Padding()
        set => this.put_Padding(value)
    }

    /**
     * Gets or sets the [Brush](../windows.ui.xaml.media/brush.md) to apply to the background of content handled by the [ContentPresenter](contentpresenter.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.background
     * @type {Brush} 
     */
    Background {
        get => this.get_Background()
        set => this.put_Background(value)
    }

    /**
     * Gets or sets the horizontal alignment of the content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.horizontalcontentalignment
     * @type {Integer} 
     */
    HorizontalContentAlignment {
        get => this.get_HorizontalContentAlignment()
        set => this.put_HorizontalContentAlignment(value)
    }

    /**
     * Gets or sets the vertical alignment of the content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.verticalcontentalignment
     * @type {Integer} 
     */
    VerticalContentAlignment {
        get => this.get_VerticalContentAlignment()
        set => this.put_VerticalContentAlignment(value)
    }

    /**
     * Gets or sets an instance of BrushTransition to automatically animate changes to the Background property.
     * @remarks
     * Use this property to animate any change to the [Background](contentpresenter_background.md) property. When a new value is set from code or through data binding, the change is animated from the old value to the new value, rather than happening instantaneously.  
     * 
     * Even though the transition animation takes time, the change to the actual property value is instantaneous. For example, if you change a property from code and then read it back, you’ll see the new value, even though the visual effect of the property change is somewhere between the new and the old.
     * 
     * If a property value changes a second time while the first change is still animating, the animation will use the currently animated value as the "starting" value for the next animation, and then animate to the new "final" value. The duration will be reset.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.backgroundtransition
     * @type {BrushTransition} 
     */
    BackgroundTransition {
        get => this.get_BackgroundTransition()
        set => this.put_BackgroundTransition(value)
    }

    /**
     * Gets or sets a value that indicates how far the background extends in relation to this element's border.
     * @remarks
     * You can set this property to **OuterBorderEdge** to make the element's background extend under the border. If the border is transparent, the background will show through it.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.backgroundsizing
     * @type {Integer} 
     */
    BackgroundSizing {
        get => this.get_BackgroundSizing()
        set => this.put_BackgroundSizing(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Content() {
        if (!this.HasProp("__IContentPresenter")) {
            if ((queryResult := this.QueryInterface(IContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter := IContentPresenter(outPtr)
        }

        return this.__IContentPresenter.get_Content()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Content(value) {
        if (!this.HasProp("__IContentPresenter")) {
            if ((queryResult := this.QueryInterface(IContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter := IContentPresenter(outPtr)
        }

        return this.__IContentPresenter.put_Content(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_ContentTemplate() {
        if (!this.HasProp("__IContentPresenter")) {
            if ((queryResult := this.QueryInterface(IContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter := IContentPresenter(outPtr)
        }

        return this.__IContentPresenter.get_ContentTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_ContentTemplate(value) {
        if (!this.HasProp("__IContentPresenter")) {
            if ((queryResult := this.QueryInterface(IContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter := IContentPresenter(outPtr)
        }

        return this.__IContentPresenter.put_ContentTemplate(value)
    }

    /**
     * 
     * @returns {DataTemplateSelector} 
     */
    get_ContentTemplateSelector() {
        if (!this.HasProp("__IContentPresenter")) {
            if ((queryResult := this.QueryInterface(IContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter := IContentPresenter(outPtr)
        }

        return this.__IContentPresenter.get_ContentTemplateSelector()
    }

    /**
     * 
     * @param {DataTemplateSelector} value 
     * @returns {HRESULT} 
     */
    put_ContentTemplateSelector(value) {
        if (!this.HasProp("__IContentPresenter")) {
            if ((queryResult := this.QueryInterface(IContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter := IContentPresenter(outPtr)
        }

        return this.__IContentPresenter.put_ContentTemplateSelector(value)
    }

    /**
     * 
     * @returns {TransitionCollection} 
     */
    get_ContentTransitions() {
        if (!this.HasProp("__IContentPresenter")) {
            if ((queryResult := this.QueryInterface(IContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter := IContentPresenter(outPtr)
        }

        return this.__IContentPresenter.get_ContentTransitions()
    }

    /**
     * 
     * @param {TransitionCollection} value 
     * @returns {HRESULT} 
     */
    put_ContentTransitions(value) {
        if (!this.HasProp("__IContentPresenter")) {
            if ((queryResult := this.QueryInterface(IContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter := IContentPresenter(outPtr)
        }

        return this.__IContentPresenter.put_ContentTransitions(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FontSize() {
        if (!this.HasProp("__IContentPresenter")) {
            if ((queryResult := this.QueryInterface(IContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter := IContentPresenter(outPtr)
        }

        return this.__IContentPresenter.get_FontSize()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_FontSize(value) {
        if (!this.HasProp("__IContentPresenter")) {
            if ((queryResult := this.QueryInterface(IContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter := IContentPresenter(outPtr)
        }

        return this.__IContentPresenter.put_FontSize(value)
    }

    /**
     * 
     * @returns {FontFamily} 
     */
    get_FontFamily() {
        if (!this.HasProp("__IContentPresenter")) {
            if ((queryResult := this.QueryInterface(IContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter := IContentPresenter(outPtr)
        }

        return this.__IContentPresenter.get_FontFamily()
    }

    /**
     * 
     * @param {FontFamily} value 
     * @returns {HRESULT} 
     */
    put_FontFamily(value) {
        if (!this.HasProp("__IContentPresenter")) {
            if ((queryResult := this.QueryInterface(IContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter := IContentPresenter(outPtr)
        }

        return this.__IContentPresenter.put_FontFamily(value)
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    get_FontWeight() {
        if (!this.HasProp("__IContentPresenter")) {
            if ((queryResult := this.QueryInterface(IContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter := IContentPresenter(outPtr)
        }

        return this.__IContentPresenter.get_FontWeight()
    }

    /**
     * 
     * @param {FontWeight} value 
     * @returns {HRESULT} 
     */
    put_FontWeight(value) {
        if (!this.HasProp("__IContentPresenter")) {
            if ((queryResult := this.QueryInterface(IContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter := IContentPresenter(outPtr)
        }

        return this.__IContentPresenter.put_FontWeight(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FontStyle() {
        if (!this.HasProp("__IContentPresenter")) {
            if ((queryResult := this.QueryInterface(IContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter := IContentPresenter(outPtr)
        }

        return this.__IContentPresenter.get_FontStyle()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FontStyle(value) {
        if (!this.HasProp("__IContentPresenter")) {
            if ((queryResult := this.QueryInterface(IContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter := IContentPresenter(outPtr)
        }

        return this.__IContentPresenter.put_FontStyle(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FontStretch() {
        if (!this.HasProp("__IContentPresenter")) {
            if ((queryResult := this.QueryInterface(IContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter := IContentPresenter(outPtr)
        }

        return this.__IContentPresenter.get_FontStretch()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FontStretch(value) {
        if (!this.HasProp("__IContentPresenter")) {
            if ((queryResult := this.QueryInterface(IContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter := IContentPresenter(outPtr)
        }

        return this.__IContentPresenter.put_FontStretch(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CharacterSpacing() {
        if (!this.HasProp("__IContentPresenter")) {
            if ((queryResult := this.QueryInterface(IContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter := IContentPresenter(outPtr)
        }

        return this.__IContentPresenter.get_CharacterSpacing()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CharacterSpacing(value) {
        if (!this.HasProp("__IContentPresenter")) {
            if ((queryResult := this.QueryInterface(IContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter := IContentPresenter(outPtr)
        }

        return this.__IContentPresenter.put_CharacterSpacing(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_Foreground() {
        if (!this.HasProp("__IContentPresenter")) {
            if ((queryResult := this.QueryInterface(IContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter := IContentPresenter(outPtr)
        }

        return this.__IContentPresenter.get_Foreground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_Foreground(value) {
        if (!this.HasProp("__IContentPresenter")) {
            if ((queryResult := this.QueryInterface(IContentPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter := IContentPresenter(outPtr)
        }

        return this.__IContentPresenter.put_Foreground(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OpticalMarginAlignment() {
        if (!this.HasProp("__IContentPresenter2")) {
            if ((queryResult := this.QueryInterface(IContentPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter2 := IContentPresenter2(outPtr)
        }

        return this.__IContentPresenter2.get_OpticalMarginAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OpticalMarginAlignment(value) {
        if (!this.HasProp("__IContentPresenter2")) {
            if ((queryResult := this.QueryInterface(IContentPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter2 := IContentPresenter2(outPtr)
        }

        return this.__IContentPresenter2.put_OpticalMarginAlignment(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextLineBounds() {
        if (!this.HasProp("__IContentPresenter2")) {
            if ((queryResult := this.QueryInterface(IContentPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter2 := IContentPresenter2(outPtr)
        }

        return this.__IContentPresenter2.get_TextLineBounds()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TextLineBounds(value) {
        if (!this.HasProp("__IContentPresenter2")) {
            if ((queryResult := this.QueryInterface(IContentPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter2 := IContentPresenter2(outPtr)
        }

        return this.__IContentPresenter2.put_TextLineBounds(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTextScaleFactorEnabled() {
        if (!this.HasProp("__IContentPresenter3")) {
            if ((queryResult := this.QueryInterface(IContentPresenter3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter3 := IContentPresenter3(outPtr)
        }

        return this.__IContentPresenter3.get_IsTextScaleFactorEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsTextScaleFactorEnabled(value) {
        if (!this.HasProp("__IContentPresenter3")) {
            if ((queryResult := this.QueryInterface(IContentPresenter3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter3 := IContentPresenter3(outPtr)
        }

        return this.__IContentPresenter3.put_IsTextScaleFactorEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextWrapping() {
        if (!this.HasProp("__IContentPresenter4")) {
            if ((queryResult := this.QueryInterface(IContentPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter4 := IContentPresenter4(outPtr)
        }

        return this.__IContentPresenter4.get_TextWrapping()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TextWrapping(value) {
        if (!this.HasProp("__IContentPresenter4")) {
            if ((queryResult := this.QueryInterface(IContentPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter4 := IContentPresenter4(outPtr)
        }

        return this.__IContentPresenter4.put_TextWrapping(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxLines() {
        if (!this.HasProp("__IContentPresenter4")) {
            if ((queryResult := this.QueryInterface(IContentPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter4 := IContentPresenter4(outPtr)
        }

        return this.__IContentPresenter4.get_MaxLines()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxLines(value) {
        if (!this.HasProp("__IContentPresenter4")) {
            if ((queryResult := this.QueryInterface(IContentPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter4 := IContentPresenter4(outPtr)
        }

        return this.__IContentPresenter4.put_MaxLines(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LineStackingStrategy() {
        if (!this.HasProp("__IContentPresenter4")) {
            if ((queryResult := this.QueryInterface(IContentPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter4 := IContentPresenter4(outPtr)
        }

        return this.__IContentPresenter4.get_LineStackingStrategy()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_LineStackingStrategy(value) {
        if (!this.HasProp("__IContentPresenter4")) {
            if ((queryResult := this.QueryInterface(IContentPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter4 := IContentPresenter4(outPtr)
        }

        return this.__IContentPresenter4.put_LineStackingStrategy(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LineHeight() {
        if (!this.HasProp("__IContentPresenter4")) {
            if ((queryResult := this.QueryInterface(IContentPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter4 := IContentPresenter4(outPtr)
        }

        return this.__IContentPresenter4.get_LineHeight()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_LineHeight(value) {
        if (!this.HasProp("__IContentPresenter4")) {
            if ((queryResult := this.QueryInterface(IContentPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter4 := IContentPresenter4(outPtr)
        }

        return this.__IContentPresenter4.put_LineHeight(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_BorderBrush() {
        if (!this.HasProp("__IContentPresenter4")) {
            if ((queryResult := this.QueryInterface(IContentPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter4 := IContentPresenter4(outPtr)
        }

        return this.__IContentPresenter4.get_BorderBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_BorderBrush(value) {
        if (!this.HasProp("__IContentPresenter4")) {
            if ((queryResult := this.QueryInterface(IContentPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter4 := IContentPresenter4(outPtr)
        }

        return this.__IContentPresenter4.put_BorderBrush(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_BorderThickness() {
        if (!this.HasProp("__IContentPresenter4")) {
            if ((queryResult := this.QueryInterface(IContentPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter4 := IContentPresenter4(outPtr)
        }

        return this.__IContentPresenter4.get_BorderThickness()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_BorderThickness(value) {
        if (!this.HasProp("__IContentPresenter4")) {
            if ((queryResult := this.QueryInterface(IContentPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter4 := IContentPresenter4(outPtr)
        }

        return this.__IContentPresenter4.put_BorderThickness(value)
    }

    /**
     * 
     * @returns {CornerRadius} 
     */
    get_CornerRadius() {
        if (!this.HasProp("__IContentPresenter4")) {
            if ((queryResult := this.QueryInterface(IContentPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter4 := IContentPresenter4(outPtr)
        }

        return this.__IContentPresenter4.get_CornerRadius()
    }

    /**
     * 
     * @param {CornerRadius} value 
     * @returns {HRESULT} 
     */
    put_CornerRadius(value) {
        if (!this.HasProp("__IContentPresenter4")) {
            if ((queryResult := this.QueryInterface(IContentPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter4 := IContentPresenter4(outPtr)
        }

        return this.__IContentPresenter4.put_CornerRadius(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_Padding() {
        if (!this.HasProp("__IContentPresenter4")) {
            if ((queryResult := this.QueryInterface(IContentPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter4 := IContentPresenter4(outPtr)
        }

        return this.__IContentPresenter4.get_Padding()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_Padding(value) {
        if (!this.HasProp("__IContentPresenter4")) {
            if ((queryResult := this.QueryInterface(IContentPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter4 := IContentPresenter4(outPtr)
        }

        return this.__IContentPresenter4.put_Padding(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_Background() {
        if (!this.HasProp("__IContentPresenter4")) {
            if ((queryResult := this.QueryInterface(IContentPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter4 := IContentPresenter4(outPtr)
        }

        return this.__IContentPresenter4.get_Background()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_Background(value) {
        if (!this.HasProp("__IContentPresenter4")) {
            if ((queryResult := this.QueryInterface(IContentPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter4 := IContentPresenter4(outPtr)
        }

        return this.__IContentPresenter4.put_Background(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HorizontalContentAlignment() {
        if (!this.HasProp("__IContentPresenter4")) {
            if ((queryResult := this.QueryInterface(IContentPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter4 := IContentPresenter4(outPtr)
        }

        return this.__IContentPresenter4.get_HorizontalContentAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HorizontalContentAlignment(value) {
        if (!this.HasProp("__IContentPresenter4")) {
            if ((queryResult := this.QueryInterface(IContentPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter4 := IContentPresenter4(outPtr)
        }

        return this.__IContentPresenter4.put_HorizontalContentAlignment(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VerticalContentAlignment() {
        if (!this.HasProp("__IContentPresenter4")) {
            if ((queryResult := this.QueryInterface(IContentPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter4 := IContentPresenter4(outPtr)
        }

        return this.__IContentPresenter4.get_VerticalContentAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_VerticalContentAlignment(value) {
        if (!this.HasProp("__IContentPresenter4")) {
            if ((queryResult := this.QueryInterface(IContentPresenter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter4 := IContentPresenter4(outPtr)
        }

        return this.__IContentPresenter4.put_VerticalContentAlignment(value)
    }

    /**
     * 
     * @returns {BrushTransition} 
     */
    get_BackgroundTransition() {
        if (!this.HasProp("__IContentPresenter5")) {
            if ((queryResult := this.QueryInterface(IContentPresenter5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter5 := IContentPresenter5(outPtr)
        }

        return this.__IContentPresenter5.get_BackgroundTransition()
    }

    /**
     * 
     * @param {BrushTransition} value 
     * @returns {HRESULT} 
     */
    put_BackgroundTransition(value) {
        if (!this.HasProp("__IContentPresenter5")) {
            if ((queryResult := this.QueryInterface(IContentPresenter5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter5 := IContentPresenter5(outPtr)
        }

        return this.__IContentPresenter5.put_BackgroundTransition(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BackgroundSizing() {
        if (!this.HasProp("__IContentPresenter5")) {
            if ((queryResult := this.QueryInterface(IContentPresenter5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter5 := IContentPresenter5(outPtr)
        }

        return this.__IContentPresenter5.get_BackgroundSizing()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_BackgroundSizing(value) {
        if (!this.HasProp("__IContentPresenter5")) {
            if ((queryResult := this.QueryInterface(IContentPresenter5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenter5 := IContentPresenter5(outPtr)
        }

        return this.__IContentPresenter5.put_BackgroundSizing(value)
    }

    /**
     * Invoked when the value of the [ContentTemplate](contentpresenter_contenttemplate.md) property changes.
     * @param {DataTemplate} oldContentTemplate The old value of the [ContentTemplate](contentpresenter_contenttemplate.md) property.
     * @param {DataTemplate} newContentTemplate The new value of the [ContentTemplate](contentpresenter_contenttemplate.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.oncontenttemplatechanged
     */
    OnContentTemplateChanged(oldContentTemplate, newContentTemplate) {
        if (!this.HasProp("__IContentPresenterOverrides")) {
            if ((queryResult := this.QueryInterface(IContentPresenterOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenterOverrides := IContentPresenterOverrides(outPtr)
        }

        return this.__IContentPresenterOverrides.OnContentTemplateChanged(oldContentTemplate, newContentTemplate)
    }

    /**
     * Invoked when the value of the [ContentTemplateSelector](contentpresenter_contenttemplateselector.md) property changes.
     * @remarks
     * Classes that derive from [ContentPresenter](contentpresenter.md) can override this method in order to perform any custom logic that should apply, in cases where the selector logic that automatically chooses the [DataTemplate](../windows.ui.xaml/datatemplate.md) based on context changes.
     * @param {DataTemplateSelector} oldContentTemplateSelector The old value of the [ContentTemplateSelector](contentpresenter_contenttemplateselector.md) property.
     * @param {DataTemplateSelector} newContentTemplateSelector The new value of the [ContentTemplateSelector](contentpresenter_contenttemplateselector.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentpresenter.oncontenttemplateselectorchanged
     */
    OnContentTemplateSelectorChanged(oldContentTemplateSelector, newContentTemplateSelector) {
        if (!this.HasProp("__IContentPresenterOverrides")) {
            if ((queryResult := this.QueryInterface(IContentPresenterOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPresenterOverrides := IContentPresenterOverrides(outPtr)
        }

        return this.__IContentPresenterOverrides.OnContentTemplateSelectorChanged(oldContentTemplateSelector, newContentTemplateSelector)
    }

;@endregion Instance Methods
}

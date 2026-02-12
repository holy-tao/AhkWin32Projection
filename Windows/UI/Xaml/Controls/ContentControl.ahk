#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\IContentControl.ahk
#Include .\IContentControl2.ahk
#Include .\IContentControlOverrides.ahk
#Include .\IContentControlFactory.ahk
#Include .\IContentControlStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a control with a single piece of content. Controls such as [Button](button.md), [CheckBox](checkbox.md), and [ScrollViewer](scrollviewer.md) directly or indirectly inherit from this class.
 * @remarks
 * The [Content](contentcontrol_content.md) property of a ContentControl can be any type of object, such as a string, a [UIElement](../windows.ui.xaml/uielement.md), or a [DateTime](/windows/desktop/api/windows.foundation/ns-windows-foundation-datetime). By default, when the [Content](contentcontrol_content.md) property is set to a [UIElement](../windows.ui.xaml/uielement.md), the [UIElement](../windows.ui.xaml/uielement.md) is displayed in the ContentControl. When [Content](contentcontrol_content.md) is set to another type of object, a string representation of the object is displayed in the ContentControl. A ContentControl has a limited default style. If you want to enhance the appearance of the control, you can create a new [DataTemplate](../windows.ui.xaml/datatemplate.md) and set it to the [ContentTemplate](contentcontrol_contenttemplate.md) property of the control.
 * 
 * A ContentControl can use a string as the value for its [Content](contentcontrol_content.md) property. However, whether a string is useful as content, and how it displays, is potentially handled differently by each control that derives from ContentControl. Specifically, the ability to display a content string is related to how a control uses a [ContentPresenter](contentpresenter.md) in its compositing. This behavior can also change by applying a custom control template to an existing control. Examples of content controls where string content displays by default include [Button](button.md) and related button controls. [Frame](frame.md) is an example of a ContentControl that does not display string content. If a ContentControl doesn't have a [ContentPresenter](contentpresenter.md) within it that has a [{TemplateBinding} markup extension](/windows/uwp/xaml-platform/templatebinding-markup-extension) for [ContentControl.Content](contentcontrol_content.md) to [ContentPresenter.Content](contentpresenter_content.md), then the value of [ContentControl.Content](contentcontrol_content.md) might not display anywhere.
 * 
 * Note that string content is specifically enabled only on ContentControl, not [Control](control.md). For example, [TextBox](textbox.md) does not support string content like this: `<TextBox>Initial text</TextBox>`, because it is not derived from ContentControl.
 * 
 * Rather than using a literal string, a ContentControl might use a reference to a string that is defined in a resource dictionary, or a binding. Either of these techniques can simplify the task of localizing the parts of the UI that are defined in Extensible Application Markup Language (XAML), by gathering the necessary string resources in one location rather than scattered throughout various Extensible Application Markup Language (XAML) files. Because apps usually need a way to maintain strings as resources for localization reasons or for general versatility, it is more common to not use string content, and to instead set [Content](contentcontrol_content.md) as an attribute, with a value that is a **{Binding}** or **{StaticResource}**.
 * 
 * Instead of text, a ContentControl might also display a single element for its own visual root, but using some container or panel so that there can be further UI compositing within. For example, if you really wanted to, you could declare a [StackPanel](stackpanel.md) for adaptive layout within a [Button](button.md) as its [Content](contentcontrol_content.md), and then the [Button](button.md) would appear to have multiple UI child elements that are children of the [StackPanel](stackpanel.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentcontrol
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ContentControl extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContentControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContentControl.IID

    /**
     * Identifies the [Content](contentcontrol_content.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentcontrol.contentproperty
     * @type {DependencyProperty} 
     */
    static ContentProperty {
        get => ContentControl.get_ContentProperty()
    }

    /**
     * Identifies the [ContentTemplate](contentcontrol_contenttemplate.md) dependency property
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentcontrol.contenttemplateproperty
     * @type {DependencyProperty} 
     */
    static ContentTemplateProperty {
        get => ContentControl.get_ContentTemplateProperty()
    }

    /**
     * Identifies the [ContentTemplateSelector](contentcontrol_contenttemplateselector.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentcontrol.contenttemplateselectorproperty
     * @type {DependencyProperty} 
     */
    static ContentTemplateSelectorProperty {
        get => ContentControl.get_ContentTemplateSelectorProperty()
    }

    /**
     * Identifies the [ContentTransitions](contentcontrol_contenttransitions.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentcontrol.contenttransitionsproperty
     * @type {DependencyProperty} 
     */
    static ContentTransitionsProperty {
        get => ContentControl.get_ContentTransitionsProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {ContentControl} 
     */
    static CreateInstance() {
        if (!ContentControl.HasProp("__IContentControlFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentControlFactory.IID)
            ContentControl.__IContentControlFactory := IContentControlFactory(factoryPtr)
        }

        return ContentControl.__IContentControlFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContentProperty() {
        if (!ContentControl.HasProp("__IContentControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentControlStatics.IID)
            ContentControl.__IContentControlStatics := IContentControlStatics(factoryPtr)
        }

        return ContentControl.__IContentControlStatics.get_ContentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContentTemplateProperty() {
        if (!ContentControl.HasProp("__IContentControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentControlStatics.IID)
            ContentControl.__IContentControlStatics := IContentControlStatics(factoryPtr)
        }

        return ContentControl.__IContentControlStatics.get_ContentTemplateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContentTemplateSelectorProperty() {
        if (!ContentControl.HasProp("__IContentControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentControlStatics.IID)
            ContentControl.__IContentControlStatics := IContentControlStatics(factoryPtr)
        }

        return ContentControl.__IContentControlStatics.get_ContentTemplateSelectorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContentTransitionsProperty() {
        if (!ContentControl.HasProp("__IContentControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentControlStatics.IID)
            ContentControl.__IContentControlStatics := IContentControlStatics(factoryPtr)
        }

        return ContentControl.__IContentControlStatics.get_ContentTransitionsProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the content of a [ContentControl](contentcontrol.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentcontrol.content
     * @type {IInspectable} 
     */
    Content {
        get => this.get_Content()
        set => this.put_Content(value)
    }

    /**
     * Gets or sets the data template that is used to display the content of the [ContentControl](contentcontrol.md).
     * @remarks
     * Instead of declaring a fixed [DataTemplate](../windows.ui.xaml/datatemplate.md), you can also implement a [DataTemplateSelector](datatemplateselector.md) and use it to set the [ContentTemplateSelector](contentcontrol_contenttemplateselector.md) property. This technique enables custom template switching based on input data, at the application level. For more information, see [DataTemplateSelector](datatemplateselector.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentcontrol.contenttemplate
     * @type {DataTemplate} 
     */
    ContentTemplate {
        get => this.get_ContentTemplate()
        set => this.put_ContentTemplate(value)
    }

    /**
     * Gets or sets a selection object that changes the [DataTemplate](../windows.ui.xaml/datatemplate.md) to apply for content, based on processing information about the content item or its container at run time.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentcontrol.contenttemplateselector
     * @type {DataTemplateSelector} 
     */
    ContentTemplateSelector {
        get => this.get_ContentTemplateSelector()
        set => this.put_ContentTemplateSelector(value)
    }

    /**
     * Gets or sets the collection of [Transition](../windows.ui.xaml.media.animation/transition.md) style elements that apply to the content of a [ContentControl](contentcontrol.md).
     * @remarks
     * > [!NOTE]
     * > Prior to Windows 10, version 1809 (SDK 17763), the XAML syntax for properties that have a [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) value requires that you declare an explicit [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) object element as the value, and then provide object elements as child elements of [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) for each of the transition animations you want to use. In Windows 10, version 1809 (SDK 17763) or later, [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) supports the implicit collection usage, so you can omit the collection object element. For more info on implicit collections and XAML, see [XAML syntax guide](/windows/uwp/xaml-platform/xaml-syntax-guide).
     * 
     * Transition animations play a particular role in UI design of your app. The basic idea is that when there is a change or transition, the animation draws the attention of the user to the change.
     * <!-- For more info, see  Transition animations and theme animations.-->
     * It's not common to set the value of the ContentTransitions property directly on a [ContentControl](contentcontrol.md) type that is a direct element of app UI. It's more common to have a transitions collection be a part of a visual state, template or style. In this case you use mechanisms such as [Setter](../windows.ui.xaml/setter.md) of a [Style](../windows.ui.xaml/style.md) to specify the ContentTransitionsproperty. Styles are typically stored as a XAML resource.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentcontrol.contenttransitions
     * @type {TransitionCollection} 
     */
    ContentTransitions {
        get => this.get_ContentTransitions()
        set => this.put_ContentTransitions(value)
    }

    /**
     * Gets the root element of the data template specified by the [ContentTemplate](contentcontrol_contenttemplate.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentcontrol.contenttemplateroot
     * @type {UIElement} 
     */
    ContentTemplateRoot {
        get => this.get_ContentTemplateRoot()
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
        if (!this.HasProp("__IContentControl")) {
            if ((queryResult := this.QueryInterface(IContentControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentControl := IContentControl(outPtr)
        }

        return this.__IContentControl.get_Content()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Content(value) {
        if (!this.HasProp("__IContentControl")) {
            if ((queryResult := this.QueryInterface(IContentControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentControl := IContentControl(outPtr)
        }

        return this.__IContentControl.put_Content(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_ContentTemplate() {
        if (!this.HasProp("__IContentControl")) {
            if ((queryResult := this.QueryInterface(IContentControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentControl := IContentControl(outPtr)
        }

        return this.__IContentControl.get_ContentTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_ContentTemplate(value) {
        if (!this.HasProp("__IContentControl")) {
            if ((queryResult := this.QueryInterface(IContentControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentControl := IContentControl(outPtr)
        }

        return this.__IContentControl.put_ContentTemplate(value)
    }

    /**
     * 
     * @returns {DataTemplateSelector} 
     */
    get_ContentTemplateSelector() {
        if (!this.HasProp("__IContentControl")) {
            if ((queryResult := this.QueryInterface(IContentControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentControl := IContentControl(outPtr)
        }

        return this.__IContentControl.get_ContentTemplateSelector()
    }

    /**
     * 
     * @param {DataTemplateSelector} value 
     * @returns {HRESULT} 
     */
    put_ContentTemplateSelector(value) {
        if (!this.HasProp("__IContentControl")) {
            if ((queryResult := this.QueryInterface(IContentControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentControl := IContentControl(outPtr)
        }

        return this.__IContentControl.put_ContentTemplateSelector(value)
    }

    /**
     * 
     * @returns {TransitionCollection} 
     */
    get_ContentTransitions() {
        if (!this.HasProp("__IContentControl")) {
            if ((queryResult := this.QueryInterface(IContentControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentControl := IContentControl(outPtr)
        }

        return this.__IContentControl.get_ContentTransitions()
    }

    /**
     * 
     * @param {TransitionCollection} value 
     * @returns {HRESULT} 
     */
    put_ContentTransitions(value) {
        if (!this.HasProp("__IContentControl")) {
            if ((queryResult := this.QueryInterface(IContentControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentControl := IContentControl(outPtr)
        }

        return this.__IContentControl.put_ContentTransitions(value)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_ContentTemplateRoot() {
        if (!this.HasProp("__IContentControl2")) {
            if ((queryResult := this.QueryInterface(IContentControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentControl2 := IContentControl2(outPtr)
        }

        return this.__IContentControl2.get_ContentTemplateRoot()
    }

    /**
     * Invoked when the value of the [Content](contentcontrol_content.md) property changes.
     * @remarks
     * If a value for [ContentTemplateSelector](contentcontrol_contenttemplateselector.md) exists, then the default implementation calls [SelectTemplate](datatemplateselector_selecttemplate_375443783.md) on the implemented [DataTemplateSelector](datatemplateselector.md), passing the *newContent* value as *item*, and the calling [ContentControl](contentcontrol.md) as *container*. The return value then sets [ContentTemplate](contentcontrol_contenttemplate.md) automatically on the caller.
     * @param {IInspectable} oldContent The old value of the [Content](contentcontrol_content.md) property.
     * @param {IInspectable} newContent The new value of the [Content](contentcontrol_content.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentcontrol.oncontentchanged
     */
    OnContentChanged(oldContent, newContent) {
        if (!this.HasProp("__IContentControlOverrides")) {
            if ((queryResult := this.QueryInterface(IContentControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentControlOverrides := IContentControlOverrides(outPtr)
        }

        return this.__IContentControlOverrides.OnContentChanged(oldContent, newContent)
    }

    /**
     * Invoked when the value of the [ContentTemplate](contentcontrol_contenttemplate.md) property changes.
     * @remarks
     * Classes that derive from [ContentControl](contentcontrol.md) can override this method in order to perform any custom logic that should apply, in cases where the [DataTemplate](../windows.ui.xaml/datatemplate.md) that presents the content changes.
     * <!-- TODO: does this fire when the selector does it? Would guess yes. Find an implementation.-->
     * @param {DataTemplate} oldContentTemplate The old value of the [ContentTemplate](contentcontrol_contenttemplate.md) property.
     * @param {DataTemplate} newContentTemplate The new value of the [ContentTemplate](contentcontrol_contenttemplate.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentcontrol.oncontenttemplatechanged
     */
    OnContentTemplateChanged(oldContentTemplate, newContentTemplate) {
        if (!this.HasProp("__IContentControlOverrides")) {
            if ((queryResult := this.QueryInterface(IContentControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentControlOverrides := IContentControlOverrides(outPtr)
        }

        return this.__IContentControlOverrides.OnContentTemplateChanged(oldContentTemplate, newContentTemplate)
    }

    /**
     * Invoked when the value of the [ContentTemplateSelector](contentcontrol_contenttemplateselector.md) property changes.
     * @remarks
     * Classes that derive from [ContentControl](contentcontrol.md) can override this method in order to perform any custom logic that should apply, in cases where the selector logic that automatically chooses the [DataTemplate](../windows.ui.xaml/datatemplate.md) based on context changes.
     * @param {DataTemplateSelector} oldContentTemplateSelector The old value of the [ContentTemplateSelector](contentcontrol_contenttemplateselector.md) property.
     * @param {DataTemplateSelector} newContentTemplateSelector The new value of the [ContentTemplateSelector](contentcontrol_contenttemplateselector.md) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentcontrol.oncontenttemplateselectorchanged
     */
    OnContentTemplateSelectorChanged(oldContentTemplateSelector, newContentTemplateSelector) {
        if (!this.HasProp("__IContentControlOverrides")) {
            if ((queryResult := this.QueryInterface(IContentControlOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentControlOverrides := IContentControlOverrides(outPtr)
        }

        return this.__IContentControlOverrides.OnContentTemplateSelectorChanged(oldContentTemplateSelector, newContentTemplateSelector)
    }

;@endregion Instance Methods
}

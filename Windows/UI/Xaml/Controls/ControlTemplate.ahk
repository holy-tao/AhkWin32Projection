#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\FrameworkTemplate.ahk
#Include .\IControlTemplate.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Defines the element tree that is used as the control template for a control.
 * @remarks
 * For more info and examples, see [XAML control templates](/windows/uwp/controls-and-patterns/control-templates).
 * 
 * ControlTemplate is used as the value of the [Control.Template](control_template.md) property, which defines the visuals of a control by applying the template. You almost always define a ControlTemplate as a XAML resource, using an implicit key [TargetType](../windows.ui.xaml/style_targettype.md) that is the same as a [Style](../windows.ui.xaml/style.md) that sets [Control.Template](control_template.md) with a [Setter](../windows.ui.xaml/setter.md). You rarely if ever assign a value for [Control.Template](control_template.md) directly on a control instance.
 * 
 * There are really only two properties you use when defining a ControlTemplate: the [TargetType](controltemplate_targettype.md), and the implicit XAML content. ControlTemplate inherits the implicit XAML content behavior from its [FrameworkTemplate](../windows.ui.xaml/frameworktemplate.md) parent. Basically the element contained within a ControlTemplate as defined in XAML is assigning a root element for a further structure of XAML elements that define the template. This is setting a "Template" property that can't subsequently be examined by code and only has meaning for how the XAML parser assigns content for controls based on applying that template.
 * 
 * To have its content be set from a ControlTemplate, a control element must be a true [Control](control.md) subclass, so that it has the [Control.Template](control_template.md) property. There are other cases where templates apply content but this usually involves one of the other [FrameworkTemplate](../windows.ui.xaml/frameworktemplate.md) derived template classes ([DataTemplate](../windows.ui.xaml/datatemplate.md) or [ItemsPanelTemplate](itemspaneltemplate.md)).
 * 
 * Control templates provide the visuals and parts that make up an instance of a control as it appears in an app's UI. At run time, the template has already been applied, and so all the parts that were created out of the template are now truly parts of the control, and can be accessed by techniques such as examining the XAML namescopes from within control content or using the [VisualTreeHelper](../windows.ui.xaml.media/visualtreehelper.md) class. Events such as the input events sometimes expose the parts of a control that came from the applied control template.
 * 
 * There are ways to access template-defined content either before or after the template is applied to a specific control instance; see [OnApplyTemplate](../windows.ui.xaml/frameworkelement_onapplytemplate_1955470198.md) or [GetTemplateChild](control_gettemplatechild_501346084.md).
 * 
 * The actual point in time that a ControlTemplate is applied to a control instance can be detected because this invokes the [OnApplyTemplate](../windows.ui.xaml/frameworkelement_onapplytemplate_1955470198.md) protected virtual method. So long as the control isn't sealed, you can subclass a control so that you have the opportunity to override [OnApplyTemplate](../windows.ui.xaml/frameworkelement_onapplytemplate_1955470198.md). This override can be written to perform actions that wouldn't be possible prior to the template being applied. For example, you can wire event handlers to control parts, or set control properties to reference object parts that were created out of the template but didn't start with a [{TemplateBinding} markup extension](/windows/uwp/xaml-platform/templatebinding-markup-extension) value.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.controltemplate
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ControlTemplate extends FrameworkTemplate {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IControlTemplate

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IControlTemplate.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the type to which the [ControlTemplate](controltemplate.md) is applied.
     * @remarks
     * The typical way to specify a TargetType value is through a XAML attribute on the [ControlTemplate](controltemplate.md). When set in XAML, the meaning of TargetType and the values you provide take on some aspects of how types are represented in XAML. In particular, any prefixes that would be necessary to refer to a given type as a XAML element should also be included as the value of the TargetType value string. For example, if a template is intended to target a custom type that must be preceded by the already-mapped prefix "local" in a particular markup scope, then the TargetType value should include that same prefix. This behavior is enabled by built-in conversion behavior in the Windows Runtime XAML parser.
     * 
     * In most cases, you will be setting the TargetType for a [ControlTemplate](controltemplate.md) where that [ControlTemplate](controltemplate.md) is within a [Setter](../windows.ui.xaml/setter.md) for the [Template](control_template.md) property. This in turn is within the implicit [Style](../windows.ui.xaml/style.md) you are defining for a control. The ControlTemplate.TargetType value and the [Style.TargetType](../windows.ui.xaml/style_targettype.md) value of the containing [Style](../windows.ui.xaml/style.md) should always be the same type reference, referring to the same implicitly named control. Otherwise the control template might not work.
     * 
     * For more info on how to write a control template, see [Quickstart: Control templates](/previous-versions/windows/apps/hh465374(v=win.10)).
     * 
     * > [!NOTE]
     * > If you have previously programmed XAML for Windows Presentation Foundation (WPF), then you might have used an **x:Type** markup extension to fill in any XAML values that take a [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true). The Windows Runtime XAML parser does not support **x:Type**. Instead, you should refer to the type by name without using any markup extension, and any necessary XAML-to-backing type conversion is already handled by the built-in conversion behavior described in the previous paragraph.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.controltemplate.targettype
     * @type {TypeName} 
     */
    TargetType {
        get => this.get_TargetType()
        set => this.put_TargetType(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ControlTemplate](controltemplate.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ControlTemplate")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {TypeName} 
     */
    get_TargetType() {
        if (!this.HasProp("__IControlTemplate")) {
            if ((queryResult := this.QueryInterface(IControlTemplate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlTemplate := IControlTemplate(outPtr)
        }

        return this.__IControlTemplate.get_TargetType()
    }

    /**
     * 
     * @param {TypeName} value 
     * @returns {HRESULT} 
     */
    put_TargetType(value) {
        if (!this.HasProp("__IControlTemplate")) {
            if ((queryResult := this.QueryInterface(IControlTemplate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlTemplate := IControlTemplate(outPtr)
        }

        return this.__IControlTemplate.put_TargetType(value)
    }

;@endregion Instance Methods
}

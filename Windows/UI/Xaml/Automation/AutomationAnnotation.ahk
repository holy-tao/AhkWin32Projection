#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\IAutomationAnnotation.ahk
#Include .\IAutomationAnnotationStatics.ahk
#Include .\IAutomationAnnotationFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a single UI automation annotation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationannotation
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class AutomationAnnotation extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAutomationAnnotation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAutomationAnnotation.IID

    /**
     * Gets the identifier of the  property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationannotation.typeproperty
     * @type {DependencyProperty} 
     */
    static TypeProperty {
        get => AutomationAnnotation.get_TypeProperty()
    }

    /**
     * Gets the identifier of the  property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationannotation.elementproperty
     * @type {DependencyProperty} 
     */
    static ElementProperty {
        get => AutomationAnnotation.get_ElementProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TypeProperty() {
        if (!AutomationAnnotation.HasProp("__IAutomationAnnotationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationAnnotation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationAnnotationStatics.IID)
            AutomationAnnotation.__IAutomationAnnotationStatics := IAutomationAnnotationStatics(factoryPtr)
        }

        return AutomationAnnotation.__IAutomationAnnotationStatics.get_TypeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ElementProperty() {
        if (!AutomationAnnotation.HasProp("__IAutomationAnnotationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationAnnotation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationAnnotationStatics.IID)
            AutomationAnnotation.__IAutomationAnnotationStatics := IAutomationAnnotationStatics(factoryPtr)
        }

        return AutomationAnnotation.__IAutomationAnnotationStatics.get_ElementProperty()
    }

    /**
     * Initializes a new instance of the  class using the supplied parameters.
     * @param {Integer} type Specifies the type of the annotation.
     * @returns {AutomationAnnotation} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationannotation.#ctor
     */
    static CreateInstance(type) {
        if (!AutomationAnnotation.HasProp("__IAutomationAnnotationFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationAnnotation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationAnnotationFactory.IID)
            AutomationAnnotation.__IAutomationAnnotationFactory := IAutomationAnnotationFactory(factoryPtr)
        }

        return AutomationAnnotation.__IAutomationAnnotationFactory.CreateInstance(type)
    }

    /**
     * Initializes a new instance of the  class using the supplied parameters.
     * @param {Integer} type Specifies the type of the annotation.
     * @param {UIElement} element Specifies the element that implements the annotation.
     * @returns {AutomationAnnotation} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationannotation.#ctor
     */
    static CreateWithElementParameter(type, element) {
        if (!AutomationAnnotation.HasProp("__IAutomationAnnotationFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationAnnotation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationAnnotationFactory.IID)
            AutomationAnnotation.__IAutomationAnnotationFactory := IAutomationAnnotationFactory(factoryPtr)
        }

        return AutomationAnnotation.__IAutomationAnnotationFactory.CreateWithElementParameter(type, element)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the type of the annotation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationannotation.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
        set => this.put_Type(value)
    }

    /**
     * Gets or sets the element that implements the annotation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationannotation.element
     * @type {UIElement} 
     */
    Element {
        get => this.get_Element()
        set => this.put_Element(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the  class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.AutomationAnnotation")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        if (!this.HasProp("__IAutomationAnnotation")) {
            if ((queryResult := this.QueryInterface(IAutomationAnnotation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationAnnotation := IAutomationAnnotation(outPtr)
        }

        return this.__IAutomationAnnotation.get_Type()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Type(value) {
        if (!this.HasProp("__IAutomationAnnotation")) {
            if ((queryResult := this.QueryInterface(IAutomationAnnotation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationAnnotation := IAutomationAnnotation(outPtr)
        }

        return this.__IAutomationAnnotation.put_Type(value)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Element() {
        if (!this.HasProp("__IAutomationAnnotation")) {
            if ((queryResult := this.QueryInterface(IAutomationAnnotation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationAnnotation := IAutomationAnnotation(outPtr)
        }

        return this.__IAutomationAnnotation.get_Element()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_Element(value) {
        if (!this.HasProp("__IAutomationAnnotation")) {
            if ((queryResult := this.QueryInterface(IAutomationAnnotation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationAnnotation := IAutomationAnnotation(outPtr)
        }

        return this.__IAutomationAnnotation.put_Element(value)
    }

;@endregion Instance Methods
}

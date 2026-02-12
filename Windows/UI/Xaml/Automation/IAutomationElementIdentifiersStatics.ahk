#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AutomationProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class IAutomationElementIdentifiersStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomationElementIdentifiersStatics
     * @type {Guid}
     */
    static IID => Guid("{4549399f-8340-4d67-b9bf-8c2ac6a0773a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AcceleratorKeyProperty", "get_AccessKeyProperty", "get_AutomationIdProperty", "get_BoundingRectangleProperty", "get_ClassNameProperty", "get_ClickablePointProperty", "get_ControlTypeProperty", "get_HasKeyboardFocusProperty", "get_HelpTextProperty", "get_IsContentElementProperty", "get_IsControlElementProperty", "get_IsEnabledProperty", "get_IsKeyboardFocusableProperty", "get_IsOffscreenProperty", "get_IsPasswordProperty", "get_IsRequiredForFormProperty", "get_ItemStatusProperty", "get_ItemTypeProperty", "get_LabeledByProperty", "get_LocalizedControlTypeProperty", "get_NameProperty", "get_OrientationProperty", "get_LiveSettingProperty"]

    /**
     * @type {AutomationProperty} 
     */
    AcceleratorKeyProperty {
        get => this.get_AcceleratorKeyProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    AccessKeyProperty {
        get => this.get_AccessKeyProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    AutomationIdProperty {
        get => this.get_AutomationIdProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    BoundingRectangleProperty {
        get => this.get_BoundingRectangleProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    ClassNameProperty {
        get => this.get_ClassNameProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    ClickablePointProperty {
        get => this.get_ClickablePointProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    ControlTypeProperty {
        get => this.get_ControlTypeProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    HasKeyboardFocusProperty {
        get => this.get_HasKeyboardFocusProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    HelpTextProperty {
        get => this.get_HelpTextProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    IsContentElementProperty {
        get => this.get_IsContentElementProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    IsControlElementProperty {
        get => this.get_IsControlElementProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    IsEnabledProperty {
        get => this.get_IsEnabledProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    IsKeyboardFocusableProperty {
        get => this.get_IsKeyboardFocusableProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    IsOffscreenProperty {
        get => this.get_IsOffscreenProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    IsPasswordProperty {
        get => this.get_IsPasswordProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    IsRequiredForFormProperty {
        get => this.get_IsRequiredForFormProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    ItemStatusProperty {
        get => this.get_ItemStatusProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    ItemTypeProperty {
        get => this.get_ItemTypeProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    LabeledByProperty {
        get => this.get_LabeledByProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    LocalizedControlTypeProperty {
        get => this.get_LocalizedControlTypeProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    NameProperty {
        get => this.get_NameProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    OrientationProperty {
        get => this.get_OrientationProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    LiveSettingProperty {
        get => this.get_LiveSettingProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_AcceleratorKeyProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_AccessKeyProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_AutomationIdProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_BoundingRectangleProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_ClassNameProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_ClickablePointProperty() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_ControlTypeProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_HasKeyboardFocusProperty() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_HelpTextProperty() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_IsContentElementProperty() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_IsControlElementProperty() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_IsEnabledProperty() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_IsKeyboardFocusableProperty() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_IsOffscreenProperty() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_IsPasswordProperty() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_IsRequiredForFormProperty() {
        result := ComCall(21, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_ItemStatusProperty() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_ItemTypeProperty() {
        result := ComCall(23, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_LabeledByProperty() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_LocalizedControlTypeProperty() {
        result := ComCall(25, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_NameProperty() {
        result := ComCall(26, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_OrientationProperty() {
        result := ComCall(27, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_LiveSettingProperty() {
        result := ComCall(28, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }
}

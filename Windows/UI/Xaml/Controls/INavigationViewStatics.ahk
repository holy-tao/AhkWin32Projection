#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class INavigationViewStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INavigationViewStatics
     * @type {Guid}
     */
    static IID => Guid("{363a86c7-72da-4420-b871-15d9d0d45756}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsPaneOpenProperty", "get_CompactModeThresholdWidthProperty", "get_ExpandedModeThresholdWidthProperty", "get_PaneFooterProperty", "get_HeaderProperty", "get_HeaderTemplateProperty", "get_DisplayModeProperty", "get_IsSettingsVisibleProperty", "get_IsPaneToggleButtonVisibleProperty", "get_AlwaysShowHeaderProperty", "get_CompactPaneLengthProperty", "get_OpenPaneLengthProperty", "get_PaneToggleButtonStyleProperty", "get_MenuItemsProperty", "get_MenuItemsSourceProperty", "get_SelectedItemProperty", "get_SettingsItemProperty", "get_AutoSuggestBoxProperty", "get_MenuItemTemplateProperty", "get_MenuItemTemplateSelectorProperty", "get_MenuItemContainerStyleProperty", "get_MenuItemContainerStyleSelectorProperty"]

    /**
     * @type {DependencyProperty} 
     */
    IsPaneOpenProperty {
        get => this.get_IsPaneOpenProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CompactModeThresholdWidthProperty {
        get => this.get_CompactModeThresholdWidthProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ExpandedModeThresholdWidthProperty {
        get => this.get_ExpandedModeThresholdWidthProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PaneFooterProperty {
        get => this.get_PaneFooterProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HeaderProperty {
        get => this.get_HeaderProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HeaderTemplateProperty {
        get => this.get_HeaderTemplateProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DisplayModeProperty {
        get => this.get_DisplayModeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsSettingsVisibleProperty {
        get => this.get_IsSettingsVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsPaneToggleButtonVisibleProperty {
        get => this.get_IsPaneToggleButtonVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AlwaysShowHeaderProperty {
        get => this.get_AlwaysShowHeaderProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CompactPaneLengthProperty {
        get => this.get_CompactPaneLengthProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    OpenPaneLengthProperty {
        get => this.get_OpenPaneLengthProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PaneToggleButtonStyleProperty {
        get => this.get_PaneToggleButtonStyleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MenuItemsProperty {
        get => this.get_MenuItemsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MenuItemsSourceProperty {
        get => this.get_MenuItemsSourceProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectedItemProperty {
        get => this.get_SelectedItemProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SettingsItemProperty {
        get => this.get_SettingsItemProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AutoSuggestBoxProperty {
        get => this.get_AutoSuggestBoxProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MenuItemTemplateProperty {
        get => this.get_MenuItemTemplateProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MenuItemTemplateSelectorProperty {
        get => this.get_MenuItemTemplateSelectorProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MenuItemContainerStyleProperty {
        get => this.get_MenuItemContainerStyleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MenuItemContainerStyleSelectorProperty {
        get => this.get_MenuItemContainerStyleSelectorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsPaneOpenProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CompactModeThresholdWidthProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ExpandedModeThresholdWidthProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_PaneFooterProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_HeaderProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_HeaderTemplateProperty() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DisplayModeProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsSettingsVisibleProperty() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsPaneToggleButtonVisibleProperty() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AlwaysShowHeaderProperty() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CompactPaneLengthProperty() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_OpenPaneLengthProperty() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_PaneToggleButtonStyleProperty() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MenuItemsProperty() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MenuItemsSourceProperty() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SelectedItemProperty() {
        result := ComCall(21, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SettingsItemProperty() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AutoSuggestBoxProperty() {
        result := ComCall(23, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MenuItemTemplateProperty() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MenuItemTemplateSelectorProperty() {
        result := ComCall(25, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MenuItemContainerStyleProperty() {
        result := ComCall(26, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MenuItemContainerStyleSelectorProperty() {
        result := ComCall(27, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

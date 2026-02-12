#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\UIElement.ahk
#Include ..\DataTemplate.ahk
#Include ..\Style.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\AutoSuggestBox.ahk
#Include .\DataTemplateSelector.ahk
#Include .\StyleSelector.ahk
#Include ..\DependencyObject.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class INavigationView extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INavigationView
     * @type {Guid}
     */
    static IID => Guid("{f209ce15-391a-42ca-9fc6-f79da65aca32}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsPaneOpen", "put_IsPaneOpen", "get_CompactModeThresholdWidth", "put_CompactModeThresholdWidth", "get_ExpandedModeThresholdWidth", "put_ExpandedModeThresholdWidth", "get_PaneFooter", "put_PaneFooter", "get_Header", "put_Header", "get_HeaderTemplate", "put_HeaderTemplate", "get_DisplayMode", "get_IsSettingsVisible", "put_IsSettingsVisible", "get_IsPaneToggleButtonVisible", "put_IsPaneToggleButtonVisible", "get_AlwaysShowHeader", "put_AlwaysShowHeader", "get_CompactPaneLength", "put_CompactPaneLength", "get_OpenPaneLength", "put_OpenPaneLength", "get_PaneToggleButtonStyle", "put_PaneToggleButtonStyle", "get_SelectedItem", "put_SelectedItem", "get_MenuItems", "get_MenuItemsSource", "put_MenuItemsSource", "get_SettingsItem", "get_AutoSuggestBox", "put_AutoSuggestBox", "get_MenuItemTemplate", "put_MenuItemTemplate", "get_MenuItemTemplateSelector", "put_MenuItemTemplateSelector", "get_MenuItemContainerStyle", "put_MenuItemContainerStyle", "get_MenuItemContainerStyleSelector", "put_MenuItemContainerStyleSelector", "MenuItemFromContainer", "ContainerFromMenuItem", "add_SelectionChanged", "remove_SelectionChanged", "add_ItemInvoked", "remove_ItemInvoked", "add_DisplayModeChanged", "remove_DisplayModeChanged"]

    /**
     * @type {Boolean} 
     */
    IsPaneOpen {
        get => this.get_IsPaneOpen()
        set => this.put_IsPaneOpen(value)
    }

    /**
     * @type {Float} 
     */
    CompactModeThresholdWidth {
        get => this.get_CompactModeThresholdWidth()
        set => this.put_CompactModeThresholdWidth(value)
    }

    /**
     * @type {Float} 
     */
    ExpandedModeThresholdWidth {
        get => this.get_ExpandedModeThresholdWidth()
        set => this.put_ExpandedModeThresholdWidth(value)
    }

    /**
     * @type {UIElement} 
     */
    PaneFooter {
        get => this.get_PaneFooter()
        set => this.put_PaneFooter(value)
    }

    /**
     * @type {IInspectable} 
     */
    Header {
        get => this.get_Header()
        set => this.put_Header(value)
    }

    /**
     * @type {DataTemplate} 
     */
    HeaderTemplate {
        get => this.get_HeaderTemplate()
        set => this.put_HeaderTemplate(value)
    }

    /**
     * @type {Integer} 
     */
    DisplayMode {
        get => this.get_DisplayMode()
    }

    /**
     * @type {Boolean} 
     */
    IsSettingsVisible {
        get => this.get_IsSettingsVisible()
        set => this.put_IsSettingsVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    IsPaneToggleButtonVisible {
        get => this.get_IsPaneToggleButtonVisible()
        set => this.put_IsPaneToggleButtonVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    AlwaysShowHeader {
        get => this.get_AlwaysShowHeader()
        set => this.put_AlwaysShowHeader(value)
    }

    /**
     * @type {Float} 
     */
    CompactPaneLength {
        get => this.get_CompactPaneLength()
        set => this.put_CompactPaneLength(value)
    }

    /**
     * @type {Float} 
     */
    OpenPaneLength {
        get => this.get_OpenPaneLength()
        set => this.put_OpenPaneLength(value)
    }

    /**
     * @type {Style} 
     */
    PaneToggleButtonStyle {
        get => this.get_PaneToggleButtonStyle()
        set => this.put_PaneToggleButtonStyle(value)
    }

    /**
     * @type {IInspectable} 
     */
    SelectedItem {
        get => this.get_SelectedItem()
        set => this.put_SelectedItem(value)
    }

    /**
     * @type {IVector<IInspectable>} 
     */
    MenuItems {
        get => this.get_MenuItems()
    }

    /**
     * @type {IInspectable} 
     */
    MenuItemsSource {
        get => this.get_MenuItemsSource()
        set => this.put_MenuItemsSource(value)
    }

    /**
     * @type {IInspectable} 
     */
    SettingsItem {
        get => this.get_SettingsItem()
    }

    /**
     * @type {AutoSuggestBox} 
     */
    AutoSuggestBox {
        get => this.get_AutoSuggestBox()
        set => this.put_AutoSuggestBox(value)
    }

    /**
     * @type {DataTemplate} 
     */
    MenuItemTemplate {
        get => this.get_MenuItemTemplate()
        set => this.put_MenuItemTemplate(value)
    }

    /**
     * @type {DataTemplateSelector} 
     */
    MenuItemTemplateSelector {
        get => this.get_MenuItemTemplateSelector()
        set => this.put_MenuItemTemplateSelector(value)
    }

    /**
     * @type {Style} 
     */
    MenuItemContainerStyle {
        get => this.get_MenuItemContainerStyle()
        set => this.put_MenuItemContainerStyle(value)
    }

    /**
     * @type {StyleSelector} 
     */
    MenuItemContainerStyleSelector {
        get => this.get_MenuItemContainerStyleSelector()
        set => this.put_MenuItemContainerStyleSelector(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPaneOpen() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPaneOpen(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CompactModeThresholdWidth() {
        result := ComCall(8, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_CompactModeThresholdWidth(value) {
        result := ComCall(9, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ExpandedModeThresholdWidth() {
        result := ComCall(10, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ExpandedModeThresholdWidth(value) {
        result := ComCall(11, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_PaneFooter() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UIElement(value)
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_PaneFooter(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Header() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Header(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_HeaderTemplate() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataTemplate(value)
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_HeaderTemplate(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DisplayMode() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSettingsVisible() {
        result := ComCall(19, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSettingsVisible(value) {
        result := ComCall(20, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPaneToggleButtonVisible() {
        result := ComCall(21, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPaneToggleButtonVisible(value) {
        result := ComCall(22, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AlwaysShowHeader() {
        result := ComCall(23, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AlwaysShowHeader(value) {
        result := ComCall(24, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CompactPaneLength() {
        result := ComCall(25, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_CompactPaneLength(value) {
        result := ComCall(26, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OpenPaneLength() {
        result := ComCall(27, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_OpenPaneLength(value) {
        result := ComCall(28, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Style} 
     */
    get_PaneToggleButtonStyle() {
        result := ComCall(29, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Style(value)
    }

    /**
     * 
     * @param {Style} value 
     * @returns {HRESULT} 
     */
    put_PaneToggleButtonStyle(value) {
        result := ComCall(30, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_SelectedItem() {
        result := ComCall(31, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_SelectedItem(value) {
        result := ComCall(32, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<IInspectable>} 
     */
    get_MenuItems() {
        result := ComCall(33, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(IInspectable, value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_MenuItemsSource() {
        result := ComCall(34, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_MenuItemsSource(value) {
        result := ComCall(35, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_SettingsItem() {
        result := ComCall(36, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @returns {AutoSuggestBox} 
     */
    get_AutoSuggestBox() {
        result := ComCall(37, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutoSuggestBox(value)
    }

    /**
     * 
     * @param {AutoSuggestBox} value 
     * @returns {HRESULT} 
     */
    put_AutoSuggestBox(value) {
        result := ComCall(38, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_MenuItemTemplate() {
        result := ComCall(39, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataTemplate(value)
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_MenuItemTemplate(value) {
        result := ComCall(40, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DataTemplateSelector} 
     */
    get_MenuItemTemplateSelector() {
        result := ComCall(41, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataTemplateSelector(value)
    }

    /**
     * 
     * @param {DataTemplateSelector} value 
     * @returns {HRESULT} 
     */
    put_MenuItemTemplateSelector(value) {
        result := ComCall(42, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Style} 
     */
    get_MenuItemContainerStyle() {
        result := ComCall(43, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Style(value)
    }

    /**
     * 
     * @param {Style} value 
     * @returns {HRESULT} 
     */
    put_MenuItemContainerStyle(value) {
        result := ComCall(44, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {StyleSelector} 
     */
    get_MenuItemContainerStyleSelector() {
        result := ComCall(45, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StyleSelector(value)
    }

    /**
     * 
     * @param {StyleSelector} value 
     * @returns {HRESULT} 
     */
    put_MenuItemContainerStyleSelector(value) {
        result := ComCall(46, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DependencyObject} container 
     * @returns {IInspectable} 
     */
    MenuItemFromContainer(container) {
        result := ComCall(47, this, "ptr", container, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @param {IInspectable} item 
     * @returns {DependencyObject} 
     */
    ContainerFromMenuItem(item) {
        result := ComCall(48, this, "ptr", item, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(result_)
    }

    /**
     * 
     * @param {TypedEventHandler<NavigationView, NavigationViewSelectionChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SelectionChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(49, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SelectionChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(50, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<NavigationView, NavigationViewItemInvokedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ItemInvoked(handler) {
        token := EventRegistrationToken()
        result := ComCall(51, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ItemInvoked(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(52, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<NavigationView, NavigationViewDisplayModeChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DisplayModeChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(53, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DisplayModeChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(54, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ItemCollection.ahk
#Include ..\DataTemplate.ahk
#Include .\DataTemplateSelector.ahk
#Include .\ItemsPanelTemplate.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Style.ahk
#Include .\StyleSelector.ahk
#Include .\ItemContainerGenerator.ahk
#Include ..\Media\Animation\TransitionCollection.ahk
#Include ..\..\..\Foundation\Collections\IObservableVector.ahk
#Include .\GroupStyle.ahk
#Include .\GroupStyleSelector.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IItemsControl extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IItemsControl
     * @type {Guid}
     */
    static IID => Guid("{f4a91dd8-d979-4381-8652-bda0342a765e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ItemsSource", "put_ItemsSource", "get_Items", "get_ItemTemplate", "put_ItemTemplate", "get_ItemTemplateSelector", "put_ItemTemplateSelector", "get_ItemsPanel", "put_ItemsPanel", "get_DisplayMemberPath", "put_DisplayMemberPath", "get_ItemContainerStyle", "put_ItemContainerStyle", "get_ItemContainerStyleSelector", "put_ItemContainerStyleSelector", "get_ItemContainerGenerator", "get_ItemContainerTransitions", "put_ItemContainerTransitions", "get_GroupStyle", "get_GroupStyleSelector", "put_GroupStyleSelector", "get_IsGrouping"]

    /**
     * @type {IInspectable} 
     */
    ItemsSource {
        get => this.get_ItemsSource()
        set => this.put_ItemsSource(value)
    }

    /**
     * @type {ItemCollection} 
     */
    Items {
        get => this.get_Items()
    }

    /**
     * @type {DataTemplate} 
     */
    ItemTemplate {
        get => this.get_ItemTemplate()
        set => this.put_ItemTemplate(value)
    }

    /**
     * @type {DataTemplateSelector} 
     */
    ItemTemplateSelector {
        get => this.get_ItemTemplateSelector()
        set => this.put_ItemTemplateSelector(value)
    }

    /**
     * @type {ItemsPanelTemplate} 
     */
    ItemsPanel {
        get => this.get_ItemsPanel()
        set => this.put_ItemsPanel(value)
    }

    /**
     * @type {HSTRING} 
     */
    DisplayMemberPath {
        get => this.get_DisplayMemberPath()
        set => this.put_DisplayMemberPath(value)
    }

    /**
     * @type {Style} 
     */
    ItemContainerStyle {
        get => this.get_ItemContainerStyle()
        set => this.put_ItemContainerStyle(value)
    }

    /**
     * @type {StyleSelector} 
     */
    ItemContainerStyleSelector {
        get => this.get_ItemContainerStyleSelector()
        set => this.put_ItemContainerStyleSelector(value)
    }

    /**
     * @type {ItemContainerGenerator} 
     */
    ItemContainerGenerator {
        get => this.get_ItemContainerGenerator()
    }

    /**
     * @type {TransitionCollection} 
     */
    ItemContainerTransitions {
        get => this.get_ItemContainerTransitions()
        set => this.put_ItemContainerTransitions(value)
    }

    /**
     * @type {IObservableVector<GroupStyle>} 
     */
    GroupStyle {
        get => this.get_GroupStyle()
    }

    /**
     * @type {GroupStyleSelector} 
     */
    GroupStyleSelector {
        get => this.get_GroupStyleSelector()
        set => this.put_GroupStyleSelector(value)
    }

    /**
     * @type {Boolean} 
     */
    IsGrouping {
        get => this.get_IsGrouping()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_ItemsSource() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
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
    put_ItemsSource(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ItemCollection} 
     */
    get_Items() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ItemCollection(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_ItemTemplate() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
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
    put_ItemTemplate(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DataTemplateSelector} 
     */
    get_ItemTemplateSelector() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
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
    put_ItemTemplateSelector(value) {
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ItemsPanelTemplate} 
     */
    get_ItemsPanel() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ItemsPanelTemplate(value)
    }

    /**
     * 
     * @param {ItemsPanelTemplate} value 
     * @returns {HRESULT} 
     */
    put_ItemsPanel(value) {
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayMemberPath() {
        value := HSTRING()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayMemberPath(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Style} 
     */
    get_ItemContainerStyle() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
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
    put_ItemContainerStyle(value) {
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {StyleSelector} 
     */
    get_ItemContainerStyleSelector() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
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
    put_ItemContainerStyleSelector(value) {
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ItemContainerGenerator} 
     */
    get_ItemContainerGenerator() {
        result := ComCall(21, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ItemContainerGenerator(value)
    }

    /**
     * 
     * @returns {TransitionCollection} 
     */
    get_ItemContainerTransitions() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TransitionCollection(value)
    }

    /**
     * 
     * @param {TransitionCollection} value 
     * @returns {HRESULT} 
     */
    put_ItemContainerTransitions(value) {
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IObservableVector<GroupStyle>} 
     */
    get_GroupStyle() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IObservableVector(GroupStyle, value)
    }

    /**
     * 
     * @returns {GroupStyleSelector} 
     */
    get_GroupStyleSelector() {
        result := ComCall(25, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GroupStyleSelector(value)
    }

    /**
     * 
     * @param {GroupStyleSelector} value 
     * @returns {HRESULT} 
     */
    put_GroupStyleSelector(value) {
        result := ComCall(26, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsGrouping() {
        result := ComCall(27, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

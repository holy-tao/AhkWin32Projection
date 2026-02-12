#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\TriggerCollection.ahk
#Include .\ResourceDictionary.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Thickness.ahk
#Include ..\..\Foundation\Uri.ahk
#Include .\Style.ahk
#Include .\DependencyObject.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IFrameworkElement extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFrameworkElement
     * @type {Guid}
     */
    static IID => Guid("{a391d09b-4a99-4b7c-9d8d-6fa5d01f6fbf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Triggers", "get_Resources", "put_Resources", "get_Tag", "put_Tag", "get_Language", "put_Language", "get_ActualWidth", "get_ActualHeight", "get_Width", "put_Width", "get_Height", "put_Height", "get_MinWidth", "put_MinWidth", "get_MaxWidth", "put_MaxWidth", "get_MinHeight", "put_MinHeight", "get_MaxHeight", "put_MaxHeight", "get_HorizontalAlignment", "put_HorizontalAlignment", "get_VerticalAlignment", "put_VerticalAlignment", "get_Margin", "put_Margin", "get_Name", "put_Name", "get_BaseUri", "get_DataContext", "put_DataContext", "get_Style", "put_Style", "get_Parent", "get_FlowDirection", "put_FlowDirection", "add_Loaded", "remove_Loaded", "add_Unloaded", "remove_Unloaded", "add_SizeChanged", "remove_SizeChanged", "add_LayoutUpdated", "remove_LayoutUpdated", "FindName", "SetBinding"]

    /**
     * @type {TriggerCollection} 
     */
    Triggers {
        get => this.get_Triggers()
    }

    /**
     * @type {ResourceDictionary} 
     */
    Resources {
        get => this.get_Resources()
        set => this.put_Resources(value)
    }

    /**
     * @type {IInspectable} 
     */
    Tag {
        get => this.get_Tag()
        set => this.put_Tag(value)
    }

    /**
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
        set => this.put_Language(value)
    }

    /**
     * @type {Float} 
     */
    ActualWidth {
        get => this.get_ActualWidth()
    }

    /**
     * @type {Float} 
     */
    ActualHeight {
        get => this.get_ActualHeight()
    }

    /**
     * @type {Float} 
     */
    Width {
        get => this.get_Width()
        set => this.put_Width(value)
    }

    /**
     * @type {Float} 
     */
    Height {
        get => this.get_Height()
        set => this.put_Height(value)
    }

    /**
     * @type {Float} 
     */
    MinWidth {
        get => this.get_MinWidth()
        set => this.put_MinWidth(value)
    }

    /**
     * @type {Float} 
     */
    MaxWidth {
        get => this.get_MaxWidth()
        set => this.put_MaxWidth(value)
    }

    /**
     * @type {Float} 
     */
    MinHeight {
        get => this.get_MinHeight()
        set => this.put_MinHeight(value)
    }

    /**
     * @type {Float} 
     */
    MaxHeight {
        get => this.get_MaxHeight()
        set => this.put_MaxHeight(value)
    }

    /**
     * @type {Integer} 
     */
    HorizontalAlignment {
        get => this.get_HorizontalAlignment()
        set => this.put_HorizontalAlignment(value)
    }

    /**
     * @type {Integer} 
     */
    VerticalAlignment {
        get => this.get_VerticalAlignment()
        set => this.put_VerticalAlignment(value)
    }

    /**
     * @type {Thickness} 
     */
    Margin {
        get => this.get_Margin()
        set => this.put_Margin(value)
    }

    /**
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {Uri} 
     */
    BaseUri {
        get => this.get_BaseUri()
    }

    /**
     * @type {IInspectable} 
     */
    DataContext {
        get => this.get_DataContext()
        set => this.put_DataContext(value)
    }

    /**
     * @type {Style} 
     */
    Style {
        get => this.get_Style()
        set => this.put_Style(value)
    }

    /**
     * @type {DependencyObject} 
     */
    Parent {
        get => this.get_Parent()
    }

    /**
     * @type {Integer} 
     */
    FlowDirection {
        get => this.get_FlowDirection()
        set => this.put_FlowDirection(value)
    }

    /**
     * 
     * @returns {TriggerCollection} 
     */
    get_Triggers() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TriggerCollection(value)
    }

    /**
     * 
     * @returns {ResourceDictionary} 
     */
    get_Resources() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ResourceDictionary(value)
    }

    /**
     * 
     * @param {ResourceDictionary} value 
     * @returns {HRESULT} 
     */
    put_Resources(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Tag() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
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
    put_Tag(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Language() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
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
    put_Language(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ActualWidth() {
        result := ComCall(13, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ActualHeight() {
        result := ComCall(14, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Width() {
        result := ComCall(15, this, "double*", &value := 0, "int")
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
    put_Width(value) {
        result := ComCall(16, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Height() {
        result := ComCall(17, this, "double*", &value := 0, "int")
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
    put_Height(value) {
        result := ComCall(18, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinWidth() {
        result := ComCall(19, this, "double*", &value := 0, "int")
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
    put_MinWidth(value) {
        result := ComCall(20, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxWidth() {
        result := ComCall(21, this, "double*", &value := 0, "int")
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
    put_MaxWidth(value) {
        result := ComCall(22, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinHeight() {
        result := ComCall(23, this, "double*", &value := 0, "int")
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
    put_MinHeight(value) {
        result := ComCall(24, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxHeight() {
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
    put_MaxHeight(value) {
        result := ComCall(26, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HorizontalAlignment() {
        result := ComCall(27, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HorizontalAlignment(value) {
        result := ComCall(28, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VerticalAlignment() {
        result := ComCall(29, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_VerticalAlignment(value) {
        result := ComCall(30, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_Margin() {
        value := Thickness()
        result := ComCall(31, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_Margin(value) {
        result := ComCall(32, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        value := HSTRING()
        result := ComCall(33, this, "ptr", value, "int")
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
    put_Name(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(34, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_BaseUri() {
        result := ComCall(35, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_DataContext() {
        result := ComCall(36, this, "ptr*", &value := 0, "int")
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
    put_DataContext(value) {
        result := ComCall(37, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Style} 
     */
    get_Style() {
        result := ComCall(38, this, "ptr*", &value := 0, "int")
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
    put_Style(value) {
        result := ComCall(39, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_Parent() {
        result := ComCall(40, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FlowDirection() {
        result := ComCall(41, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FlowDirection(value) {
        result := ComCall(42, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Loaded(handler) {
        token := EventRegistrationToken()
        result := ComCall(43, this, "ptr", handler, "ptr", token, "int")
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
    remove_Loaded(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(44, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Unloaded(handler) {
        token := EventRegistrationToken()
        result := ComCall(45, this, "ptr", handler, "ptr", token, "int")
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
    remove_Unloaded(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(46, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {SizeChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SizeChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(47, this, "ptr", handler, "ptr", token, "int")
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
    remove_SizeChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(48, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LayoutUpdated(handler) {
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
    remove_LayoutUpdated(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(50, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @returns {IInspectable} 
     */
    FindName(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(51, this, "ptr", name, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @param {DependencyProperty} dp 
     * @param {BindingBase} binding_ 
     * @returns {HRESULT} 
     */
    SetBinding(dp, binding_) {
        result := ComCall(52, this, "ptr", dp, "ptr", binding_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

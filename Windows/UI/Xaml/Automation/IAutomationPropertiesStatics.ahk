#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\UIElement.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class IAutomationPropertiesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomationPropertiesStatics
     * @type {Guid}
     */
    static IID => Guid("{b618fd7b-32d0-4970-9c42-7c039ac7be78}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AcceleratorKeyProperty", "GetAcceleratorKey", "SetAcceleratorKey", "get_AccessKeyProperty", "GetAccessKey", "SetAccessKey", "get_AutomationIdProperty", "GetAutomationId", "SetAutomationId", "get_HelpTextProperty", "GetHelpText", "SetHelpText", "get_IsRequiredForFormProperty", "GetIsRequiredForForm", "SetIsRequiredForForm", "get_ItemStatusProperty", "GetItemStatus", "SetItemStatus", "get_ItemTypeProperty", "GetItemType", "SetItemType", "get_LabeledByProperty", "GetLabeledBy", "SetLabeledBy", "get_NameProperty", "GetName", "SetName", "get_LiveSettingProperty", "GetLiveSetting", "SetLiveSetting"]

    /**
     * @type {DependencyProperty} 
     */
    AcceleratorKeyProperty {
        get => this.get_AcceleratorKeyProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AccessKeyProperty {
        get => this.get_AccessKeyProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AutomationIdProperty {
        get => this.get_AutomationIdProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HelpTextProperty {
        get => this.get_HelpTextProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsRequiredForFormProperty {
        get => this.get_IsRequiredForFormProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ItemStatusProperty {
        get => this.get_ItemStatusProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ItemTypeProperty {
        get => this.get_ItemTypeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    LabeledByProperty {
        get => this.get_LabeledByProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    NameProperty {
        get => this.get_NameProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    LiveSettingProperty {
        get => this.get_LiveSettingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AcceleratorKeyProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {HSTRING} 
     */
    GetAcceleratorKey(element) {
        result_ := HSTRING()
        result := ComCall(7, this, "ptr", element, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    SetAcceleratorKey(element, value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(8, this, "ptr", element, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AccessKeyProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {HSTRING} 
     */
    GetAccessKey(element) {
        result_ := HSTRING()
        result := ComCall(10, this, "ptr", element, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    SetAccessKey(element, value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(11, this, "ptr", element, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AutomationIdProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {HSTRING} 
     */
    GetAutomationId(element) {
        result_ := HSTRING()
        result := ComCall(13, this, "ptr", element, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    SetAutomationId(element, value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(14, this, "ptr", element, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_HelpTextProperty() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {HSTRING} 
     */
    GetHelpText(element) {
        result_ := HSTRING()
        result := ComCall(16, this, "ptr", element, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    SetHelpText(element, value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(17, this, "ptr", element, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsRequiredForFormProperty() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetIsRequiredForForm(element) {
        result := ComCall(19, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetIsRequiredForForm(element, value) {
        result := ComCall(20, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ItemStatusProperty() {
        result := ComCall(21, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {HSTRING} 
     */
    GetItemStatus(element) {
        result_ := HSTRING()
        result := ComCall(22, this, "ptr", element, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    SetItemStatus(element, value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(23, this, "ptr", element, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ItemTypeProperty() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {HSTRING} 
     */
    GetItemType(element) {
        result_ := HSTRING()
        result := ComCall(25, this, "ptr", element, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    SetItemType(element, value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(26, this, "ptr", element, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_LabeledByProperty() {
        result := ComCall(27, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {UIElement} 
     */
    GetLabeledBy(element) {
        result := ComCall(28, this, "ptr", element, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UIElement(result_)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    SetLabeledBy(element, value) {
        result := ComCall(29, this, "ptr", element, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_NameProperty() {
        result := ComCall(30, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetName
     * @param {DependencyObject} element 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wmformat/iwmcodecstrings-getname
     */
    GetName(element) {
        result_ := HSTRING()
        result := ComCall(31, this, "ptr", element, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Sets the read mode and the blocking mode of the specified named pipe. If the specified handle is to the client end of a named pipe and if the named pipe server process is on a remote computer, the function can also be used to control local buffering.
     * @remarks
     * <b>Windows 10, version 1709:  </b>Pipes are only supported within an app-container; ie, from one UWP process to another UWP process that's part of the same app. Also, named pipes must use the syntax `\\.\pipe\LOCAL\` for the pipe name.
     * @param {DependencyObject} element 
     * @param {HSTRING} value 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/namedpipeapi/nf-namedpipeapi-setnamedpipehandlestate
     */
    SetName(element, value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(32, this, "ptr", element, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_LiveSettingProperty() {
        result := ComCall(33, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Integer} 
     */
    GetLiveSetting(element) {
        result := ComCall(34, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetLiveSetting(element, value) {
        result := ComCall(35, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

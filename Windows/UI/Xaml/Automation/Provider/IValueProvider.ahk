#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes methods and properties to support access by a Microsoft UI Automation client to controls that have an intrinsic value that does not span a range and that can be represented as a string. Implement this interface in order to support the capabilities that an automation client requests with a [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) call and [PatternInterface.Value](../windows.ui.xaml.automation.peers/patterninterface.md).
 * @remarks
 * The value string can be editable, depending on the control and its settings. This pattern has guidelines and conventions that aren't fully documented here. For more info on what this pattern is for, see [Value Control Pattern](/windows/desktop/WinAuto/uiauto-implementingvalue).
 * 
 * IValueProvider is implemented by the existing Windows Runtime class [ComboBoxAutomationPeer](../windows.ui.xaml.automation.peers/comboboxautomationpeer.md).
 * 
 * The text models supported by Windows Runtime text controls such as [TextBox](../windows.ui.xaml.controls/textbox.md) and [RichTextBlock](../windows.ui.xaml.controls/richtextblock.md) don't use the IValueProvider pattern.
 * 
 * Use [ValuePatternIdentifiers](../windows.ui.xaml.automation/valuepatternidentifiers.md) if you want to reference the IValueProvider pattern properties from control code when you fire automation events or call [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.ivalueprovider
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class IValueProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IValueProvider
     * @type {Guid}
     */
    static IID => Guid("{2086b7a7-ac0e-47d1-ab9b-2a64292afdf8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsReadOnly", "get_Value", "SetValue"]

    /**
     * Gets a value that indicates whether the value of a control is read-only.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.ivalueprovider.isreadonly
     * @type {Boolean} 
     */
    IsReadOnly {
        get => this.get_IsReadOnly()
    }

    /**
     * Gets the value of the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.ivalueprovider.value
     * @type {HSTRING} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * Indicates whether the value of a control is read-only. (IValueProvider.get_IsReadOnly)
     * @remarks
     * A control should have its IsEnabled property (<a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-automation-element-propids">UIA_IsEnabledPropertyId</a>) set to <b>TRUE</b> and its <b>IValueProvider::IsReadOnly</b> 
     *             property set to <b>FALSE</b> before allowing a call to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-ivalueprovider-setvalue">IValueProvider::SetValue</a>.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-ivalueprovider-get_isreadonly
     */
    get_IsReadOnly() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * The value of the control.
     * @remarks
     * Single-line edit controls support programmatic access to their contents by implementing <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-ivalueprovider">IValueProvider</a> (in addition to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itextprovider">ITextProvider</a>). However, multi-line edit controls do not implement <b>IValueProvider</b>.
     * 
     * 
     * To retrieve the textual contents of multi-line edit controls, the controls must implement <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itextprovider">ITextProvider</a>. However, <b>ITextProvider</b> does not support setting the value of a control.
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-ivalueprovider">IValueProvider</a> does not support the retrieval of formatting information or substring values. Implement <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itextprovider">ITextProvider</a> in these scenarios.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-ivalueprovider-get_value
     */
    get_Value() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Sets the value of a control.
     * @param {HSTRING} value The value to set. The provider is responsible for converting the value to the appropriate data type.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.ivalueprovider.setvalue
     */
    SetValue(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

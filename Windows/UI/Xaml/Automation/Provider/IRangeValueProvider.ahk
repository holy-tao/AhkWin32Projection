#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes methods and properties to support access by a Microsoft UI Automation client to controls that can be set to a value within a range. Implement this interface in order to support the capabilities that an automation client requests with a [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) call and [PatternInterface.RangeValue](../windows.ui.xaml.automation.peers/patterninterface.md).
 * @remarks
 * This pattern has guidelines and conventions that aren't fully documented here. For more info on what this pattern is for, see [RangeValue Control Pattern](/windows/desktop/WinAuto/uiauto-implementingrangevalue).
 * 
 * IRangeValueProvider is implemented by the existing Windows Runtime class [RangeBaseAutomationPeer](../windows.ui.xaml.automation.peers/rangebaseautomationpeer.md). This is the base class for peers for [Slider](../windows.ui.xaml.controls/slider.md), [ScrollBar](../windows.ui.xaml.controls.primitives/scrollbar.md) and [ProgressBar](../windows.ui.xaml.controls/progressbar.md). [ProgressBarAutomationPeer](../windows.ui.xaml.automation.peers/progressbarautomationpeer.md) adds an override such that it won't support the pattern if the value of [IsIndeterminate](../windows.ui.xaml.controls/progressbar_isindeterminate.md) on the owner control is **false**.
 * 
 * Use [RangeValuePatternIdentifiers](../windows.ui.xaml.automation/rangevaluepatternidentifiers.md) if you want to reference the IRangeValueProvider pattern properties from control code when you fire automation events or call [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.irangevalueprovider
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class IRangeValueProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRangeValueProvider
     * @type {Guid}
     */
    static IID => Guid("{838a34a8-7d5f-4079-af03-c3d015e93413}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsReadOnly", "get_LargeChange", "get_Maximum", "get_Minimum", "get_SmallChange", "get_Value", "SetValue"]

    /**
     * Gets a value that indicates whether the value of a control is read-only.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.irangevalueprovider.isreadonly
     * @type {Boolean} 
     */
    IsReadOnly {
        get => this.get_IsReadOnly()
    }

    /**
     * Gets the value that is added to or subtracted from the [Value](irangevalueprovider_value.md) property when a large change is made, such as with the PAGE DOWN key.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.irangevalueprovider.largechange
     * @type {Float} 
     */
    LargeChange {
        get => this.get_LargeChange()
    }

    /**
     * Gets the maximum range value that is supported by the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.irangevalueprovider.maximum
     * @type {Float} 
     */
    Maximum {
        get => this.get_Maximum()
    }

    /**
     * Gets the minimum range value that is supported by the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.irangevalueprovider.minimum
     * @type {Float} 
     */
    Minimum {
        get => this.get_Minimum()
    }

    /**
     * Gets the value that is added to or subtracted from the [Value](irangevalueprovider_value.md) property when a small change is made, such as with an arrow key.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.irangevalueprovider.smallchange
     * @type {Float} 
     */
    SmallChange {
        get => this.get_SmallChange()
    }

    /**
     * Gets the value of the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.irangevalueprovider.value
     * @type {Float} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * Indicates whether the value of a control is read-only. (IRangeValueProvider.get_IsReadOnly)
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-irangevalueprovider-get_isreadonly
     */
    get_IsReadOnly() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Specifies the value that is added to or subtracted from the IRangeValueProvider::Value property when a large change is made, such as when the PAGE DOWN key is pressed.
     * @remarks
     * The LargeChange property can support Not a Number (NaN) value. When returning a NaN value, the provider should return a quiet (non-signaling) NaN to avoid raising an exception if floating-point exceptions are turned on. The following example shows how to create a quiet NaN:
     * 
     *             
     * 
     * 
     * ```
     * ULONGLONG ulNaN = 0xFFFFFFFFFFFFFFFF;
     *     *pRetVal = *reinterpret_cast<double*>(&ulNaN);
     * ```
     * 
     * 
     * Alternatively, you can use the following function from the standard C++ libraries:
     * 
     * 
     * ```
     * numeric_limits<double>::quiet_NaN( )
     * ```
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-irangevalueprovider-get_largechange
     */
    get_LargeChange() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Specifies the maximum range value supported by the control.
     * @remarks
     * This value should be greater than [Minimum](nf-uiautomationcore-irangevalueprovider-get_minimum.md).
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-irangevalueprovider-get_maximum
     */
    get_Maximum() {
        result := ComCall(8, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Specifies the minimum range value supported by the control.
     * @remarks
     * This value should be less than [Maximum](nf-uiautomationcore-irangevalueprovider-get_maximum.md).
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-irangevalueprovider-get_minimum
     */
    get_Minimum() {
        result := ComCall(9, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Specifies the value that is added to or subtracted from the IRangeValueProvider::Value property when a small change is made, such as when an arrow key is pressed.
     * @remarks
     * The SmallChange property can support Not a Number (NaN) value. When returning a NaN value, the provider should return a quiet (non-signaling) NaN to avoid raising an exception if floating-point exceptions are turned on. The following example shows how to create a quiet NaN:
     * 
     *             
     * 
     * 
     * ```
     * ULONGLONG ulNaN = 0xFFFFFFFFFFFFFFFF;
     *     *pRetVal = *reinterpret_cast<double*>(&ulNaN);
     * ```
     * 
     * 
     * Alternatively, you can use the following function from the standard C++ libraries:
     * 
     * 
     * ```
     * numeric_limits<double>::quiet_NaN( )
     * ```
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-irangevalueprovider-get_smallchange
     */
    get_SmallChange() {
        result := ComCall(10, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Specifies the value of the control.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-irangevalueprovider-get_value
     */
    get_Value() {
        result := ComCall(11, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Sets the value of the control.
     * @param {Float} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.irangevalueprovider.setvalue
     */
    SetValue(value) {
        result := ComCall(12, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

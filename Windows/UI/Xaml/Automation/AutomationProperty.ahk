#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAutomationProperty.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Identifies a property of [AutomationElementIdentifiers](automationelementidentifiers.md) or of a specific control pattern.
 * @remarks
 * Static AutomationProperty values are implemented in specific classes also in the [Windows.UI.Xaml.Automation](windows_ui_xaml_automation.md) namespace. The values are the identifiers for the Windows Runtime implementation of a common provider pattern for Microsoft UI Automation, or for the general [IAccessible](/windows/desktop/api/oleacc/nn-oleacc-iaccessible) peer pattern.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationproperty
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class AutomationProperty extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAutomationProperty

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAutomationProperty.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}

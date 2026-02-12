#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAutomationTextRange.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to a span of continuous text in a container that supports the [IUIAutomationTextPattern](/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextpattern) interface.
 * @remarks
 * Client applications can use this object to select, compare, and retrieve embedded objects from the text span. Two endpoints are exposed that delimit where the text span starts and ends. Disjoint spans of text are represented by an [IUIAutomationTextRangeArray](/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextrangearray) interface.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.automationtextrange
 * @namespace Windows.UI.UIAutomation
 * @version WindowsRuntime 1.4
 */
class AutomationTextRange extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAutomationTextRange

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAutomationTextRange.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Identifies text range endpoints for methods of [ITextRangeProvider](../windows.ui.xaml.automation.provider/itextrangeprovider.md).
 * @remarks
 * [ITextRangeProvider](../windows.ui.xaml.automation.provider/itextrangeprovider.md) is the definition interface if you want to support the **TextRange** automation pattern as part of a Windows Runtime custom control. For more info, see [ITextRangeProvider](../windows.ui.xaml.automation.provider/itextrangeprovider.md) or [Text and TextRange Control Patterns](/windows/desktop/WinAuto/uiauto-implementingtextandtextrange).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.text.textpatternrangeendpoint
 * @namespace Windows.UI.Xaml.Automation.Text
 * @version WindowsRuntime 1.4
 */
class TextPatternRangeEndpoint extends Win32Enum{

    /**
     * The start point of the range.
     * @type {Integer (Int32)}
     */
    static Start => 0

    /**
     * The endpoint of the range.
     * @type {Integer (Int32)}
     */
    static End => 1
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Provides a value for **TextReadingOrder** properties.
 * @remarks
 * > [!IMPORTANT]
 * > Starting with Windows 10, the enumeration value **0** has the constant name **UseFlowDirection**, and is not the default value of **TextReadingOrder** properties. All Windows 10 text controls set the default value of **TextReadingOrder** to `DetectFromContent`.
 * >
 * > In Windows 8.1, the value **0** has the constant name **Default**. Do not use in Windows 10 apps.
 * 
 * The **TextReadingOrder** property influences the reading order (left-to-right or right-to-left) of individual UI elements that contain bidirectional text. In Windows 10 text controls this property has the default value of `DetectFromContent` so that content can be detected dynamically, rather than using the [FlowDirection](frameworkelement_flowdirection.md) property on a content parent. The `DetectFromContent` logic uses the first strong character in each paragraph to determine the reading direction for the paragraph, based on the [Unicode Bidirectional Algorithm, P2](https://www.unicode.org/reports/tr9/#P2).
 * 
 * This property can be useful when the base direction of the text is unknown, and may not match the user's language or direction. For more info see [How to support bidirectional UI](/previous-versions/windows/apps/jj712703(v=win.10)).
 * 
 * If content is coming from data binding, this avoids the need for binding to **FlowDirection** with a converter that interprets right-to-left locale info that comes from the data.
 * 
 * Unlike **FlowDirection** and its logic, the reading order logic for `DetectFromContent` will not affect the alignment of the text within the text control, it just adjusts the order in which blocks of bidirectional text are laid out.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.textreadingorder
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class TextReadingOrder extends Win32Enum{

    /**
     * Do not detect flow direction from content. Use [FlowDirection](flowdirection.md) value (if any) for reading order decisions. (Windows 8.1 only. See Remarks.)
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Do not detect flow direction from content. Use [FlowDirection](flowdirection.md) value (if any) for reading order decisions. (Windows 10 only. See Remarks.)
     * @type {Integer (Int32)}
     */
    static UseFlowDirection => 0

    /**
     * Detect flow direction from text content. For bidirectional text, text containers will infer the reading order for text based on the content. See Remarks.
     * @type {Integer (Int32)}
     */
    static DetectFromContent => 1
}

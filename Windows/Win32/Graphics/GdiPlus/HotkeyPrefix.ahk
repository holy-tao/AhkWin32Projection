#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The HotkeyPrefix enumeration specifies how to display hot keys. There are three options:\_do nothing, display hot keys underlined, and hide the hot key underlines.
 * @remarks
 * 
 * Hot keys are keys that are programmed to provide keyboard shortcuts to functionality and are activated by pressing the ALT key. The keys are application dependent and are identified by an underscored letter, typically in a menu. An example would be the 
 * 				<b>File</b> menu with the letter F underscored. This makes the F key a hot key to launch the 
 * 				<b>File</b> menu.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-hotkeyprefix
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class HotkeyPrefix extends Win32Enum{

    /**
     * Specifies that no hot key processing occurs.
     * @type {Integer (Int32)}
     */
    static HotkeyPrefixNone => 0

    /**
     * Specifies that Unicode text is scanned for ampersands (&amp;), which are interpreted as hot key markers in the same way as menu and dialog resources are processed in the Windows user interface. All pairs of ampersands are replaced by a single ampersand. All single ampersands are removed and the first character that follows the first single ampersand is displayed underlined.
     * @type {Integer (Int32)}
     */
    static HotkeyPrefixShow => 1

    /**
     * Specifies that Unicode text is scanned for ampersands (&amp;), which are substituted and removed as in HotkeyPrefixShow but no underline is shown. This option can be used when accessibility hot key underlines are not required.
     * @type {Integer (Int32)}
     */
    static HotkeyPrefixHide => 2
}

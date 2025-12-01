#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Implements the IInkDesktopHost interface.
 * @see https://learn.microsoft.com/windows/win32/input_ink/inkdesktophost
 * @namespace Windows.Win32.UI.Input.Ink
 * @version v4.0.30319
 */
class InkDesktopHost extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

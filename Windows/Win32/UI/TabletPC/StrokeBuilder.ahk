#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Implements the IStrokeBuilder Interface.
 * @see https://learn.microsoft.com/windows/win32/tablet/strokebuilder-class
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class StrokeBuilder extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

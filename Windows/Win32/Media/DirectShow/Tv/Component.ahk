#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The Component object represents a unique instance of a component that is available for enumeration.
 * @see https://learn.microsoft.com/windows/win32/Msi/components
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class Component extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

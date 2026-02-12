#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The name of the component that logged the trace message.
 * @see https://learn.microsoft.com/windows/win32/ktop-src/WES/eventschema-component-debugdatatype-element
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class Component extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

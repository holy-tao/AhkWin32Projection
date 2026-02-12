#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Interval Literals
 * @see https://learn.microsoft.com/sql/ocs/docs/odbc/reference/appendixes/interval-literals
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class Interval extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

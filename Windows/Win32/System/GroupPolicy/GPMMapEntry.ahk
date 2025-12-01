#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IGPMMapEntry interface provides access to a map entry.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmmapentry
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class GPMMapEntry extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

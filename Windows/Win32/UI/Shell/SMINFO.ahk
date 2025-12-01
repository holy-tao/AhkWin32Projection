#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about an item from a menu band.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-sminfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SMINFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Type: <b>DWORD</b>
     * 
     * Flags that specify which of the other three members are valid.
     * @type {Integer}
     */
    dwMask {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * A flag that indicates whether the item is a string or a separator.
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Flags that contain information about the item and how it should be displayed.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>int</b>
     * 
     * When <b>SMIF_ICON</b> is set, the index of the requested icon in the toolbar image list.
     * @type {Integer}
     */
    iIcon {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}

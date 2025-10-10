#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains cursor ID mappings for pointer devices.
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-pointer_device_cursor_info
 * @namespace Windows.Win32.UI.Input.Pointer
 * @version v4.0.30319
 */
class POINTER_DEVICE_CURSOR_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The assigned cursor ID.
     * @type {Integer}
     */
    cursorId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ne-winuser-pointer_device_cursor_type">POINTER_DEVICE_CURSOR_TYPE</a> that the ID is mapped to.
     * @type {Integer}
     */
    cursor {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}

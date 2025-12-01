#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information associated with a media change event.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-class_media_change_context
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class CLASS_MEDIA_CHANGE_CONTEXT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The number of times that media has been changed since system startup.
     * @type {Integer}
     */
    MediaChangeCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    NewState {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}

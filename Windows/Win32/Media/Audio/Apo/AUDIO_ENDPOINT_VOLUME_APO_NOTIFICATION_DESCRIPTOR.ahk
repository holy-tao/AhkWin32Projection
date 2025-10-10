#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class AUDIO_ENDPOINT_VOLUME_APO_NOTIFICATION_DESCRIPTOR extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Pointer<IMMDevice>}
     */
    device {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}

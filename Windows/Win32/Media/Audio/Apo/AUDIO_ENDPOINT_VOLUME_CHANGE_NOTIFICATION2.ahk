#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class AUDIO_ENDPOINT_VOLUME_CHANGE_NOTIFICATION2 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer<IMMDevice>}
     */
    endpoint {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<AUDIO_VOLUME_NOTIFICATION_DATA2>}
     */
    volume {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

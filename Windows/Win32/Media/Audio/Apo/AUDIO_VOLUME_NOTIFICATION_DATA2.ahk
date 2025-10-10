#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class AUDIO_VOLUME_NOTIFICATION_DATA2 extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Pointer<AUDIO_VOLUME_NOTIFICATION_DATA>}
     */
    notificationData {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Float}
     */
    masterVolumeInDb {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * @type {Float}
     */
    volumeMinInDb {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * @type {Float}
     */
    volumeMaxInDb {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * @type {Float}
     */
    volumeIncrementInDb {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    step {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    stepCount {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Array<Single>}
     */
    channelVolumesInDb{
        get {
            if(!this.HasProp("__channelVolumesInDbProxyArray"))
                this.__channelVolumesInDbProxyArray := Win32FixedArray(this.ptr + 32, 1, Primitive, "float")
            return this.__channelVolumesInDbProxyArray
        }
    }
}

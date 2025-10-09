#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_TUNER_CAPS_S extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Property{
        get {
            if(!this.HasProp("__Property"))
                this.__Property := KSIDENTIFIER(this.ptr + 0)
            return this.__Property
        }
    }

    /**
     * @type {Integer}
     */
    ModesSupported {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {KSIDENTIFIER}
     */
    VideoMedium{
        get {
            if(!this.HasProp("__VideoMedium"))
                this.__VideoMedium := KSIDENTIFIER(this.ptr + 24)
            return this.__VideoMedium
        }
    }

    /**
     * @type {KSIDENTIFIER}
     */
    TVAudioMedium{
        get {
            if(!this.HasProp("__TVAudioMedium"))
                this.__TVAudioMedium := KSIDENTIFIER(this.ptr + 40)
            return this.__TVAudioMedium
        }
    }

    /**
     * @type {KSIDENTIFIER}
     */
    RadioAudioMedium{
        get {
            if(!this.HasProp("__RadioAudioMedium"))
                this.__RadioAudioMedium := KSIDENTIFIER(this.ptr + 56)
            return this.__RadioAudioMedium
        }
    }
}

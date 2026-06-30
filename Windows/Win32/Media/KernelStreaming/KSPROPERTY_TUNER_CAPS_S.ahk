#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_TUNER_CAPS_S extends Win32Struct {
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Property {
        get {
            if(!this.HasProp("__Property"))
                this.__Property := KSIDENTIFIER(0, this)
            return this.__Property
        }
    }

    /**
     * @type {Integer}
     */
    ModesSupported {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {KSIDENTIFIER}
     */
    VideoMedium {
        get {
            if(!this.HasProp("__VideoMedium"))
                this.__VideoMedium := KSIDENTIFIER(32, this)
            return this.__VideoMedium
        }
    }

    /**
     * @type {KSIDENTIFIER}
     */
    TVAudioMedium {
        get {
            if(!this.HasProp("__TVAudioMedium"))
                this.__TVAudioMedium := KSIDENTIFIER(56, this)
            return this.__TVAudioMedium
        }
    }

    /**
     * @type {KSIDENTIFIER}
     */
    RadioAudioMedium {
        get {
            if(!this.HasProp("__RadioAudioMedium"))
                this.__RadioAudioMedium := KSIDENTIFIER(80, this)
            return this.__RadioAudioMedium
        }
    }
}

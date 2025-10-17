#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\DMUS_LFOPARAMS.ahk
#Include .\DMUS_VEGPARAMS.ahk
#Include .\DMUS_PEGPARAMS.ahk
#Include .\DMUS_MSCPARAMS.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class DMUS_ARTICPARAMS extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {DMUS_LFOPARAMS}
     */
    LFO{
        get {
            if(!this.HasProp("__LFO"))
                this.__LFO := DMUS_LFOPARAMS(0, this)
            return this.__LFO
        }
    }

    /**
     * @type {DMUS_VEGPARAMS}
     */
    VolEG{
        get {
            if(!this.HasProp("__VolEG"))
                this.__VolEG := DMUS_VEGPARAMS(24, this)
            return this.__VolEG
        }
    }

    /**
     * @type {DMUS_PEGPARAMS}
     */
    PitchEG{
        get {
            if(!this.HasProp("__PitchEG"))
                this.__PitchEG := DMUS_PEGPARAMS(48, this)
            return this.__PitchEG
        }
    }

    /**
     * @type {DMUS_MSCPARAMS}
     */
    Misc{
        get {
            if(!this.HasProp("__Misc"))
                this.__Misc := DMUS_MSCPARAMS(76, this)
            return this.__Misc
        }
    }
}

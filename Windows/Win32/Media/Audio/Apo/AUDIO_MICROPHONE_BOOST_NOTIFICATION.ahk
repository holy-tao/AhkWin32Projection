#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class AUDIO_MICROPHONE_BOOST_NOTIFICATION extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Pointer<IMMDevice>}
     */
    endpoint {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Guid>}
     */
    eventContext {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {BOOL}
     */
    microphoneBoostEnabled{
        get {
            if(!this.HasProp("__microphoneBoostEnabled"))
                this.__microphoneBoostEnabled := BOOL(this.ptr + 16)
            return this.__microphoneBoostEnabled
        }
    }

    /**
     * @type {Float}
     */
    levelInDb {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }

    /**
     * @type {Float}
     */
    levelMinInDb {
        get => NumGet(this, 24, "float")
        set => NumPut("float", value, this, 24)
    }

    /**
     * @type {Float}
     */
    levelMaxInDb {
        get => NumGet(this, 28, "float")
        set => NumPut("float", value, this, 28)
    }

    /**
     * @type {Float}
     */
    levelStepInDb {
        get => NumGet(this, 32, "float")
        set => NumPut("float", value, this, 32)
    }

    /**
     * @type {BOOL}
     */
    muteSupported{
        get {
            if(!this.HasProp("__muteSupported"))
                this.__muteSupported := BOOL(this.ptr + 36)
            return this.__muteSupported
        }
    }

    /**
     * @type {BOOL}
     */
    mute{
        get {
            if(!this.HasProp("__mute"))
                this.__mute := BOOL(this.ptr + 40)
            return this.__mute
        }
    }
}

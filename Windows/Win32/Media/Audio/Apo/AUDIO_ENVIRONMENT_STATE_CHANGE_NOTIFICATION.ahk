#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PROPERTYKEY.ahk

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class AUDIO_ENVIRONMENT_STATE_CHANGE_NOTIFICATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {IPropertyStore}
     */
    propertyStore {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {PROPERTYKEY}
     */
    propertyKey{
        get {
            if(!this.HasProp("__propertyKey"))
                this.__propertyKey := PROPERTYKEY(8, this)
            return this.__propertyKey
        }
    }
}

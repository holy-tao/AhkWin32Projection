#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PROPERTYKEY.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/ns-audioengineextensionapo-audio_systemeffects_property_change_notification
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class AUDIO_SYSTEMEFFECTS_PROPERTY_CHANGE_NOTIFICATION extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {IMMDevice}
     */
    endpoint {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Guid>}
     */
    propertyStoreContext {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    propertyStoreType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {IPropertyStore}
     */
    propertyStore {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {PROPERTYKEY}
     */
    propertyKey{
        get {
            if(!this.HasProp("__propertyKey"))
                this.__propertyKey := PROPERTYKEY(32, this)
            return this.__propertyKey
        }
    }
}

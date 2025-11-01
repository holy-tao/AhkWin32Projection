#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PROPERTYKEY.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/ns-audioengineextensionapo-audio_endpoint_property_change_notification
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class AUDIO_ENDPOINT_PROPERTY_CHANGE_NOTIFICATION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {IMMDevice}
     */
    endpoint {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {IPropertyStore}
     */
    propertyStore {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {PROPERTYKEY}
     */
    propertyKey{
        get {
            if(!this.HasProp("__propertyKey"))
                this.__propertyKey := PROPERTYKEY(16, this)
            return this.__propertyKey
        }
    }
}

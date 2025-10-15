#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HTTP_PROPERTY_FLAGS.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_PROTECTION_LEVEL_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {HTTP_PROPERTY_FLAGS}
     */
    Flags{
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := HTTP_PROPERTY_FLAGS(this.ptr + 0)
            return this.__Flags
        }
    }

    /**
     * @type {Integer}
     */
    Level {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}

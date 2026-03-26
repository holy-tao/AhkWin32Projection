#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HTTP_PROPERTY_FLAGS.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_REQUEST_INFO_PROPERTY_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {HTTP_PROPERTY_FLAGS}
     */
    Flags{
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := HTTP_PROPERTY_FLAGS(0, this)
            return this.__Flags
        }
    }

    /**
     * @type {Integer}
     */
    RequestInfoFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}

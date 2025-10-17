#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class GENERIC_XML_TOKEN extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {FILETIME}
     */
    createDate{
        get {
            if(!this.HasProp("__createDate"))
                this.__createDate := FILETIME(0, this)
            return this.__createDate
        }
    }

    /**
     * @type {FILETIME}
     */
    expiryDate{
        get {
            if(!this.HasProp("__expiryDate"))
                this.__expiryDate := FILETIME(8, this)
            return this.__expiryDate
        }
    }

    /**
     * @type {PWSTR}
     */
    xmlToken {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {PWSTR}
     */
    internalTokenReference {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {PWSTR}
     */
    externalTokenReference {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}

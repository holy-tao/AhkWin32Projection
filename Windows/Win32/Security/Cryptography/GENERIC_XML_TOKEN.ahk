#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
                this.__createDate := FILETIME(this.ptr + 0)
            return this.__createDate
        }
    }

    /**
     * @type {FILETIME}
     */
    expiryDate{
        get {
            if(!this.HasProp("__expiryDate"))
                this.__expiryDate := FILETIME(this.ptr + 8)
            return this.__expiryDate
        }
    }

    /**
     * @type {PWSTR}
     */
    xmlToken{
        get {
            if(!this.HasProp("__xmlToken"))
                this.__xmlToken := PWSTR(this.ptr + 16)
            return this.__xmlToken
        }
    }

    /**
     * @type {PWSTR}
     */
    internalTokenReference{
        get {
            if(!this.HasProp("__internalTokenReference"))
                this.__internalTokenReference := PWSTR(this.ptr + 24)
            return this.__internalTokenReference
        }
    }

    /**
     * @type {PWSTR}
     */
    externalTokenReference{
        get {
            if(!this.HasProp("__externalTokenReference"))
                this.__externalTokenReference := PWSTR(this.ptr + 32)
            return this.__externalTokenReference
        }
    }
}

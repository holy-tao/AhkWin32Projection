#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_URL.ahk
#Include .\WS_STRING.ahk

/**
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_NETPIPE_URL extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {WS_URL}
     */
    url{
        get {
            if(!this.HasProp("__url"))
                this.__url := WS_URL(this.ptr + 0)
            return this.__url
        }
    }

    /**
     * @type {WS_STRING}
     */
    host{
        get {
            if(!this.HasProp("__host"))
                this.__host := WS_STRING(this.ptr + 8)
            return this.__host
        }
    }

    /**
     * @type {Integer}
     */
    port {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * @type {WS_STRING}
     */
    portAsString{
        get {
            if(!this.HasProp("__portAsString"))
                this.__portAsString := WS_STRING(this.ptr + 32)
            return this.__portAsString
        }
    }

    /**
     * @type {WS_STRING}
     */
    path{
        get {
            if(!this.HasProp("__path"))
                this.__path := WS_STRING(this.ptr + 48)
            return this.__path
        }
    }

    /**
     * @type {WS_STRING}
     */
    query{
        get {
            if(!this.HasProp("__query"))
                this.__query := WS_STRING(this.ptr + 64)
            return this.__query
        }
    }

    /**
     * @type {WS_STRING}
     */
    fragment{
        get {
            if(!this.HasProp("__fragment"))
                this.__fragment := WS_STRING(this.ptr + 80)
            return this.__fragment
        }
    }
}

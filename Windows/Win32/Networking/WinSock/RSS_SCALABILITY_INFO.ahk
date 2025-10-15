#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class RSS_SCALABILITY_INFO extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * @type {BOOLEAN}
     */
    RssEnabled{
        get {
            if(!this.HasProp("__RssEnabled"))
                this.__RssEnabled := BOOLEAN(this.ptr + 0)
            return this.__RssEnabled
        }
    }
}

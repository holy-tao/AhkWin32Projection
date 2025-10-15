#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class GOPHER_VERONICA_ATTRIBUTE_TYPE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    TreeWalk{
        get {
            if(!this.HasProp("__TreeWalk"))
                this.__TreeWalk := BOOL(this.ptr + 0)
            return this.__TreeWalk
        }
    }
}

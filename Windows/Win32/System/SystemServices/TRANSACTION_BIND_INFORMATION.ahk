#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class TRANSACTION_BIND_INFORMATION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {HANDLE}
     */
    TmHandle{
        get {
            if(!this.HasProp("__TmHandle"))
                this.__TmHandle := HANDLE(0, this)
            return this.__TmHandle
        }
    }
}

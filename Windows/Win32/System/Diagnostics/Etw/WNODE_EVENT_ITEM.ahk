#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HANDLE.ahk
#Include .\WNODE_HEADER.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class WNODE_EVENT_ITEM extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {WNODE_HEADER}
     */
    WnodeHeader{
        get {
            if(!this.HasProp("__WnodeHeader"))
                this.__WnodeHeader := WNODE_HEADER(this.ptr + 0)
            return this.__WnodeHeader
        }
    }
}

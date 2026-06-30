#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\WNODE_HEADER.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
class WNODE_TOO_SMALL extends Win32Struct {
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {WNODE_HEADER}
     */
    WnodeHeader {
        get {
            if(!this.HasProp("__WnodeHeader"))
                this.__WnodeHeader := WNODE_HEADER(0, this)
            return this.__WnodeHeader
        }
    }

    /**
     * @type {Integer}
     */
    SizeNeeded {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}

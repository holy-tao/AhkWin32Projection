#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HANDLE.ahk
#Include .\WNODE_HEADER.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class WNODE_EVENT_REFERENCE extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {WNODE_HEADER}
     */
    WnodeHeader{
        get {
            if(!this.HasProp("__WnodeHeader"))
                this.__WnodeHeader := WNODE_HEADER(0, this)
            return this.__WnodeHeader
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    TargetGuid {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    TargetDataBlockSize {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    TargetInstanceIndex {
        get => NumGet(this, 54, "uint")
        set => NumPut("uint", value, this, 54)
    }

    /**
     * @type {String}
     */
    TargetInstanceName {
        get => StrGet(this.ptr + 54, 0, "UTF-16")
        set => StrPut(value, this.ptr + 54, 0, "UTF-16")
    }
}

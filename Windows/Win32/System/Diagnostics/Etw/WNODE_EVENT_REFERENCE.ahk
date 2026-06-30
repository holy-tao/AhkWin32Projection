#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\WNODE_HEADER.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
class WNODE_EVENT_REFERENCE extends Win32Struct {
    static sizeof => 72

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
     * @type {Guid}
     */
    TargetGuid {
        get {
            if(!this.HasProp("__TargetGuid"))
                this.__TargetGuid := Guid(48, this)
            return this.__TargetGuid
        }
    }

    /**
     * @type {Integer}
     */
    TargetDataBlockSize {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    TargetInstanceIndex {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {String}
     */
    TargetInstanceName {
        get => StrGet(this.ptr + 68, 0, "UTF-16")
        set => StrPut(value, this.ptr + 68, 0, "UTF-16")
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents a node in a wait chain.
 * @see https://learn.microsoft.com/windows/win32/api/wct/ns-wct-waitchain_node_info
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class WAITCHAIN_NODE_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    ObjectType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    ObjectStatus {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {String}
     */
    ObjectName {
        get => StrGet(this.ptr + 8, 127, "UTF-16")
        set => StrPut(value, this.ptr + 8, 127, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    Timeout {
        get => NumGet(this, 264, "int64")
        set => NumPut("int64", value, this, 264)
    }

    /**
     * @type {Integer}
     */
    Alertable {
        get => NumGet(this, 272, "int")
        set => NumPut("int", value, this, 272)
    }

    /**
     * @type {Integer}
     */
    ProcessId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ThreadId {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    WaitTime {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ContextSwitches {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\MPEG_BCS_DEMUX.ahk
#Include .\MPEG_WINSOCK.ahk
#Include .\MPEG_CONTEXT.ahk
#Include ..\..\..\Foundation\BOOL.ahk
#Include .\DSMCC_FILTER_OPTIONS.ahk
#Include .\ATSC_FILTER_OPTIONS.ahk
#Include .\MPEG2_FILTER.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class MPEG_SERVICE_REQUEST extends Win32Struct
{
    static sizeof => 184

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {MPEG_CONTEXT}
     */
    Context{
        get {
            if(!this.HasProp("__Context"))
                this.__Context := MPEG_CONTEXT(this.ptr + 8)
            return this.__Context
        }
    }

    /**
     * @type {Integer}
     */
    Pid {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    TableId {
        get => NumGet(this, 18, "char")
        set => NumPut("char", value, this, 18)
    }

    /**
     * @type {MPEG2_FILTER}
     */
    Filter{
        get {
            if(!this.HasProp("__Filter"))
                this.__Filter := MPEG2_FILTER(this.ptr + 24)
            return this.__Filter
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }
}

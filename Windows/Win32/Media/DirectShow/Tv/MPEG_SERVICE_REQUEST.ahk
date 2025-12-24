#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\MPEG_BCS_DEMUX.ahk
#Include .\MPEG_WINSOCK.ahk
#Include .\MPEG_CONTEXT.ahk
#Include .\DSMCC_FILTER_OPTIONS.ahk
#Include .\ATSC_FILTER_OPTIONS.ahk
#Include .\MPEG2_FILTER.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class MPEG_SERVICE_REQUEST extends Win32Struct
{
    static sizeof => 168

    static packingSize => 4

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
                this.__Context := MPEG_CONTEXT(4, this)
            return this.__Context
        }
    }

    /**
     * @type {Integer}
     */
    Pid {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    TableId {
        get => NumGet(this, 14, "char")
        set => NumPut("char", value, this, 14)
    }

    /**
     * @type {MPEG2_FILTER}
     */
    Filter{
        get {
            if(!this.HasProp("__Filter"))
                this.__Filter := MPEG2_FILTER(16, this)
            return this.__Filter
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 164, "uint")
        set => NumPut("uint", value, this, 164)
    }
}

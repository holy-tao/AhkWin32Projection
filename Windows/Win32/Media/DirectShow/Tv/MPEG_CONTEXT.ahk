#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\MPEG_BCS_DEMUX.ahk
#Include .\MPEG_WINSOCK.ahk

/**
 * The MPEG_CONTEXT structure identifies the source of an MPEG-2 data stream.
 * @see https://docs.microsoft.com/windows/win32/api//mpeg2structs/ns-mpeg2structs-mpeg_context
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class MPEG_CONTEXT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the source type, as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ne-mpeg2structs-mpeg_context_type">MPEG_CONTEXT_TYPE</a> value. Currently, the value must be MPEG_CONTEXT_BCS_DEMUX.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {MPEG_BCS_DEMUX}
     */
    Demux{
        get {
            if(!this.HasProp("__Demux"))
                this.__Demux := MPEG_BCS_DEMUX(this.ptr + 4)
            return this.__Demux
        }
    }

    /**
     * @type {MPEG_WINSOCK}
     */
    Winsock{
        get {
            if(!this.HasProp("__Winsock"))
                this.__Winsock := MPEG_WINSOCK(this.ptr + 4)
            return this.__Winsock
        }
    }
}

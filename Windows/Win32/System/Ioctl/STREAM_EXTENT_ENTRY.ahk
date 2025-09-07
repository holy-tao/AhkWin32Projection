#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RETRIEVAL_POINTERS_BUFFER.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STREAM_EXTENT_ENTRY extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {RETRIEVAL_POINTERS_BUFFER}
     */
    RetrievalPointers{
        get {
            if(!this.HasProp("__RetrievalPointers"))
                this.__RetrievalPointers := RETRIEVAL_POINTERS_BUFFER(this.ptr + 8)
            return this.__RetrievalPointers
        }
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Storage\FileSystem\REPARSE_GUID_DATA_BUFFER.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class REPARSE_DATA_BUFFER_EX extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ExistingReparseTag {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<Guid>}
     */
    ExistingReparseGuid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<REPARSE_DATA_BUFFER>}
     */
    ReparseDataBuffer {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {REPARSE_GUID_DATA_BUFFER}
     */
    ReparseGuidDataBuffer{
        get {
            if(!this.HasProp("__ReparseGuidDataBuffer"))
                this.__ReparseGuidDataBuffer := REPARSE_GUID_DATA_BUFFER(24, this)
            return this.__ReparseGuidDataBuffer
        }
    }
}

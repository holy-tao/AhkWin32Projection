#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Storage\FileSystem\FILE_ID_128.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class CREATE_REDIRECTION_ECP_CONTEXT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {FILE_ID_128}
     */
    FileId{
        get {
            if(!this.HasProp("__FileId"))
                this.__FileId := FILE_ID_128(4, this)
            return this.__FileId
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    VolumeGuid {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}

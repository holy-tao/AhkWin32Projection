#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IORING_REGISTERED_BUFFER.ahk

/**
 * IORING_BUFFER_REF represents a reference to a buffer used in an I/O ring operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/ioringapi/ns-ioringapi-ioring_buffer_ref
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class IORING_BUFFER_REF extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A value from the [IORING_REF_KIND](ne-ioringapi-ioring_ref_kind.md) enumeration specifying the kind of buffer represented by the structure.
     * @type {Integer}
     */
    Kind {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Pointer<Void>}
     */
    Address {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {IORING_REGISTERED_BUFFER}
     */
    IndexAndOffset{
        get {
            if(!this.HasProp("__IndexAndOffset"))
                this.__IndexAndOffset := IORING_REGISTERED_BUFFER(this.ptr + 8)
            return this.__IndexAndOffset
        }
    }
}

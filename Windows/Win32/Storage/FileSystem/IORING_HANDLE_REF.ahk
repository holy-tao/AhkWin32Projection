#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a reference to a file handle used in an I/O ring operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/ioringapi/ns-ioringapi-ioring_handle_ref
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class IORING_HANDLE_REF extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    class HandleUnion extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {Pointer<Void>}
         */
        Handle {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Index {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
    }

    /**
     * A value from the [IORING_REF_KIND](ne-ioringapi-ioring_ref_kind.md) enumeration specifying the kind of handle represented by the structure.
     * @type {Integer}
     */
    Kind {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The handle to a file if the *Kind* value is IORING_REF_RAW.
     * @type {HandleUnion}
     */
    Handle{
        get {
            if(!this.HasProp("__Handle"))
                this.__Handle := %this.__Class%.HandleUnion(this.ptr + 8)
            return this.__Handle
        }
    }
}

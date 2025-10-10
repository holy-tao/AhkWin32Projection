#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IORING_REGISTERED_BUFFER.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class IORING_BUFFER_REF extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    class BufferUnion extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {Pointer<Void>}
         */
        Address {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {IORING_REGISTERED_BUFFER}
         */
        IndexAndOffset{
            get {
                if(!this.HasProp("__IndexAndOffset"))
                    this.__IndexAndOffset := IORING_REGISTERED_BUFFER(this.ptr + 0)
                return this.__IndexAndOffset
            }
        }
    
    }

    /**
     * @type {Integer}
     */
    Kind {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {BufferUnion}
     */
    Buffer{
        get {
            if(!this.HasProp("__Buffer"))
                this.__Buffer := %this.__Class%.BufferUnion(this.ptr + 8)
            return this.__Buffer
        }
    }
}

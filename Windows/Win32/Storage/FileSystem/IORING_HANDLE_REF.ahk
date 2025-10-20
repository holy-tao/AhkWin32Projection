#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
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
         * @type {HANDLE}
         */
        Handle{
            get {
                if(!this.HasProp("__Handle"))
                    this.__Handle := HANDLE(0, this)
                return this.__Handle
            }
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
     * @type {Integer}
     */
    Kind {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {HandleUnion}
     */
    Handle{
        get {
            if(!this.HasProp("__Handle"))
                this.__Handle := %this.__Class%.HandleUnion(8, this)
            return this.__Handle
        }
    }
}

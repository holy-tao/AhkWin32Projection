#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PROCESS_DEVICEMAP_INFORMATION_EX extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    class _Set extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {HANDLE}
         */
        DirectoryHandle{
            get {
                if(!this.HasProp("__DirectoryHandle"))
                    this.__DirectoryHandle := HANDLE(0, this)
                return this.__DirectoryHandle
            }
        }
    
    }

    class _Query extends Win32Struct {
        static sizeof => 36
        static packingSize => 4

        /**
         * @type {Integer}
         */
        DriveMap {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Array<Byte>}
         */
        DriveType{
            get {
                if(!this.HasProp("__DriveTypeProxyArray"))
                    this.__DriveTypeProxyArray := Win32FixedArray(this.ptr + 4, 32, Primitive, "char")
                return this.__DriveTypeProxyArray
            }
        }
    
    }

    /**
     * @type {_Set}
     */
    Set{
        get {
            if(!this.HasProp("__Set"))
                this.__Set := %this.__Class%._Set(0, this)
            return this.__Set
        }
    }

    /**
     * @type {_Query}
     */
    Query{
        get {
            if(!this.HasProp("__Query"))
                this.__Query := %this.__Class%._Query(0, this)
            return this.__Query
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}

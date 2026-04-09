#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PROCESS_DEVICEMAP_INFORMATION extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    class _Set extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {HANDLE}
         */
        DirectoryHandle {
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
         * @type {Array<Integer>}
         */
        DriveType {
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
    Set {
        get {
            if(!this.HasProp("__Set"))
                this.__Set := PROCESS_DEVICEMAP_INFORMATION._Set(0, this)
            return this.__Set
        }
    }

    /**
     * @type {_Query}
     */
    Query {
        get {
            if(!this.HasProp("__Query"))
                this.__Query := PROCESS_DEVICEMAP_INFORMATION._Query(0, this)
            return this.__Query
        }
    }
}

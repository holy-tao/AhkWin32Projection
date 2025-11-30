#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 * @version v4.0.30319
 */
class FLT_TAG_DATA_BUFFER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    FileTag {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    TagDataLength {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    UnparsedNameLength {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    class _SymbolicLinkReparseBuffer extends Win32Struct {
        static sizeof => 16
        static packingSize => 4

        /**
         * @type {Integer}
         */
        SubstituteNameOffset {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        SubstituteNameLength {
            get => NumGet(this, 2, "ushort")
            set => NumPut("ushort", value, this, 2)
        }
    
        /**
         * @type {Integer}
         */
        PrintNameOffset {
            get => NumGet(this, 4, "ushort")
            set => NumPut("ushort", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        PrintNameLength {
            get => NumGet(this, 6, "ushort")
            set => NumPut("ushort", value, this, 6)
        }
    
        /**
         * @type {Integer}
         */
        Flags {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {String}
         */
        PathBuffer {
            get => StrGet(this.ptr + 12, 0, "UTF-16")
            set => StrPut(value, this.ptr + 12, 0, "UTF-16")
        }
    
    }

    class _MountPointReparseBuffer extends Win32Struct {
        static sizeof => 10
        static packingSize => 2

        /**
         * @type {Integer}
         */
        SubstituteNameOffset {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        SubstituteNameLength {
            get => NumGet(this, 2, "ushort")
            set => NumPut("ushort", value, this, 2)
        }
    
        /**
         * @type {Integer}
         */
        PrintNameOffset {
            get => NumGet(this, 4, "ushort")
            set => NumPut("ushort", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        PrintNameLength {
            get => NumGet(this, 6, "ushort")
            set => NumPut("ushort", value, this, 6)
        }
    
        /**
         * @type {String}
         */
        PathBuffer {
            get => StrGet(this.ptr + 8, 0, "UTF-16")
            set => StrPut(value, this.ptr + 8, 0, "UTF-16")
        }
    
    }

    class _GenericReparseBuffer extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * @type {Array<Byte>}
         */
        DataBuffer{
            get {
                if(!this.HasProp("__DataBufferProxyArray"))
                    this.__DataBufferProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
                return this.__DataBufferProxyArray
            }
        }
    
    }

    class _GenericGUIDReparseBuffer extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Pointer<Guid>}
         */
        TagGuid {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Array<Byte>}
         */
        DataBuffer{
            get {
                if(!this.HasProp("__DataBufferProxyArray"))
                    this.__DataBufferProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
                return this.__DataBufferProxyArray
            }
        }
    
    }

    /**
     * @type {_SymbolicLinkReparseBuffer}
     */
    SymbolicLinkReparseBuffer{
        get {
            if(!this.HasProp("__SymbolicLinkReparseBuffer"))
                this.__SymbolicLinkReparseBuffer := %this.__Class%._SymbolicLinkReparseBuffer(8, this)
            return this.__SymbolicLinkReparseBuffer
        }
    }

    /**
     * @type {_MountPointReparseBuffer}
     */
    MountPointReparseBuffer{
        get {
            if(!this.HasProp("__MountPointReparseBuffer"))
                this.__MountPointReparseBuffer := %this.__Class%._MountPointReparseBuffer(8, this)
            return this.__MountPointReparseBuffer
        }
    }

    /**
     * @type {_GenericReparseBuffer}
     */
    GenericReparseBuffer{
        get {
            if(!this.HasProp("__GenericReparseBuffer"))
                this.__GenericReparseBuffer := %this.__Class%._GenericReparseBuffer(8, this)
            return this.__GenericReparseBuffer
        }
    }

    /**
     * @type {_GenericGUIDReparseBuffer}
     */
    GenericGUIDReparseBuffer{
        get {
            if(!this.HasProp("__GenericGUIDReparseBuffer"))
                this.__GenericGUIDReparseBuffer := %this.__Class%._GenericGUIDReparseBuffer(8, this)
            return this.__GenericGUIDReparseBuffer
        }
    }
}

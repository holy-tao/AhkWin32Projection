#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class DVD_COPY_PROTECT_KEY extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    class _Parameters_e__Union extends Win32Struct {
        static sizeof => 8
        static packingSize => 1

        /**
         * @type {HANDLE}
         */
        FileHandle{
            get {
                if(!this.HasProp("__FileHandle"))
                    this.__FileHandle := HANDLE(0, this)
                return this.__FileHandle
            }
        }
    
        /**
         * @type {Integer}
         */
        TitleOffset {
            get => NumGet(this, 0, "int64")
            set => NumPut("int64", value, this, 0)
        }
    
    }

    class _Parameters_e__Union extends Win32Struct {
        static sizeof => 8
        static packingSize => 1

        /**
         * @type {HANDLE}
         */
        FileHandle{
            get {
                if(!this.HasProp("__FileHandle"))
                    this.__FileHandle := HANDLE(0, this)
                return this.__FileHandle
            }
        }
    
        /**
         * @type {Integer}
         */
        TitleOffset {
            get => NumGet(this, 0, "int64")
            set => NumPut("int64", value, this, 0)
        }
    
    }

    /**
     * @type {Integer}
     */
    KeyLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    SessionId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    KeyType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    KeyFlags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {_Parameters_e__Union}
     */
    Parameters{
        get {
            if(!this.HasProp("__Parameters"))
                this.__Parameters := %this.__Class%._Parameters_e__Union(16, this)
            return this.__Parameters
        }
    }

    /**
     * @type {Array<Byte>}
     */
    KeyData{
        get {
            if(!this.HasProp("__KeyDataProxyArray"))
                this.__KeyDataProxyArray := Win32FixedArray(this.ptr + 24, 1, Primitive, "char")
            return this.__KeyDataProxyArray
        }
    }
}

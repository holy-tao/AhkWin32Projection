#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-storage-schema
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_STORAGE_SCHEMA extends Win32Struct
{
    static sizeof => 1056

    static packingSize => 8

    /**
     * @type {Integer}
     */
    BiometricFactor {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Guid>}
     */
    DatabaseId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Guid>}
     */
    DataFormat {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Attributes {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Array<UInt16>}
     */
    FilePath{
        get {
            if(!this.HasProp("__FilePathProxyArray"))
                this.__FilePathProxyArray := Win32FixedArray(this.ptr + 28, 256, Primitive, "ushort")
            return this.__FilePathProxyArray
        }
    }

    /**
     * @type {Array<UInt16>}
     */
    ConnectionString{
        get {
            if(!this.HasProp("__ConnectionStringProxyArray"))
                this.__ConnectionStringProxyArray := Win32FixedArray(this.ptr + 540, 256, Primitive, "ushort")
            return this.__ConnectionStringProxyArray
        }
    }
}

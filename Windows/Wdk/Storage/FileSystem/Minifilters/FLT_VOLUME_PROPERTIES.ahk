#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Win32\Foundation\UNICODE_STRING.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 * @version v4.0.30319
 */
class FLT_VOLUME_PROPERTIES extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    DeviceType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    DeviceCharacteristics {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    DeviceObjectFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    AlignmentRequirement {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    SectorSize {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * @type {UNICODE_STRING}
     */
    FileSystemDriverName{
        get {
            if(!this.HasProp("__FileSystemDriverName"))
                this.__FileSystemDriverName := UNICODE_STRING(24, this)
            return this.__FileSystemDriverName
        }
    }

    /**
     * @type {UNICODE_STRING}
     */
    FileSystemDeviceName{
        get {
            if(!this.HasProp("__FileSystemDeviceName"))
                this.__FileSystemDeviceName := UNICODE_STRING(40, this)
            return this.__FileSystemDeviceName
        }
    }

    /**
     * @type {UNICODE_STRING}
     */
    RealDeviceName{
        get {
            if(!this.HasProp("__RealDeviceName"))
                this.__RealDeviceName := UNICODE_STRING(56, this)
            return this.__RealDeviceName
        }
    }
}

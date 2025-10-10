#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CLS_CONTAINER_INFORMATION extends Win32Struct
{
    static sizeof => 576

    static packingSize => 8

    /**
     * @type {Integer}
     */
    FileAttributes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    CreationTime {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    LastAccessTime {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    LastWriteTime {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    ContainerSize {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    FileNameActualLength {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    FileNameLength {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {String}
     */
    FileName {
        get => StrGet(this.ptr + 48, 255, "UTF-16")
        set => StrPut(value, this.ptr + 48, 255, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    State {
        get => NumGet(this, 560, "uint")
        set => NumPut("uint", value, this, 560)
    }

    /**
     * @type {Integer}
     */
    PhysicalContainerId {
        get => NumGet(this, 564, "uint")
        set => NumPut("uint", value, this, 564)
    }

    /**
     * @type {Integer}
     */
    LogicalContainerId {
        get => NumGet(this, 568, "uint")
        set => NumPut("uint", value, this, 568)
    }
}

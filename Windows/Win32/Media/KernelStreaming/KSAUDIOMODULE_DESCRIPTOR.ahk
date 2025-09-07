#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSAUDIOMODULE_DESCRIPTOR extends Win32Struct
{
    static sizeof => 280

    static packingSize => 8

    /**
     * @type {Pointer<Guid>}
     */
    ClassId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    InstanceId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    VersionMajor {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    VersionMinor {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {String}
     */
    Name {
        get => StrGet(this.ptr + 20, 127, "UTF-16")
        set => StrPut(value, this.ptr + 20, 127, "UTF-16")
    }
}

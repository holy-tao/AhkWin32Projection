#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 * @charset Unicode
 */
class MIDIOUTCAPS2W extends Win32Struct
{
    static sizeof => 108

    static packingSize => 1

    /**
     * @type {Integer}
     */
    wMid {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    wPid {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    vDriverVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {String}
     */
    szPname {
        get => StrGet(this.ptr + 8, 31, "UTF-16")
        set => StrPut(value, this.ptr + 8, 31, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    wTechnology {
        get => NumGet(this, 72, "ushort")
        set => NumPut("ushort", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    wVoices {
        get => NumGet(this, 74, "ushort")
        set => NumPut("ushort", value, this, 74)
    }

    /**
     * @type {Integer}
     */
    wNotes {
        get => NumGet(this, 76, "ushort")
        set => NumPut("ushort", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    wChannelMask {
        get => NumGet(this, 78, "ushort")
        set => NumPut("ushort", value, this, 78)
    }

    /**
     * @type {Integer}
     */
    dwSupport {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Pointer<Guid>}
     */
    ManufacturerGuid {
        get => NumGet(this, 84, "ptr")
        set => NumPut("ptr", value, this, 84)
    }

    /**
     * @type {Pointer<Guid>}
     */
    ProductGuid {
        get => NumGet(this, 92, "ptr")
        set => NumPut("ptr", value, this, 92)
    }

    /**
     * @type {Pointer<Guid>}
     */
    NameGuid {
        get => NumGet(this, 100, "ptr")
        set => NumPut("ptr", value, this, 100)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 * @charset ANSI
 */
class MIDIOUTCAPS2A extends Win32Struct
{
    static sizeof => 76

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
     * @type {Array<SByte>}
     */
    szPname{
        get {
            if(!this.HasProp("__szPnameProxyArray"))
                this.__szPnameProxyArray := Win32FixedArray(this.ptr + 8, 32, Primitive, "char")
            return this.__szPnameProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    wTechnology {
        get => NumGet(this, 40, "ushort")
        set => NumPut("ushort", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    wVoices {
        get => NumGet(this, 42, "ushort")
        set => NumPut("ushort", value, this, 42)
    }

    /**
     * @type {Integer}
     */
    wNotes {
        get => NumGet(this, 44, "ushort")
        set => NumPut("ushort", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    wChannelMask {
        get => NumGet(this, 46, "ushort")
        set => NumPut("ushort", value, this, 46)
    }

    /**
     * @type {Integer}
     */
    dwSupport {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Pointer<Guid>}
     */
    ManufacturerGuid {
        get => NumGet(this, 52, "ptr")
        set => NumPut("ptr", value, this, 52)
    }

    /**
     * @type {Pointer<Guid>}
     */
    ProductGuid {
        get => NumGet(this, 60, "ptr")
        set => NumPut("ptr", value, this, 60)
    }

    /**
     * @type {Pointer<Guid>}
     */
    NameGuid {
        get => NumGet(this, 68, "ptr")
        set => NumPut("ptr", value, this, 68)
    }
}

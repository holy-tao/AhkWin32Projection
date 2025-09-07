#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class EXT_FIND_FILE extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    FileName{
        get {
            if(!this.HasProp("__FileName"))
                this.__FileName := PWSTR(this.ptr + 0)
            return this.__FileName
        }
    }

    /**
     * @type {Integer}
     */
    IndexedSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ImageTimeDateStamp {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ImageCheckSum {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Pointer<Void>}
     */
    ExtraInfo {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    ExtraInfoSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Pointer<Void>}
     */
    FileMapping {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    FileMappingSize {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {HANDLE}
     */
    FileHandle{
        get {
            if(!this.HasProp("__FileHandle"))
                this.__FileHandle := HANDLE(this.ptr + 56)
            return this.__FileHandle
        }
    }

    /**
     * @type {PWSTR}
     */
    FoundFileName{
        get {
            if(!this.HasProp("__FoundFileName"))
                this.__FoundFileName := PWSTR(this.ptr + 64)
            return this.__FoundFileName
        }
    }

    /**
     * @type {Integer}
     */
    FoundFileNameChars {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }
}

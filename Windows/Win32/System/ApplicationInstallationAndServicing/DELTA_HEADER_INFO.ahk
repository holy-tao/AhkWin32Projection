#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\DELTA_HASH.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class DELTA_HEADER_INFO extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {Integer}
     */
    FileTypeSet {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    FileType {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * @type {Pointer}
     */
    TargetSize {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {FILETIME}
     */
    TargetFileTime{
        get {
            if(!this.HasProp("__TargetFileTime"))
                this.__TargetFileTime := FILETIME(32, this)
            return this.__TargetFileTime
        }
    }

    /**
     * @type {Integer}
     */
    TargetHashAlgId {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {DELTA_HASH}
     */
    TargetHash{
        get {
            if(!this.HasProp("__TargetHash"))
                this.__TargetHash := DELTA_HASH(48, this)
            return this.__TargetHash
        }
    }
}

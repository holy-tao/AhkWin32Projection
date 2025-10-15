#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * Describes the tape drive. It is used by the SetTapeParametersfunction.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-tape_set_drive_parameters
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class TAPE_SET_DRIVE_PARAMETERS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * If this member is <b>TRUE</b>, hardware error correction is supported. Otherwise, it is not.
     * @type {BOOLEAN}
     */
    ECC{
        get {
            if(!this.HasProp("__ECC"))
                this.__ECC := BOOLEAN(this.ptr + 0)
            return this.__ECC
        }
    }

    /**
     * If this member is <b>TRUE</b>, hardware data compression is enabled. Otherwise, it is disabled.
     * @type {BOOLEAN}
     */
    Compression{
        get {
            if(!this.HasProp("__Compression"))
                this.__Compression := BOOLEAN(this.ptr + 1)
            return this.__Compression
        }
    }

    /**
     * If this member is <b>TRUE</b>, data padding is enabled. Otherwise, it is disabled. Data padding keeps the tape streaming at a constant speed.
     * @type {BOOLEAN}
     */
    DataPadding{
        get {
            if(!this.HasProp("__DataPadding"))
                this.__DataPadding := BOOLEAN(this.ptr + 2)
            return this.__DataPadding
        }
    }

    /**
     * If this member is <b>TRUE</b>, setmark reporting is enabled. Otherwise, it is disabled.
     * @type {BOOLEAN}
     */
    ReportSetmarks{
        get {
            if(!this.HasProp("__ReportSetmarks"))
                this.__ReportSetmarks := BOOLEAN(this.ptr + 3)
            return this.__ReportSetmarks
        }
    }

    /**
     * Number of bytes between the end-of-tape warning and the physical end of the tape.
     * @type {Integer}
     */
    EOTWarningZoneSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}

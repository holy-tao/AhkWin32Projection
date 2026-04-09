#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WER_REPORT_SIGNATURE.ahk
#Include .\WER_REPORT_PARAMETER.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * @namespace Windows.Win32.System.ErrorReporting
 */
class WER_REPORT_METADATA_V1 extends Win32Struct {
    static sizeof => 7944

    static packingSize => 8

    /**
     * @type {WER_REPORT_SIGNATURE}
     */
    Signature {
        get {
            if(!this.HasProp("__Signature"))
                this.__Signature := WER_REPORT_SIGNATURE(0, this)
            return this.__Signature
        }
    }

    /**
     * @type {Pointer}
     */
    BucketId {
        get => NumGet(this, 7912, "ptr")
        set => NumPut("ptr", value, this, 7912)
    }

    /**
     * @type {Pointer}
     */
    ReportId {
        get => NumGet(this, 7920, "ptr")
        set => NumPut("ptr", value, this, 7920)
    }

    /**
     * @type {FILETIME}
     */
    CreationTime {
        get {
            if(!this.HasProp("__CreationTime"))
                this.__CreationTime := FILETIME(7928, this)
            return this.__CreationTime
        }
    }

    /**
     * @type {Integer}
     */
    SizeInBytes {
        get => NumGet(this, 7936, "uint")
        set => NumPut("uint", value, this, 7936)
    }
}

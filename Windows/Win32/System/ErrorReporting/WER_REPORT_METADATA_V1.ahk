#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WER_REPORT_PARAMETER.ahk
#Include .\WER_REPORT_SIGNATURE.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * @namespace Windows.Win32.System.ErrorReporting
 * @version v4.0.30319
 */
class WER_REPORT_METADATA_V1 extends Win32Struct
{
    static sizeof => 248

    static packingSize => 8

    /**
     * @type {WER_REPORT_SIGNATURE}
     */
    Signature{
        get {
            if(!this.HasProp("__Signature"))
                this.__Signature := WER_REPORT_SIGNATURE(this.ptr + 0)
            return this.__Signature
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    BucketId {
        get => NumGet(this, 216, "ptr")
        set => NumPut("ptr", value, this, 216)
    }

    /**
     * @type {Pointer<Guid>}
     */
    ReportId {
        get => NumGet(this, 224, "ptr")
        set => NumPut("ptr", value, this, 224)
    }

    /**
     * @type {FILETIME}
     */
    CreationTime{
        get {
            if(!this.HasProp("__CreationTime"))
                this.__CreationTime := FILETIME(this.ptr + 232)
            return this.__CreationTime
        }
    }

    /**
     * @type {Integer}
     */
    SizeInBytes {
        get => NumGet(this, 240, "uint")
        set => NumPut("uint", value, this, 240)
    }
}

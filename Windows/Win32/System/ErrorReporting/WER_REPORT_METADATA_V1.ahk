#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WER_REPORT_SIGNATURE.ahk
#Include .\WER_REPORT_PARAMETER.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * @namespace Windows.Win32.System.ErrorReporting
 */
class WER_REPORT_METADATA_V1 extends Win32Struct {
    static sizeof => 7960

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
     * @type {Guid}
     */
    BucketId {
        get {
            if(!this.HasProp("__BucketId"))
                this.__BucketId := Guid(7912, this)
            return this.__BucketId
        }
    }

    /**
     * @type {Guid}
     */
    ReportId {
        get {
            if(!this.HasProp("__ReportId"))
                this.__ReportId := Guid(7928, this)
            return this.__ReportId
        }
    }

    /**
     * @type {FILETIME}
     */
    CreationTime {
        get {
            if(!this.HasProp("__CreationTime"))
                this.__CreationTime := FILETIME(7944, this)
            return this.__CreationTime
        }
    }

    /**
     * @type {Integer}
     */
    SizeInBytes {
        get => NumGet(this, 7952, "uint")
        set => NumPut("uint", value, this, 7952)
    }
}

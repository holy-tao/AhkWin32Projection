#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WER_REPORT_SIGNATURE.ahk
#Include .\WER_REPORT_PARAMETER.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * @namespace Windows.Win32.System.ErrorReporting
 */
class WER_REPORT_METADATA_V3 extends Win32Struct {
    static sizeof => 11104

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

    /**
     * @type {String}
     */
    CabId {
        get => StrGet(this.ptr + 7960, 259, "UTF-16")
        set => StrPut(value, this.ptr + 7960, 259, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    ReportStatus {
        get => NumGet(this, 8480, "uint")
        set => NumPut("uint", value, this, 8480)
    }

    /**
     * @type {Guid}
     */
    ReportIntegratorId {
        get {
            if(!this.HasProp("__ReportIntegratorId"))
                this.__ReportIntegratorId := Guid(8484, this)
            return this.__ReportIntegratorId
        }
    }

    /**
     * @type {Integer}
     */
    NumberOfFiles {
        get => NumGet(this, 8500, "uint")
        set => NumPut("uint", value, this, 8500)
    }

    /**
     * @type {Integer}
     */
    SizeOfFileNames {
        get => NumGet(this, 8504, "uint")
        set => NumPut("uint", value, this, 8504)
    }

    /**
     * @type {PWSTR}
     */
    FileNames {
        get => NumGet(this, 8512, "ptr")
        set => NumPut("ptr", value, this, 8512)
    }

    /**
     * @type {String}
     */
    FriendlyEventName {
        get => StrGet(this.ptr + 8520, 127, "UTF-16")
        set => StrPut(value, this.ptr + 8520, 127, "UTF-16")
    }

    /**
     * @type {String}
     */
    ApplicationName {
        get => StrGet(this.ptr + 8776, 127, "UTF-16")
        set => StrPut(value, this.ptr + 8776, 127, "UTF-16")
    }

    /**
     * @type {String}
     */
    ApplicationPath {
        get => StrGet(this.ptr + 9032, 259, "UTF-16")
        set => StrPut(value, this.ptr + 9032, 259, "UTF-16")
    }

    /**
     * @type {String}
     */
    Description {
        get => StrGet(this.ptr + 9552, 511, "UTF-16")
        set => StrPut(value, this.ptr + 9552, 511, "UTF-16")
    }

    /**
     * @type {String}
     */
    BucketIdString {
        get => StrGet(this.ptr + 10576, 259, "UTF-16")
        set => StrPut(value, this.ptr + 10576, 259, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    LegacyBucketId {
        get => NumGet(this, 11096, "uint")
        set => NumPut("uint", value, this, 11096)
    }
}

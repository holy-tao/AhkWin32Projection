#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WER_REPORT_SIGNATURE.ahk
#Include .\WER_REPORT_PARAMETER.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * @namespace Windows.Win32.System.ErrorReporting
 */
class WER_REPORT_METADATA_V3 extends Win32Struct {
    static sizeof => 11080

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

    /**
     * @type {String}
     */
    CabId {
        get => StrGet(this.ptr + 7944, 259, "UTF-16")
        set => StrPut(value, this.ptr + 7944, 259, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    ReportStatus {
        get => NumGet(this, 8464, "uint")
        set => NumPut("uint", value, this, 8464)
    }

    /**
     * @type {Pointer}
     */
    ReportIntegratorId {
        get => NumGet(this, 8472, "ptr")
        set => NumPut("ptr", value, this, 8472)
    }

    /**
     * @type {Integer}
     */
    NumberOfFiles {
        get => NumGet(this, 8480, "uint")
        set => NumPut("uint", value, this, 8480)
    }

    /**
     * @type {Integer}
     */
    SizeOfFileNames {
        get => NumGet(this, 8484, "uint")
        set => NumPut("uint", value, this, 8484)
    }

    /**
     * @type {PWSTR}
     */
    FileNames {
        get => NumGet(this, 8488, "ptr")
        set => NumPut("ptr", value, this, 8488)
    }

    /**
     * @type {String}
     */
    FriendlyEventName {
        get => StrGet(this.ptr + 8496, 127, "UTF-16")
        set => StrPut(value, this.ptr + 8496, 127, "UTF-16")
    }

    /**
     * @type {String}
     */
    ApplicationName {
        get => StrGet(this.ptr + 8752, 127, "UTF-16")
        set => StrPut(value, this.ptr + 8752, 127, "UTF-16")
    }

    /**
     * @type {String}
     */
    ApplicationPath {
        get => StrGet(this.ptr + 9008, 259, "UTF-16")
        set => StrPut(value, this.ptr + 9008, 259, "UTF-16")
    }

    /**
     * @type {String}
     */
    Description {
        get => StrGet(this.ptr + 9528, 511, "UTF-16")
        set => StrPut(value, this.ptr + 9528, 511, "UTF-16")
    }

    /**
     * @type {String}
     */
    BucketIdString {
        get => StrGet(this.ptr + 10552, 259, "UTF-16")
        set => StrPut(value, this.ptr + 10552, 259, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    LegacyBucketId {
        get => NumGet(this, 11072, "uint")
        set => NumPut("uint", value, this, 11072)
    }
}

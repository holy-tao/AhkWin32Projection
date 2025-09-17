#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WER_REPORT_PARAMETER.ahk
#Include .\WER_REPORT_SIGNATURE.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * @namespace Windows.Win32.System.ErrorReporting
 * @version v4.0.30319
 */
class WER_REPORT_METADATA_V3 extends Win32Struct
{
    static sizeof => 3384

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

    /**
     * @type {String}
     */
    CabId {
        get => StrGet(this.ptr + 248, 259, "UTF-16")
        set => StrPut(value, this.ptr + 248, 259, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    ReportStatus {
        get => NumGet(this, 768, "uint")
        set => NumPut("uint", value, this, 768)
    }

    /**
     * @type {Pointer<Guid>}
     */
    ReportIntegratorId {
        get => NumGet(this, 776, "ptr")
        set => NumPut("ptr", value, this, 776)
    }

    /**
     * @type {Integer}
     */
    NumberOfFiles {
        get => NumGet(this, 784, "uint")
        set => NumPut("uint", value, this, 784)
    }

    /**
     * @type {Integer}
     */
    SizeOfFileNames {
        get => NumGet(this, 788, "uint")
        set => NumPut("uint", value, this, 788)
    }

    /**
     * @type {Pointer<Char>}
     */
    FileNames {
        get => NumGet(this, 792, "ptr")
        set => NumPut("ptr", value, this, 792)
    }

    /**
     * @type {String}
     */
    FriendlyEventName {
        get => StrGet(this.ptr + 800, 127, "UTF-16")
        set => StrPut(value, this.ptr + 800, 127, "UTF-16")
    }

    /**
     * @type {String}
     */
    ApplicationName {
        get => StrGet(this.ptr + 1056, 127, "UTF-16")
        set => StrPut(value, this.ptr + 1056, 127, "UTF-16")
    }

    /**
     * @type {String}
     */
    ApplicationPath {
        get => StrGet(this.ptr + 1312, 259, "UTF-16")
        set => StrPut(value, this.ptr + 1312, 259, "UTF-16")
    }

    /**
     * @type {String}
     */
    Description {
        get => StrGet(this.ptr + 1832, 511, "UTF-16")
        set => StrPut(value, this.ptr + 1832, 511, "UTF-16")
    }

    /**
     * @type {String}
     */
    BucketIdString {
        get => StrGet(this.ptr + 2856, 259, "UTF-16")
        set => StrPut(value, this.ptr + 2856, 259, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    LegacyBucketId {
        get => NumGet(this, 3376, "uint")
        set => NumPut("uint", value, this, 3376)
    }
}

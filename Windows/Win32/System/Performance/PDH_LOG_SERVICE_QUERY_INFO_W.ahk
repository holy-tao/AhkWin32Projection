#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 * @charset Unicode
 */
class PDH_LOG_SERVICE_QUERY_INFO_W extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwLogQuota {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    szLogFileCaption{
        get {
            if(!this.HasProp("__szLogFileCaption"))
                this.__szLogFileCaption := PWSTR(this.ptr + 16)
            return this.__szLogFileCaption
        }
    }

    /**
     * @type {PWSTR}
     */
    szDefaultDir{
        get {
            if(!this.HasProp("__szDefaultDir"))
                this.__szDefaultDir := PWSTR(this.ptr + 24)
            return this.__szDefaultDir
        }
    }

    /**
     * @type {PWSTR}
     */
    szBaseFileName{
        get {
            if(!this.HasProp("__szBaseFileName"))
                this.__szBaseFileName := PWSTR(this.ptr + 32)
            return this.__szBaseFileName
        }
    }

    /**
     * @type {Integer}
     */
    dwFileType {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    PdlAutoNameInterval {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    PdlAutoNameUnits {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {PWSTR}
     */
    PdlCommandFilename{
        get {
            if(!this.HasProp("__PdlCommandFilename"))
                this.__PdlCommandFilename := PWSTR(this.ptr + 56)
            return this.__PdlCommandFilename
        }
    }

    /**
     * @type {PWSTR}
     */
    PdlCounterList{
        get {
            if(!this.HasProp("__PdlCounterList"))
                this.__PdlCounterList := PWSTR(this.ptr + 64)
            return this.__PdlCounterList
        }
    }

    /**
     * @type {Integer}
     */
    PdlAutoNameFormat {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    PdlSampleInterval {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {FILETIME}
     */
    PdlLogStartTime{
        get {
            if(!this.HasProp("__PdlLogStartTime"))
                this.__PdlLogStartTime := FILETIME(this.ptr + 80)
            return this.__PdlLogStartTime
        }
    }

    /**
     * @type {FILETIME}
     */
    PdlLogEndTime{
        get {
            if(!this.HasProp("__PdlLogEndTime"))
                this.__PdlLogEndTime := FILETIME(this.ptr + 88)
            return this.__PdlLogEndTime
        }
    }

    /**
     * @type {Integer}
     */
    TlNumberOfBuffers {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    TlMinimumBuffers {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    TlMaximumBuffers {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    TlFreeBuffers {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    TlBufferSize {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    TlEventsLost {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    TlLoggerThreadId {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    TlBuffersWritten {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    TlLogHandle {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {PWSTR}
     */
    TlLogFileName{
        get {
            if(!this.HasProp("__TlLogFileName"))
                this.__TlLogFileName := PWSTR(this.ptr + 88)
            return this.__TlLogFileName
        }
    }
}

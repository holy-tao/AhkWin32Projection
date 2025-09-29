#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\SYSTEMTIME.ahk
#Include ..\..\Time\TIME_ZONE_INFORMATION.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class TRACE_LOGFILE_HEADER64 extends Win32Struct
{
    static sizeof => 280

    static packingSize => 8

    /**
     * @type {Integer}
     */
    BufferSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    class _VersionDetail extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * @type {Integer}
         */
        MajorVersion {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        MinorVersion {
            get => NumGet(this, 1, "char")
            set => NumPut("char", value, this, 1)
        }
    
        /**
         * @type {Integer}
         */
        SubVersion {
            get => NumGet(this, 2, "char")
            set => NumPut("char", value, this, 2)
        }
    
        /**
         * @type {Integer}
         */
        SubMinorVersion {
            get => NumGet(this, 3, "char")
            set => NumPut("char", value, this, 3)
        }
    
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {_VersionDetail}
     */
    VersionDetail{
        get {
            if(!this.HasProp("__VersionDetail"))
                this.__VersionDetail := %this.__Class%._VersionDetail(this.ptr + 4)
            return this.__VersionDetail
        }
    }

    /**
     * @type {Integer}
     */
    ProviderVersion {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    NumberOfProcessors {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    EndTime {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    TimerResolution {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    MaximumFileSize {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    LogFileMode {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    BuffersWritten {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Pointer<Guid>}
     */
    LogInstanceGuid {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    StartBuffers {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    PointerSize {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    EventsLost {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    CpuSpeedInMHz {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    LoggerName {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    LogFileName {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {TIME_ZONE_INFORMATION}
     */
    TimeZone{
        get {
            if(!this.HasProp("__TimeZone"))
                this.__TimeZone := TIME_ZONE_INFORMATION(this.ptr + 64)
            return this.__TimeZone
        }
    }

    /**
     * @type {Integer}
     */
    BootTime {
        get => NumGet(this, 248, "int64")
        set => NumPut("int64", value, this, 248)
    }

    /**
     * @type {Integer}
     */
    PerfFreq {
        get => NumGet(this, 256, "int64")
        set => NumPut("int64", value, this, 256)
    }

    /**
     * @type {Integer}
     */
    StartTime {
        get => NumGet(this, 264, "int64")
        set => NumPut("int64", value, this, 264)
    }

    /**
     * @type {Integer}
     */
    ReservedFlags {
        get => NumGet(this, 272, "uint")
        set => NumPut("uint", value, this, 272)
    }

    /**
     * @type {Integer}
     */
    BuffersLost {
        get => NumGet(this, 276, "uint")
        set => NumPut("uint", value, this, 276)
    }
}

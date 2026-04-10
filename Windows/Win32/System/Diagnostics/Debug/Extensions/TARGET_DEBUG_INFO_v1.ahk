#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk
#Include .\OS_INFO_v1.ahk
#Include .\OS_TYPE.ahk
#Include .\CPU_INFO_v1.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_ALL.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_ALPHA.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_AMD64.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_IA64.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_X86.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_ARM.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_ARM64.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class TARGET_DEBUG_INFO_v1 extends Win32Struct {
    static sizeof => 9248

    static packingSize => 8

    /**
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Id {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Source {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    EntryDate {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    SysUpTime {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    AppUpTime {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    CrashTime {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    Mode {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {OS_INFO_v1}
     */
    OsInfo {
        get {
            if(!this.HasProp("__OsInfo"))
                this.__OsInfo := OS_INFO_v1(64, this)
            return this.__OsInfo
        }
    }

    /**
     * @type {CPU_INFO_v1}
     */
    Cpu {
        get {
            if(!this.HasProp("__Cpu"))
                this.__Cpu := CPU_INFO_v1(256, this)
            return this.__Cpu
        }
    }

    /**
     * @type {String}
     */
    DumpFile {
        get => StrGet(this.ptr + 4880, 259, "UTF-8")
        set => StrPut(value, this.ptr + 4880, 259, "UTF-8")
    }

    /**
     * @type {Pointer<Void>}
     */
    FailureData {
        get => NumGet(this, 5144, "ptr")
        set => NumPut("ptr", value, this, 5144)
    }

    /**
     * @type {String}
     */
    StackTr {
        get => StrGet(this.ptr + 5152, 4095, "UTF-8")
        set => StrPut(value, this.ptr + 5152, 4095, "UTF-8")
    }
}

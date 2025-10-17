#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk
#Include .\OS_INFO_v1.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_ALPHA.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_AMD64.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_IA64.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_X86.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_ARM.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_ARM64.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_ALL.ahk
#Include .\CPU_INFO_v1.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class TARGET_DEBUG_INFO_v1 extends Win32Struct
{
    static sizeof => 9416

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
    OsInfo{
        get {
            if(!this.HasProp("__OsInfo"))
                this.__OsInfo := OS_INFO_v1(64, this)
            return this.__OsInfo
        }
    }

    /**
     * @type {CPU_INFO_v1}
     */
    Cpu{
        get {
            if(!this.HasProp("__Cpu"))
                this.__Cpu := CPU_INFO_v1(416, this)
            return this.__Cpu
        }
    }

    /**
     * @type {String}
     */
    DumpFile {
        get => StrGet(this.ptr + 696, 259, "UTF-16")
        set => StrPut(value, this.ptr + 696, 259, "UTF-16")
    }

    /**
     * @type {Pointer<Void>}
     */
    FailureData {
        get => NumGet(this, 1216, "ptr")
        set => NumPut("ptr", value, this, 1216)
    }

    /**
     * @type {String}
     */
    StackTr {
        get => StrGet(this.ptr + 1224, 4095, "UTF-16")
        set => StrPut(value, this.ptr + 1224, 4095, "UTF-16")
    }
}

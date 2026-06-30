#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_IA64.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_X86.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_ARM.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_ALPHA.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_AMD64.ahk
#Include .\OS_INFO.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_ALL.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_ARM64.ahk
#Include .\CPU_INFO_v2.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class TARGET_DEBUG_INFO_v2 extends Win32Struct {
    static sizeof => 185176

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
    EntryDate {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    DebugeeClass {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    SysUpTime {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    AppUpTime {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    CrashTime {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {OS_INFO}
     */
    OsInfo {
        get {
            if(!this.HasProp("__OsInfo"))
                this.__OsInfo := OS_INFO(48, this)
            return this.__OsInfo
        }
    }

    /**
     * @type {CPU_INFO_v2}
     */
    Cpu {
        get {
            if(!this.HasProp("__Cpu"))
                this.__Cpu := CPU_INFO_v2(576, this)
            return this.__Cpu
        }
    }

    /**
     * @type {String}
     */
    DumpFile {
        get => StrGet(this.ptr + 184912, 259, "UTF-8")
        set => StrPut(value, this.ptr + 184912, 259, "UTF-8")
    }
}

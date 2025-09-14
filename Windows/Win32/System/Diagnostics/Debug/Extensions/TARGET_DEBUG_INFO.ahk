#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk
#Include .\OS_INFO.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_ALPHA.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_AMD64.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_IA64.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_X86.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_ARM.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_ARM64.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_ALL.ahk
#Include .\CPU_INFO.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class TARGET_DEBUG_INFO extends Win32Struct
{
    static sizeof => 17248

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
    OsInfo{
        get {
            if(!this.HasProp("__OsInfo"))
                this.__OsInfo := OS_INFO(this.ptr + 48)
            return this.__OsInfo
        }
    }

    /**
     * @type {CPU_INFO}
     */
    Cpu{
        get {
            if(!this.HasProp("__Cpu"))
                this.__Cpu := CPU_INFO(this.ptr + 576)
            return this.__Cpu
        }
    }

    /**
     * @type {Array<SByte>}
     */
    DumpFile{
        get {
            if(!this.HasProp("__DumpFileProxyArray"))
                this.__DumpFileProxyArray := Win32FixedArray(this.ptr + 16984, 260, Primitive, "char")
            return this.__DumpFileProxyArray
        }
    }
}

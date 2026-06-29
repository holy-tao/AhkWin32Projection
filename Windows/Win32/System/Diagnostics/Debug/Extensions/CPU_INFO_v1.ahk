#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_IA64.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_X86.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_ARM.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_ALPHA.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_AMD64.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_ALL.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_ARM64.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class CPU_INFO_v1 extends Win32Struct {
    static sizeof => 4624

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NumCPUs {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    CurrentProc {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {DEBUG_PROCESSOR_IDENTIFICATION_ALL}
     */
    ProcInfo {
        get {
            if(!this.HasProp("__ProcInfoProxyArray"))
                this.__ProcInfoProxyArray := Win32FixedArray(this.ptr + 12, 32, DEBUG_PROCESSOR_IDENTIFICATION_ALL, "")
            return this.__ProcInfoProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Mhz {
        get => NumGet(this, 4620, "uint")
        set => NumPut("uint", value, this, 4620)
    }
}

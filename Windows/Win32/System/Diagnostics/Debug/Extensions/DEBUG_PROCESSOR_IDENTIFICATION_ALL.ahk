#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_ALPHA.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_AMD64.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_IA64.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_X86.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_ARM.ahk
#Include .\DEBUG_PROCESSOR_IDENTIFICATION_ARM64.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class DEBUG_PROCESSOR_IDENTIFICATION_ALL extends Win32Struct
{
    static sizeof => 232

    static packingSize => 8

    /**
     * @type {DEBUG_PROCESSOR_IDENTIFICATION_ALPHA}
     */
    Alpha{
        get {
            if(!this.HasProp("__Alpha"))
                this.__Alpha := DEBUG_PROCESSOR_IDENTIFICATION_ALPHA(this.ptr + 0)
            return this.__Alpha
        }
    }

    /**
     * @type {DEBUG_PROCESSOR_IDENTIFICATION_AMD64}
     */
    Amd64{
        get {
            if(!this.HasProp("__Amd64"))
                this.__Amd64 := DEBUG_PROCESSOR_IDENTIFICATION_AMD64(this.ptr + 0)
            return this.__Amd64
        }
    }

    /**
     * @type {DEBUG_PROCESSOR_IDENTIFICATION_IA64}
     */
    Ia64{
        get {
            if(!this.HasProp("__Ia64"))
                this.__Ia64 := DEBUG_PROCESSOR_IDENTIFICATION_IA64(this.ptr + 0)
            return this.__Ia64
        }
    }

    /**
     * @type {DEBUG_PROCESSOR_IDENTIFICATION_X86}
     */
    X86{
        get {
            if(!this.HasProp("__X86"))
                this.__X86 := DEBUG_PROCESSOR_IDENTIFICATION_X86(this.ptr + 0)
            return this.__X86
        }
    }

    /**
     * @type {DEBUG_PROCESSOR_IDENTIFICATION_ARM}
     */
    Arm{
        get {
            if(!this.HasProp("__Arm"))
                this.__Arm := DEBUG_PROCESSOR_IDENTIFICATION_ARM(this.ptr + 0)
            return this.__Arm
        }
    }

    /**
     * @type {DEBUG_PROCESSOR_IDENTIFICATION_ARM64}
     */
    Arm64{
        get {
            if(!this.HasProp("__Arm64"))
                this.__Arm64 := DEBUG_PROCESSOR_IDENTIFICATION_ARM64(this.ptr + 0)
            return this.__Arm64
        }
    }
}

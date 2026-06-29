#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEBUG_PROCESSOR_IDENTIFICATION_X86.ahk" { DEBUG_PROCESSOR_IDENTIFICATION_X86 }
#Import ".\DEBUG_PROCESSOR_IDENTIFICATION_ARM64.ahk" { DEBUG_PROCESSOR_IDENTIFICATION_ARM64 }
#Import ".\DEBUG_PROCESSOR_IDENTIFICATION_IA64.ahk" { DEBUG_PROCESSOR_IDENTIFICATION_IA64 }
#Import ".\DEBUG_PROCESSOR_IDENTIFICATION_ARM.ahk" { DEBUG_PROCESSOR_IDENTIFICATION_ARM }
#Import ".\DEBUG_PROCESSOR_IDENTIFICATION_AMD64.ahk" { DEBUG_PROCESSOR_IDENTIFICATION_AMD64 }
#Import ".\DEBUG_PROCESSOR_IDENTIFICATION_ALPHA.ahk" { DEBUG_PROCESSOR_IDENTIFICATION_ALPHA }
#Import "..\..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_PROCESSOR_IDENTIFICATION_ALL {
    #StructPack 4

    Alpha : DEBUG_PROCESSOR_IDENTIFICATION_ALPHA

    static __New() {
        DefineProp(this.Prototype, 'Amd64', { type: DEBUG_PROCESSOR_IDENTIFICATION_AMD64, offset: 0 })
        DefineProp(this.Prototype, 'Ia64', { type: DEBUG_PROCESSOR_IDENTIFICATION_IA64, offset: 0 })
        DefineProp(this.Prototype, 'X86', { type: DEBUG_PROCESSOR_IDENTIFICATION_X86, offset: 0 })
        DefineProp(this.Prototype, 'Arm', { type: DEBUG_PROCESSOR_IDENTIFICATION_ARM, offset: 0 })
        DefineProp(this.Prototype, 'Arm64', { type: DEBUG_PROCESSOR_IDENTIFICATION_ARM64, offset: 0 })
        this.DeleteProp("__New")
    }
}

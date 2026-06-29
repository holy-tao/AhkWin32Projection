#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ETW_PMC_COUNTER_OWNER_TYPE.ahk" { ETW_PMC_COUNTER_OWNER_TYPE }
#Import ".\ETW_PMC_COUNTER_OWNER.ahk" { ETW_PMC_COUNTER_OWNER }

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct ETW_PMC_COUNTER_OWNERSHIP_STATUS {
    #StructPack 4

    ProcessorNumber : UInt32

    NumberOfCounters : UInt32

    CounterOwners : ETW_PMC_COUNTER_OWNER[1]

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PHYSICAL_MEMORY_RUN64.ahk" { PHYSICAL_MEMORY_RUN64 }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct PHYSICAL_MEMORY_DESCRIPTOR64 {
    #StructPack 8

    NumberOfRuns : UInt32

    NumberOfPages : Int64

    Run : PHYSICAL_MEMORY_RUN64[1]

}

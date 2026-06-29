#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PHYSICAL_MEMORY_RUN32.ahk" { PHYSICAL_MEMORY_RUN32 }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct PHYSICAL_MEMORY_DESCRIPTOR32 {
    #StructPack 4

    NumberOfRuns : UInt32

    NumberOfPages : UInt32

    Run : PHYSICAL_MEMORY_RUN32[1]

}

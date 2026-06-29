#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS.ahk" { WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS }
#Import ".\WHV_MEMORY_ACCESS_TYPE.ahk" { WHV_MEMORY_ACCESS_TYPE }
#Import ".\WHV_ADVISE_GPA_RANGE_POPULATE.ahk" { WHV_ADVISE_GPA_RANGE_POPULATE }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_ADVISE_GPA_RANGE {
    #StructPack 4

    Populate : WHV_ADVISE_GPA_RANGE_POPULATE

}

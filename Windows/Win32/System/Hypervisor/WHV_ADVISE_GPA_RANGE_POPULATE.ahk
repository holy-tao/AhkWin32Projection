#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS.ahk" { WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS }
#Import ".\WHV_MEMORY_ACCESS_TYPE.ahk" { WHV_MEMORY_ACCESS_TYPE }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_ADVISE_GPA_RANGE_POPULATE {
    #StructPack 4

    Flags : WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS

    AccessType : WHV_MEMORY_ACCESS_TYPE

}

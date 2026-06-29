#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JOBOBJECT_IO_ATTRIBUTION_STATS.ahk" { JOBOBJECT_IO_ATTRIBUTION_STATS }

/**
 * @namespace Windows.Win32.System.JobObjects
 */
export default struct JOBOBJECT_IO_ATTRIBUTION_INFORMATION {
    #StructPack 8

    ControlFlags : UInt32

    ReadStats : JOBOBJECT_IO_ATTRIBUTION_STATS

    WriteStats : JOBOBJECT_IO_ATTRIBUTION_STATS

}

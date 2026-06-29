#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SD_QUERY_STATS_OUTPUT.ahk" { SD_QUERY_STATS_OUTPUT }
#Import ".\SD_CHANGE_MACHINE_SID_OUTPUT.ahk" { SD_CHANGE_MACHINE_SID_OUTPUT }
#Import ".\SD_ENUM_SDS_ENTRY.ahk" { SD_ENUM_SDS_ENTRY }
#Import ".\SD_ENUM_SDS_OUTPUT.ahk" { SD_ENUM_SDS_OUTPUT }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SD_GLOBAL_CHANGE_OUTPUT {
    #StructPack 8

    Flags : UInt32

    ChangeType : UInt32

    SdChange : SD_CHANGE_MACHINE_SID_OUTPUT

    static __New() {
        DefineProp(this.Prototype, 'SdQueryStats', { type: SD_QUERY_STATS_OUTPUT, offset: 8 })
        DefineProp(this.Prototype, 'SdEnumSds', { type: SD_ENUM_SDS_OUTPUT, offset: 8 })
        this.DeleteProp("__New")
    }
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SD_ENUM_SDS_INPUT.ahk" { SD_ENUM_SDS_INPUT }
#Import ".\SD_QUERY_STATS_INPUT.ahk" { SD_QUERY_STATS_INPUT }
#Import ".\SD_CHANGE_MACHINE_SID_INPUT.ahk" { SD_CHANGE_MACHINE_SID_INPUT }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SD_GLOBAL_CHANGE_INPUT {
    #StructPack 8

    Flags : UInt32

    ChangeType : UInt32

    SdChange : SD_CHANGE_MACHINE_SID_INPUT

    static __New() {
        DefineProp(this.Prototype, 'SdQueryStats', { type: SD_QUERY_STATS_INPUT, offset: 8 })
        DefineProp(this.Prototype, 'SdEnumSds', { type: SD_ENUM_SDS_INPUT, offset: 8 })
        this.DeleteProp("__New")
    }
}

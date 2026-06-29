#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PM_TILE_HUBTYPE.ahk" { PM_TILE_HUBTYPE }
#Import ".\PM_APPLICATION_HUBTYPE.ahk" { PM_APPLICATION_HUBTYPE }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\PM_APP_GENRE.ahk" { PM_APP_GENRE }
#Import ".\PM_BSATASKID.ahk" { PM_BSATASKID }
#Import ".\PM_BWTASKID.ahk" { PM_BWTASKID }
#Import ".\PM_EXTENSIONCONSUMER.ahk" { PM_EXTENSIONCONSUMER }
#Import ".\PM_TASK_TYPE.ahk" { PM_TASK_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\PM_APPTASKTYPE.ahk" { PM_APPTASKTYPE }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct PM_ENUM_FILTER {
    #StructPack 8


    struct _FilterParameter {
        Dummy : Int32

        static __New() {
            DefineProp(this.Prototype, 'Genre', { type: PM_APP_GENRE, offset: 0 })
            DefineProp(this.Prototype, 'AppHubType', { type: PM_APPLICATION_HUBTYPE, offset: 0 })
            DefineProp(this.Prototype, 'HubType', { type: PM_TILE_HUBTYPE, offset: 0 })
            DefineProp(this.Prototype, 'Tasktype', { type: PM_TASK_TYPE, offset: 0 })
            DefineProp(this.Prototype, 'TaskProductID', { type: Guid, offset: 0 })
            DefineProp(this.Prototype, 'TileProductID', { type: Guid, offset: 0 })
            DefineProp(this.Prototype, 'AppTaskType', { type: PM_APPTASKTYPE, offset: 0 })
            DefineProp(this.Prototype, 'Consumer', { type: PM_EXTENSIONCONSUMER, offset: 0 })
            DefineProp(this.Prototype, 'BSATask', { type: PM_BSATASKID, offset: 0 })
            DefineProp(this.Prototype, 'BSAProductID', { type: Guid, offset: 0 })
            DefineProp(this.Prototype, 'BWTask', { type: PM_BWTASKID, offset: 0 })
            DefineProp(this.Prototype, 'ProtocolName', { type: BSTR, offset: 0 })
            DefineProp(this.Prototype, 'FileType', { type: BSTR, offset: 0 })
            DefineProp(this.Prototype, 'ContentType', { type: BSTR, offset: 0 })
            DefineProp(this.Prototype, 'AppSupportedFileExtPID', { type: Guid, offset: 0 })
            DefineProp(this.Prototype, 'ShareTargetFileType', { type: BSTR, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    FilterType : Int32

    FilterParameter : PM_ENUM_FILTER._FilterParameter

}

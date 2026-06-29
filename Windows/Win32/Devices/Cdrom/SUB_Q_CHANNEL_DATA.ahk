#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SUB_Q_TRACK_ISRC.ahk" { SUB_Q_TRACK_ISRC }
#Import ".\SUB_Q_MEDIA_CATALOG_NUMBER.ahk" { SUB_Q_MEDIA_CATALOG_NUMBER }
#Import ".\SUB_Q_CURRENT_POSITION.ahk" { SUB_Q_CURRENT_POSITION }
#Import ".\SUB_Q_HEADER.ahk" { SUB_Q_HEADER }

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct SUB_Q_CHANNEL_DATA {
    #StructPack 1

    CurrentPosition : SUB_Q_CURRENT_POSITION

    static __New() {
        DefineProp(this.Prototype, 'MediaCatalog', { type: SUB_Q_MEDIA_CATALOG_NUMBER, offset: 0 })
        DefineProp(this.Prototype, 'TrackIsrc', { type: SUB_Q_TRACK_ISRC, offset: 0 })
        this.DeleteProp("__New")
    }
}

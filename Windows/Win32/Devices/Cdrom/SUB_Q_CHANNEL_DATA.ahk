#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SUB_Q_HEADER.ahk
#Include .\SUB_Q_CURRENT_POSITION.ahk
#Include .\SUB_Q_MEDIA_CATALOG_NUMBER.ahk
#Include .\SUB_Q_TRACK_ISRC.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 * @version v4.0.30319
 */
class SUB_Q_CHANNEL_DATA extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {SUB_Q_CURRENT_POSITION}
     */
    CurrentPosition{
        get {
            if(!this.HasProp("__CurrentPosition"))
                this.__CurrentPosition := SUB_Q_CURRENT_POSITION(0, this)
            return this.__CurrentPosition
        }
    }

    /**
     * @type {SUB_Q_MEDIA_CATALOG_NUMBER}
     */
    MediaCatalog{
        get {
            if(!this.HasProp("__MediaCatalog"))
                this.__MediaCatalog := SUB_Q_MEDIA_CATALOG_NUMBER(0, this)
            return this.__MediaCatalog
        }
    }

    /**
     * @type {SUB_Q_TRACK_ISRC}
     */
    TrackIsrc{
        get {
            if(!this.HasProp("__TrackIsrc"))
                this.__TrackIsrc := SUB_Q_TRACK_ISRC(0, this)
            return this.__TrackIsrc
        }
    }
}

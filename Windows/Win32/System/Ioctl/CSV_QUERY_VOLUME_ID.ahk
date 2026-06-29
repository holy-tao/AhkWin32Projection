#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CSV_QUERY_VOLUME_ID extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Guid}
     */
    VolumeId {
        get {
            if(!this.HasProp("__VolumeId"))
                this.__VolumeId := Guid(0, this)
            return this.__VolumeId
        }
    }
}

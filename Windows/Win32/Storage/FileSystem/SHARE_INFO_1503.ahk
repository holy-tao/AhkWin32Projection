#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class SHARE_INFO_1503 extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Guid}
     */
    shi1503_sharefilter {
        get {
            if(!this.HasProp("__shi1503_sharefilter"))
                this.__shi1503_sharefilter := Guid(0, this)
            return this.__shi1503_sharefilter
        }
    }
}

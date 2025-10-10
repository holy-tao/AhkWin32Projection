#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CLS_CONTAINER_INFORMATION.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CLS_ARCHIVE_DESCRIPTOR extends Win32Struct
{
    static sizeof => 592

    static packingSize => 8

    /**
     * @type {Integer}
     */
    coffLow {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    coffHigh {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {CLS_CONTAINER_INFORMATION}
     */
    infoContainer{
        get {
            if(!this.HasProp("__infoContainer"))
                this.__infoContainer := CLS_CONTAINER_INFORMATION(this.ptr + 16)
            return this.__infoContainer
        }
    }
}

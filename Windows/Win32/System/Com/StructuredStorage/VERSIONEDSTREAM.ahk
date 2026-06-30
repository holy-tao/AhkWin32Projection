#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\IStream.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
class VERSIONEDSTREAM extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Guid}
     */
    guidVersion {
        get {
            if(!this.HasProp("__guidVersion"))
                this.__guidVersion := Guid(0, this)
            return this.__guidVersion
        }
    }

    /**
     * @type {IStream}
     */
    pStream {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}

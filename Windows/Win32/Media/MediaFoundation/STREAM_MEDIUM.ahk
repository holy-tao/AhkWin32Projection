#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Not for application use.
 * @remarks
 * This structure is used internally by the Microsoft Media Foundation AVStream proxy.
 * @see https://learn.microsoft.com/windows/win32/api/mftransform/ns-mftransform-stream_medium
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class STREAM_MEDIUM extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * Reserved.
     * @type {Guid}
     */
    gidMedium {
        get {
            if(!this.HasProp("__gidMedium"))
                this.__gidMedium := Guid(0, this)
            return this.__gidMedium
        }
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    unMediumInstance {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}

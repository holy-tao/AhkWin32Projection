#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class RESOURCEMANAGER_BASIC_INFORMATION extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {Guid}
     */
    ResourceManagerId {
        get {
            if(!this.HasProp("__ResourceManagerId"))
                this.__ResourceManagerId := Guid(0, this)
            return this.__ResourceManagerId
        }
    }

    /**
     * @type {Integer}
     */
    DescriptionLength {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {String}
     */
    Description {
        get => StrGet(this.ptr + 20, 0, "UTF-16")
        set => StrPut(value, this.ptr + 20, 0, "UTF-16")
    }
}

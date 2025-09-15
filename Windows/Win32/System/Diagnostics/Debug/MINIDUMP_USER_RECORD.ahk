#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\MINIDUMP_LOCATION_DESCRIPTOR.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_USER_RECORD extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {MINIDUMP_LOCATION_DESCRIPTOR}
     */
    Memory{
        get {
            if(!this.HasProp("__Memory"))
                this.__Memory := MINIDUMP_LOCATION_DESCRIPTOR(this.ptr + 8)
            return this.__Memory
        }
    }
}

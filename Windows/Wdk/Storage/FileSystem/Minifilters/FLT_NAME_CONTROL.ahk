#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Win32\Foundation\UNICODE_STRING.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 * @version v4.0.30319
 */
class FLT_NAME_CONTROL extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {UNICODE_STRING}
     */
    Name{
        get {
            if(!this.HasProp("__Name"))
                this.__Name := UNICODE_STRING(0, this)
            return this.__Name
        }
    }
}

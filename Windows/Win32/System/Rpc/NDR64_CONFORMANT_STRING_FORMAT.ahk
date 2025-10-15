#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDR64_STRING_FLAGS.ahk
#Include .\NDR64_STRING_HEADER_FORMAT.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class NDR64_CONFORMANT_STRING_FORMAT extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {NDR64_STRING_HEADER_FORMAT}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := NDR64_STRING_HEADER_FORMAT(this.ptr + 0)
            return this.__Header
        }
    }
}

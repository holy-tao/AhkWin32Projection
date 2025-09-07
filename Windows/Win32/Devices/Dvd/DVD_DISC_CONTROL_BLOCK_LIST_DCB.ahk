#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class DVD_DISC_CONTROL_BLOCK_LIST_DCB extends Win32Struct
{
    static sizeof => 4

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    DcbIdentifier{
        get {
            if(!this.HasProp("__DcbIdentifierProxyArray"))
                this.__DcbIdentifierProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__DcbIdentifierProxyArray
        }
    }
}

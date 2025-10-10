#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class WMDM_PROP_VALUES_ENUM extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cEnumValues {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<PROPVARIANT>}
     */
    pValues {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

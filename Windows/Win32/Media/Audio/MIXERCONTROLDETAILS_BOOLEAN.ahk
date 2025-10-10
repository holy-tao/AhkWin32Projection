#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class MIXERCONTROLDETAILS_BOOLEAN extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    fValue {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}

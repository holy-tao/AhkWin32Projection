#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHDETW_DESTROYVIDEOPROCESSOR extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Integer}
     */
    pObject {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
